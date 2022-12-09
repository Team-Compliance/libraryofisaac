--##use Players/Inventory/PlayerInventory.lua
--##POST_PLAYER_COLLECTIBLE_ADDED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_ADDED,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE,
	TSIL.Enums.CallbackOptionalArgType.GENERIC
)