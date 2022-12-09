--##POST_TRANSFORMATION_LOST
--##use CustomCallbacks/PlayerCallbacks/TransformationCallbackLogic.lua
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_TRANSFORMATION_LOST,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)