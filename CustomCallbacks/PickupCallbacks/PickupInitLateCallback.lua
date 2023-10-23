--##POST_PICKUP_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PICKUP_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param pickup EntityPickup
local function OnPickupUpdate(_, pickup)
    local hasTriggered = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        pickup,
        "HasTriggeredCallback_PICKUP_INIT_LATE_CALLBACK"
    )

    if not hasTriggered then
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            pickup,
            "HasTriggeredCallback_LASER_INIT_LATE_CALLBACK",
            true
        )
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PICKUP_INIT_LATE, pickup)
    end
end
TSIL.__AddInternalCallback(
    "PICKUP_INIT_LATE_CALLBACK_PICKUP_UPDATE",
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    OnPickupUpdate
)