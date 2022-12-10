--##POST_EFFECT_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_EFFECT_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param effect EntityEffect
local function OnEffectUpdate(_, effect)
    if effect.FrameCount == 0 then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_EFFECT_INIT_LATE, effect)
    end
end
TSIL.__AddInternalCallback(
    "EFFECT_INIT_LATE_CALLBACK_ON_EFFECT_UPDATE",
    ModCallbacks.MC_POST_EFFECT_UPDATE,
    OnEffectUpdate
)