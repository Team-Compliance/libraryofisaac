--##use CustomCallbacks/ReorderedCallbacks/PlayerReorderedLogic.lua
--##POST_PLAYER_RENDER_REORDERED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PLAYER_RENDER_REORDERED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)