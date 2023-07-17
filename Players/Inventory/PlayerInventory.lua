--- @class InventoryObject
--- @field Type InventoryType
--- @field Id CollectibleType | TrinketType


local function OnTSILLoaded()
    TSIL.SaveManager.AddPersistentVariable(
		TSIL.__MOD,
		"playerInventories_PLAYER_INVENTORY",
		{},
		TSIL.Enums.VariablePersistenceMode.RESET_RUN
	)
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_TSIL_LOADED",
	TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
	OnTSILLoaded
)


---@param player EntityPlayer
---@return InventoryObject[]
local function GetPlayerInventory(player)
	local playerIndex = TSIL.Players.GetPlayerIndex(player)
	local playerInventories = TSIL.SaveManager.GetPersistentVariable(
		TSIL.__MOD,
		"playerInventories_PLAYER_INVENTORY"
	)

	local inventory = playerInventories[playerIndex]
	if not inventory then
		inventory = {}
		playerInventories[playerIndex] = inventory
	end

	return inventory
end


---@param player EntityPlayer
---@param item CollectibleType
local function OnCollectibleAdded(_, player, item)
	if not TSIL.Collectibles.IsPassiveCollectible(item) then return end

	local inventory = GetPlayerInventory(player)

	inventory[#inventory+1] = {
		Id = item,
		Type = TSIL.Enums.InventoryType.COLLECTIBLE
	}
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_ON_COLLECTIBLE_ADDED",
	TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_ADDED,
	OnCollectibleAdded
)


local function OnCollectibleRemoved(_, player, item)
	local inventory = GetPlayerInventory(player)

	for index, inventoryObject in ipairs(inventory) do
		if inventoryObject.Type == TSIL.Enums.InventoryType.COLLECTIBLE
		and inventoryObject.Id == item then
			table.remove(inventory, index)
			break
		end
	end
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_ON_COLLECTIBLE_REMOVED",
	TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_REMOVED,
	OnCollectibleRemoved
)


---@param player EntityPlayer
---@param trinket TrinketType
local function OnGulpedTrinketAdded(_, player, trinket)
	local inventory = GetPlayerInventory(player)

	inventory[#inventory+1] = {
		Id = trinket,
		Type = TSIL.Enums.InventoryType.TRINKET
	}
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_ON_GULPED_TRINKET_ADDED",
	TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_ADDED,
	OnGulpedTrinketAdded
)


---@param player EntityPlayer
---@param trinket TrinketType
local function OnGulpedTrinketRemoved(_, player, trinket)
	local inventory = GetPlayerInventory(player)

	for index, inventoryObject in ipairs(inventory) do
		if inventoryObject.Type == TSIL.Enums.InventoryType.TRINKET
		and inventoryObject.Id == trinket then
			table.remove(inventory, index)
			break
		end
	end
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_ON_GULPED_TRINKET_REMOVED",
	TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_REMOVED,
	OnGulpedTrinketRemoved
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

	local playerInventories = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "playerInventories_PLAYER_INVENTORY")

	if playerInventories[playerIndex] == nil then
		return {}
	end

	local chosenInventory = playerInventories[playerIndex]

	if inventoryTypeFilter then
		local filteredInventory = TablesUtils.Filter(chosenInventory, function(_, inventoryItem)
			return inventoryItem.Type == inventoryTypeFilter
		end)

		return filteredInventory
	else
		return TablesUtils.Copy(chosenInventory)
	end
end