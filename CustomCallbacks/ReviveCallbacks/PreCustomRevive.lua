--##use CustomCallbacks/ReviveCallbacks/CustomReviveLogic.lua
--##PRE_CUSTOM_REVIVE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_CUSTOM_REVIVE,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)