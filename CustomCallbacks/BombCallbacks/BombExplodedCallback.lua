--##POST_BOMB_EXPLODED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_BOMB_EXPLODED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param bomb EntityBomb
local function OnBombUpdate(_, bomb)
    if bomb:GetSprite():IsPlaying("Explode") then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_BOMB_EXPLODED, bomb)
    end
end
TSIL.__AddInternalCallback(
    "BOMB_EXPLODED_CALLBACK_POST_BOMB_UPDATE",
    ModCallbacks.MC_POST_BOMB_UPDATE,
    OnBombUpdate
)