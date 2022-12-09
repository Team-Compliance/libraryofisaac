--##use CustomCallbacks/ReorderedCallbacks/PlayerReorderedLogic.lua
--##POST_PEFFECT_UPDATE_REORDERED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)