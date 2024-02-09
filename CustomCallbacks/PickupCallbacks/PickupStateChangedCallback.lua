--##POST_PICKUP_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PICKUP_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param pickup EntityPickup
local function OnPickupUpdate(_, pickup)
    local pickupStateLastFrame = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        pickup,
        "PickupStateLastFrame_PICKUP_STATE_CHANGED"
    )
    local pickupStateCurrentFrame = pickup.State

    if pickupStateLastFrame ~= nil and
    pickupStateLastFrame ~= pickupStateCurrentFrame then
        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_PICKUP_STATE_CHANGED,
            pickup,
            pickupStateLastFrame,
            pickupStateCurrentFrame
        )
    end

    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        pickup,
        "PickupStateLastFrame_PICKUP_STATE_CHANGED",
        pickupStateCurrentFrame
    )
end
TSIL.__AddInternalCallback(
    "PICKUP_STATE_CHANGED_CALLBACK_ON_PICKUP_UPDATE",
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    OnPickupUpdate
)