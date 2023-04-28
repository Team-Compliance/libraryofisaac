--- @class InventoryObject
--- @field Type InventoryType
--- @field Id CollectibleType | TrinketType

--- @class PlayerInventory
--- @field InventoryOrdered InventoryObject[]
--- @field GulpedTrinkets {[string]: integer}
--- @field CollectedItems {[string]: integer}


---@param item ItemConfig_Item
---@param player EntityPlayer
---@param playerInventory PlayerInventory
---@param playerHistory table
local function CheckItemInInventory(item, player, playerInventory, playerHistory)
	local itemID = item.ID

	local pastCollectibleNum = playerInventory.CollectedItems[itemID] or 0
	local actualCollectibleNum = player:GetCollectibleNum(itemID, true)

	if actualCollectibleNum > pastCollectibleNum then
		--If the actual num is bigger than what we had, player has picked up an item
		playerInventory.CollectedItems[itemID] = actualCollectibleNum
		for _ = 1, actualCollectibleNum - pastCollectibleNum, 1 do
			table.insert(
				playerInventory.InventoryOrdered,
				{
					Type = TSIL.Enums.InventoryType.COLLECTIBLE,
					Id = itemID
				}
			)
		end

		local pickedUpItemBefore = playerHistory[itemID] == nil
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_ADDED, player, itemID, pickedUpItemBefore)
		playerHistory[itemID] = true
	elseif actualCollectibleNum < pastCollectibleNum then
		--If the actual num is smaller than what we had, player has lost an item
		playerInventory.CollectedItems[itemID] = actualCollectibleNum

		local numItemsFound = 0
		local indexesToRemove = {}
		for index, inventoryItem in ipairs(playerInventory.InventoryOrdered) do
			if inventoryItem.Type == TSIL.Enums.InventoryType.COLLECTIBLE and
			inventoryItem.Id == itemID then
				--We substract the number of items found to account for removing earlier indexes
				indexesToRemove[#indexesToRemove+1] = index - numItemsFound
				numItemsFound = numItemsFound + 1

				if numItemsFound >= pastCollectibleNum - actualCollectibleNum then
					--We found all the items we need to remove
					break
				end
			end
		end

		for _, indexToRemove in ipairs(indexesToRemove) do
			table.remove(playerInventory.InventoryOrdered, indexToRemove)
		end

		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_REMOVED, player, itemID)
	end
end


---@param player EntityPlayer
---@param playerState PlayerInventory
---@param playerHistory table
local function CheckCollectedItems(player, playerState, playerHistory)
	local items = TSIL.Collectibles.GetCollectibles()

	for _, item in ipairs(items) do
		CheckItemInInventory(item, player, playerState, playerHistory)
	end
end


---@param player EntityPlayer
---@param playerState PlayerInventory
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


---@param player EntityPlayer
local function OnPeffectUpdate(_, player)
	--- @type PlayerInventory[]
	local playerInventories = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "PLAYER_INVENTORIES")
	local playerHistories = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "PLAYER_ITEM_HISTORIES")

	local playerIndex = TSIL.Players.GetPlayerIndex(player)

	local playerInventory = playerInventories[playerIndex]
	local playerHistory = playerHistories[playerIndex]

	if not playerInventory then
		playerInventory = {
			PlayerIndex = playerIndex,
			InventoryOrdered = {},
			GulpedTrinkets = {},
			CollectedItems = {}
		}
		playerInventories[playerIndex] = playerInventory
	end

	if not playerHistory then
		playerHistory = {}
		playerHistories[playerIndex] = playerHistory
	end

	CheckCollectedItems(player, playerInventory, playerHistory)

	CheckGulpedTrinkets(player, playerInventory)
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_PEFFECT_UPDATE",
	ModCallbacks.MC_POST_PEFFECT_UPDATE,
	OnPeffectUpdate
)


local function OnTSILLoaded()
	TSIL.SaveManager.AddPersistentVariable(
		TSIL.__MOD,
		"PLAYER_INVENTORIES",
		{},
		TSIL.Enums.VariablePersistenceMode.RESET_RUN
	)
	TSIL.SaveManager.AddPersistentVariable(
		TSIL.__MOD,
		"PLAYER_ITEM_HISTORIES",
		{},
		TSIL.Enums.VariablePersistenceMode.RESET_RUN
	)
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_TSIL_LOADED",
	TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
	OnTSILLoaded
)

--- Returns a list of all the items/gulped trinkets (things that appear on the extra HUD) ordered by
--- the time they were collected.
---
--- This method is not perfect and will fail if the player rerolls all of their items or a mod gives
--- several items in the same frame.
---@param player EntityPlayer
---@param inventoryTypeFilter? InventoryType
---@return InventoryObject[]
function TSIL.Players.GetPlayerInventory(player, inventoryTypeFilter)
	local playerIndex = TSIL.Players.GetPlayerIndex(player)

	local TablesUtils = TSIL.Utils.Tables

	--- @type PlayerInventory[]
	local playerInventories = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "PLAYER_INVENTORIES")

	if playerInventories[playerIndex] == nil then
		return {}
	end

	local chosenInventory = playerInventories[playerIndex].InventoryOrdered

	if inventoryTypeFilter then
		local filteredInventory = TablesUtils.Filter(chosenInventory, function(_, inventoryItem)
			return inventoryItem.Type == inventoryTypeFilter
		end)

		return filteredInventory
	else
		return TablesUtils.Copy(chosenInventory)
	end
end