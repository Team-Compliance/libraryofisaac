--##POST_FAMILIAR_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_FAMILIAR_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "familiarStates_FAMILIAR_STATE_CHANGED_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "FAMILIAR_STATE_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param familiar EntityFamiliar
local function OnFamiliarUpdate(_, familiar)
    local familiarStates = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "familiarStates_FAMILIAR_STATE_CHANGED_CALLBACK")
    local familiarPtr = GetPtrHash(familiar)

    local previousState = familiarStates[tostring(familiarPtr)]
    local currentState = familiar.State
    familiarStates[tostring(familiarPtr)] = currentState

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