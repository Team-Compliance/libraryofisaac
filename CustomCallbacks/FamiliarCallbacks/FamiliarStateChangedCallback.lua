--##POST_FAMILIAR_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_FAMILIAR_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param familiar EntityFamiliar
local function OnFamiliarUpdate(_, familiar)
    local previousState = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        familiar,
        "familiarStateLastFrame_FAMILIAR_STATE_CHANGED_CALLBACK"
    )
    local currentState = familiar.State
    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        familiar,
        "familiarStateLastFrame_FAMILIAR_STATE_CHANGED_CALLBACK",
        currentState
    )

    if previousState == nil or previousState == currentState then
        return
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_FAMILIAR_STATE_CHANGED, familiar, previousState, currentState)
end
TSIL.__AddInternalCallback(
    "FAMILIAR_STATE_CHANGED_CALLBACK_ON_FAMILIAR_UPDATE",
    ModCallbacks.MC_FAMILIAR_UPDATE,
    OnFamiliarUpdate
)