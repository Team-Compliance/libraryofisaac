--##POST_EFFECT_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_EFFECT_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "effectStatesLastFrame_EFFECT_STATE_CHANGE_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "EFFECT_STATE_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param effect EntityEffect
local function OnEffectUpdate(_, effect)
    local effectPtr = GetPtrHash(effect)
    local effectPtrStr = tostring(effectPtr)

    local effectStatesLastFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "effectStatesLastFrame_EFFECT_STATE_CHANGE_CALLBACK")

    local effectStateLastFrame = effectStatesLastFrame[effectPtrStr]
    local effectStateCurrentFrame = effect.State

    if effectStateLastFrame ~= nil and
    effectStateLastFrame ~= effectStateCurrentFrame then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_EFFECT_STATE_CHANGED, effect, effectStateLastFrame, effectStateCurrentFrame)
    end

    effectStatesLastFrame[effectPtrStr] = effectStateCurrentFrame
end
TSIL.__AddInternalCallback(
    "EFFECT_STATE_CHANGED_CALLBACK_ON_EFFECT_UPDATE",
    ModCallbacks.MC_POST_EFFECT_UPDATE,
    OnEffectUpdate
)