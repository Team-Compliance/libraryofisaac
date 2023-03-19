--##use CustomCallbacks/ReviveCallbacks/CustomReviveLogic.lua
--##POST_CUSTOM_REVIVE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_CUSTOM_REVIVE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)