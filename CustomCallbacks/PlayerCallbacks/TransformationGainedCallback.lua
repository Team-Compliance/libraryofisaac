--##POST_TRANSFORMATION_GAINED
--##use CustomCallbacks/PlayerCallbacks/TransformationCallbackLogic.lua
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_TRANSFORMATION_GAINED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)