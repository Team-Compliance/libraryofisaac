--##POST_KNIFE_INIT_LATE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_KNIFE_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)

---@param knife EntityKnife
local function OnKnifeUpdate(_, knife)
    local hasTriggered = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        knife,
        "HasTriggeredCallback_KNIFE_INIT_LATE_CALLBACK"
    )

    if not hasTriggered then
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            knife,
            "HasTriggeredCallback_KNIFE_INIT_LATE_CALLBACK",
            true
        )
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_KNIFE_INIT_LATE, knife)
    end
end
TSIL.__AddInternalCallback(
    "KNIFE_INIT_LATE_CALLBACK_ON_KNIFE_UPDATE",
    ModCallbacks.MC_POST_KNIFE_UPDATE,
    OnKnifeUpdate
)