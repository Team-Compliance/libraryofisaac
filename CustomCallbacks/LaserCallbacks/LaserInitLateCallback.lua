--##POST_LASER_INIT_LATE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_LASER_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param laser EntityLaser
local function OnLaserUpdate(_, laser)
    local hasTriggered = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        laser,
        "HasTriggeredCallback_LASER_INIT_LATE_CALLBACK"
    )

    if not hasTriggered then
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            laser,
            "HasTriggeredCallback_LASER_INIT_LATE_CALLBACK",
            true
        )
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_LASER_INIT_LATE, laser)
    end
end
TSIL.__AddInternalCallback(
    "LASER_INIT_LATE_CALLBACK_ON_LASER_UPDATE",
    ModCallbacks.MC_POST_LASER_UPDATE,
    OnLaserUpdate
)