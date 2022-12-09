--- @class InventoryObject
--- @field Type InventoryType
--- @field Id CollectibleType | TrinketType

--- @class PlayerInventory
--- @field PlayerIndex integer
--- @field InventoryOrdered InventoryObject[]
--- @field GulpedTrinkets {[string]: integer}
--- @field CollectedItems {[string]: integer}


--- @param player EntityPlayer
--- @param playerState PlayerInventory
local function CheckCollectedItems(player, playerState)
	local itemConfig = Isaac.GetItemConfig()
	local itemList = itemConfig:GetCollectibles()

	--itemList.Size actually returns the last item id, not the actual size
	for id = 1, itemList.Size - 1, 1 do
		local item = itemConfig:GetCollectible(id)
		--Only check for non active items
		if item and item.Type ~= ItemType.ITEM_ACTIVE then
			local itemId = item.ID
			local itemIdStr = tostring(itemId)

			local pastCollectibleNum = playerState.CollectedItems[itemIdStr] or 0
			--- @diagnostic disable-next-line: param-type-mismatch
			local actualCollectibleNum = player:GetCollectibleNum(itemId, true)

			if actualCollectibleNum > pastCollectibleNum then
				--If the actual num is bigger than what we had, player has picked up an item
				playerState.CollectedItems[itemIdStr] = actualCollectibleNum
				for _ = 1, actualCollectibleNum - pastCollectibleNum, 1 do
					table.insert(playerState.InventoryOrdered, { Type = TSIL.Enums.InventoryType.COLLECTIBLE, Id = itemId })
				end

				TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_ADDED, player, itemId)
			elseif actualCollectibleNum < pastCollectibleNum then
				--If the actual num is smaller than what we had, player has lost an item
				playerState.CollectedItems[itemIdStr] = actualCollectibleNum

				for i = 1, #playerState.InventoryOrdered, 1 do
					local inventoryItem = playerState.InventoryOrdered[i]
					if inventoryItem.Type == TSIL.Enums.InventoryType.COLLECTIBLE and inventoryItem.Id == itemId then
						for _ = 1, pastCollectibleNum - actualCollectibleNum, 1 do
							table.remove(playerState.InventoryOrdered, i)
						end
						break
					end
				end

				TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_REMOVED, player, itemId)
			end
		end
	end
end


--- @param player EntityPlayer
--- @param playerState PlayerInventory
local function CheckGulpedTrinkets(player, playerState)
	local itemConfig = Isaac.GetItemConfig()
	local trinketList = itemConfig:GetTrinkets()

	--itemList.Size actually returns the last item id, not the actual size
	for id = 1, trinketList.Size - 1, 1 do
		local trinket = itemConfig:GetTrinket(id)
		--Only check for non active items
		if trinket then
			local trinketId = trinket.ID
			local trinketIdStr = tostring(trinketId)

			local pastGulpedNum = playerState.GulpedTrinkets[trinketIdStr] or 0
			--- @cast trinketId TrinketType
			local actualGulpedNum = TSIL.Players.GetSmeltedTrinketMultiplier(player, trinketId)

			if actualGulpedNum > pastGulpedNum then
				--If the actual num is bigger than what we had, player has gulped a trinket
				playerState.GulpedTrinkets[trinketIdStr] = actualGulpedNum

				for _ = 1, actualGulpedNum - pastGulpedNum, 1 do
					table.insert(playerState.InventoryOrdered, { Type = TSIL.Enums.InventoryType.TRINKET, Id = trinketId })
				end

				TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_ADDED, player, trinketId)
			elseif actualGulpedNum < pastGulpedNum then
				--If the actual num is smaller than what we had, player has lost an item
				playerState.GulpedTrinkets[trinketIdStr] = actualGulpedNum

				for i = 1, #playerState.InventoryOrdered, 1 do
					local inventoryItem = playerState.InventoryOrdered[i]
					if inventoryItem.Type == TSIL.Enums.InventoryType.TRINKET and inventoryItem.Id == trinketId then

						for _ = 1, pastGulpedNum - actualGulpedNum, 1 do
							table.remove(playerState.InventoryOrdered, i)
						end

						break
					end
				end

				TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_REMOVED, player, trinketId)
			end
		end
	end
end


--- @param player EntityPlayer
local function OnPeffectUpdate(_, player)
	--- @type PlayerInventory[]
	local playerInventories = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "PLAYER_INVENTORIES")
	local playerIndex = TSIL.Players.GetPlayerIndex(player)
	local playerInventory = TSIL.Utils.Tables.FindFirst(playerInventories, function(_, playerInventory)
		return playerInventory.PlayerIndex == playerIndex
	end)

	if not playerInventory then
		local newInventory = {
			PlayerIndex = playerIndex,
			InventoryOrdered = {},
			GulpedTrinkets = {},
			CollectedItems = {}
		}
		--If for some reason the current state is nil, initialize it again
		table.insert(playerInventories, newInventory)

		playerInventory = newInventory
	end

	CheckCollectedItems(player, playerInventory)

	CheckGulpedTrinkets(player, playerInventory)
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_PEFFECT_UPDATE",
	ModCallbacks.MC_POST_PEFFECT_UPDATE,
	OnPeffectUpdate
)


local function OnTSILLoaded()
	TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "PLAYER_INVENTORIES", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_TSIL_LOADED",
	TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
	OnTSILLoaded
)

--- Returns a list of all the items/gulped trinkets (things that appear on the extra HUD) ordered by the time they were collected.
--- This method is not perfect and will fail if the player rerolls all of their items or a mod gives several items in the same frame.
--- @param player EntityPlayer
--- @param inventoryTypeFilter? InventoryType
--- @return InventoryObject[]
function TSIL.Players.GetPlayerInventory(player, inventoryTypeFilter)
	local playerIndex = TSIL.Players.GetPlayerIndex(player)

	local TablesUtils = TSIL.Utils.Tables

	--- @type PlayerInventory[]
	local playerInventories = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "PLAYER_INVENTORIES")

	local chosenInventory = TablesUtils.Filter(playerInventories, function(_, playerInventory)
		return playerInventory.PlayerIndex == playerIndex
	end)[1].InventoryOrdered

	if inventoryTypeFilter then
		local filteredInventory = TablesUtils.Filter(chosenInventory, function(_, inventoryItem)
			return inventoryItem.Type == inventoryTypeFilter
		end)

		return filteredInventory
	else
		return TablesUtils.Copy(chosenInventory)
	end
end