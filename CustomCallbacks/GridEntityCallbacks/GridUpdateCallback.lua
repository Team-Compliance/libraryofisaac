--##POST_GRID_ENTITY_UPDATE
--##use CustomCallbacks/GridEntityCallbacks/GridEntityUpdateLogic.lua
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)