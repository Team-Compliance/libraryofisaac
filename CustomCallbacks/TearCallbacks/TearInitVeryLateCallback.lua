--##POST_TEAR_INIT_VERY_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_TEAR_INIT_VERY_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


---@param tear EntityTear
local function OnTearUpdate(_, tear)
    local timesTriggered = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        tear,
        "timesTriggered_TEAR_INIT_VERY_LATE_CALLBACK"
    )
    if not timesTriggered then
        timesTriggered = 0
    end

    if timesTriggered > 1 then return end

    timesTriggered = timesTriggered + 1
    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        tear,
        "timesTriggered_TEAR_INIT_VERY_LATE_CALLBACK",
        timesTriggered
    )

    if timesTriggered == 2 then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_TEAR_INIT_VERY_LATE, tear)
    end
end
TSIL.__AddInternalCallback(
    "TEAR_INIT_VERY_LATE_CALLBACK_ON_TEAR_UPDATE",
    ModCallbacks.MC_POST_TEAR_UPDATE,
    OnTearUpdate
)