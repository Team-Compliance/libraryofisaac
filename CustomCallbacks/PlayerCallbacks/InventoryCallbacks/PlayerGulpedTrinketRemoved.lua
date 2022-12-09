--##use Players/Inventory/PlayerInventory.lua
--##POST_PLAYER_GULPED_TRINKET_REMOVED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_REMOVED,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE,
	TSIL.Enums.CallbackOptionalArgType.GENERIC
)