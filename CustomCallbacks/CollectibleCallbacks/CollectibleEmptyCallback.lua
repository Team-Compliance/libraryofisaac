--##POST_COLLECTIBLE_EMPTY
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_COLLECTIBLE_EMPTY,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.NONE,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)


---@param collectible EntityPickup
local function OnCollectibleUpdate(_, collectible)

    local oldCollectibleType = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        collectible,
        "collectibleType_COLLECTIBLE_EMPTY_CALLBACK"
    )
    if oldCollectibleType == nil then
        oldCollectibleType = collectible.SubType
    end

    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        collectible,
        "collectibleType_COLLECTIBLE_EMPTY_CALLBACK",
        collectible.SubType
    )

    if oldCollectibleType ~= collectible.SubType and
    collectible.SubType == CollectibleType.COLLECTIBLE_NULL then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_COLLECTIBLE_EMPTY, collectible, oldCollectibleType)
    end
end
TSIL.__AddInternalCallback(
    "COLLECTIBLE_EMPTY_CALLBACK_PICKUP_COLLECTIBLE_UPDATE",
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    OnCollectibleUpdate,
    CallbackPriority.DEFAULT,
    PickupVariant.PICKUP_COLLECTIBLE
)