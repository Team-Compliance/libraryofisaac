--##POST_BOMB_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_BOMB_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param bomb EntityBomb
local function OnBombUpdate(_, bomb)
    if bomb.FrameCount == 1 then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_BOMB_INIT_LATE, bomb)
    end
end
TSIL.__AddInternalCallback(
    "BOMB_INIT_CALLBACK_POST_BOMB_UPDATE",
    ModCallbacks.MC_POST_BOMB_UPDATE,
    OnBombUpdate
)