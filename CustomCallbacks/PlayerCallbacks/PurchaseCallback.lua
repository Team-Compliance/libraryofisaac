--##POST_PURCHASE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PURCHASE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "playersHoldingItemOnLastFrameMap_POST_PURCHASE_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "POST_PURCHASE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function PlayerPickedUpNewItem(player)
    local pickups = TSIL.EntitySpecific.GetPickups()
    local purchasedPickup = TSIL.Utils.Tables.FindFirst(pickups, function (_, pickup)
        return not pickup:Exists() and pickup.Price ~= 0
    end)

    if purchasedPickup ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PURCHASE, player, purchasedPickup)
    end
end


---@param player EntityPlayer
local function OnPEffectUpdate(_, player)
    local playersHoldingItemOnLastFrameMap = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "playersHoldingItemOnLastFrameMap_POST_PURCHASE_CALLBACK")

    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local playerIndexStr = tostring(playerIndex)

    local isHoldingItem = player:IsHoldingItem()
    local holdingItemLastFrame = playersHoldingItemOnLastFrameMap[playerIndexStr]
    playersHoldingItemOnLastFrameMap[playerIndexStr] = isHoldingItem

    if isHoldingItem and not holdingItemLastFrame then
        PlayerPickedUpNewItem(player)
    end
end
TSIL.__AddInternalCallback(
    "POST_PURCHASE_CALLBACK_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPEffectUpdate
)