--##POST_FAMILIAR_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_FAMILIAR_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param familiar EntityFamiliar
local function OnFamiliarUpdate(_, familiar)
    local hasTriggered = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        familiar,
        "HasTriggeredCallback_FAMILIAR_INIT_LATE_CALLBACK"
    )

    if not hasTriggered then
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            familiar,
            "HasTriggeredCallback_FAMILIAR_INIT_LATE_CALLBACK",
            true
        )
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_FAMILIAR_INIT_LATE, familiar)
    end
end
TSIL.__AddInternalCallback(
    "FAMILIAR_INIT_LATE_CALLBACK_ON_FAMILIAR_UPDATE",
    ModCallbacks.MC_FAMILIAR_UPDATE,
    OnFamiliarUpdate
)