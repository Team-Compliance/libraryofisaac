--##use Players/Inventory/PlayerInventoryLogic.lua
--##POST_PLAYER_GULPED_TRINKET_REMOVED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_REMOVED,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
	TSIL.Enums.CallbackOptionalArgType.GENERIC
)