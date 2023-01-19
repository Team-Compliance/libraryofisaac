---@class PickingUpItem
---@field ID CollectibleType | TrinketType
---@field Type ItemType

local function OnTSILLoaded()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "PlayersPickingUpItemMap_ITEM_PICKUP_CALLBACK_LOGIC",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "ITEM_PICKUP_CALLBACK_LOGIC_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoaded
)


---@param itemType ItemType
local function GetInventoryTypeFromItemType(itemType)
    if itemType == ItemType.ITEM_NULL then
        return TSIL.Enums.InventoryType.COLLECTIBLE
    elseif itemType == ItemType.ITEM_TRINKET then
        return TSIL.Enums.InventoryType.TRINKET
    else
        return TSIL.Enums.InventoryType.COLLECTIBLE
    end
end


---@param player EntityPlayer
---@param pickingUpItem PickingUpItem
local function QueueEmpty(player, pickingUpItem)
    if pickingUpItem.ID == CollectibleType.COLLECTIBLE_NULL or
        pickingUpItem.Type == ItemType.ITEM_NULL then
        return
    end

    TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.POST_ITEM_PICKUP,
        player,
        pickingUpItem.ID,
        GetInventoryTypeFromItemType(pickingUpItem.Type)
    )

    pickingUpItem.Type = ItemType.ITEM_NULL
    pickingUpItem.ID = CollectibleType.COLLECTIBLE_NULL
end


---@param player EntityPlayer
---@param pickingUpItem PickingUpItem
local function QueueNotEmpty(player, pickingUpItem)
    local queuedItem = player.QueuedItem.Item;
    if queuedItem == nil or queuedItem.Type == ItemType.ITEM_NULL then
        return
    end

    if queuedItem.Type ~= pickingUpItem.Type or
        queuedItem.ID ~= pickingUpItem.ID then
        pickingUpItem.ID = queuedItem.ID
        pickingUpItem.Type = queuedItem.Type

        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.PRE_ITEM_PICKUP,
            player,
            pickingUpItem.ID,
            GetInventoryTypeFromItemType(pickingUpItem.Type)
        )
    end
end


---@param player EntityPlayer
local function OnPeffectUpdate(_, player)
    local pickingUpItemMap = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "PlayersPickingUpItemMap_ITEM_PICKUP_CALLBACK_LOGIC"
    )

    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local pickingUpItem = pickingUpItemMap[tostring(playerIndex)]

    if pickingUpItem == nil then
        pickingUpItem = {
            ID = CollectibleType.COLLECTIBLE_NULL,
            Type = ItemType.ITEM_NULL
        }

        pickingUpItemMap[tostring(playerIndex)] = pickingUpItem
    end

    if player:IsItemQueueEmpty() then
        QueueEmpty(player, pickingUpItem);
    else
        QueueNotEmpty(player, pickingUpItem);
    end
end
TSIL.__AddInternalCallback(
    "ITEM_PICKUP_CALLBACK_LOGIC_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPeffectUpdate
)
