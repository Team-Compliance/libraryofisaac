--##POST_EFFECT_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_EFFECT_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param effect EntityEffect
local function OnEffectUpdate(_, effect)
    local effectStateLastFrame = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        effect,
        "effectStateLastFrame_EFFECT_STATE_CHANGED_CALLBACK"
    )
    local effectStateCurrentFrame = effect.State

    if effectStateLastFrame ~= nil and
    effectStateLastFrame ~= effectStateCurrentFrame then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_EFFECT_STATE_CHANGED, effect, effectStateLastFrame, effectStateCurrentFrame)
    end

    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        effect,
        "effectStateLastFrame_EFFECT_STATE_CHANGED_CALLBACK",
        effectStateCurrentFrame
    )
end
TSIL.__AddInternalCallback(
    "EFFECT_STATE_CHANGED_CALLBACK_ON_EFFECT_UPDATE",
    ModCallbacks.MC_POST_EFFECT_UPDATE,
    OnEffectUpdate
)