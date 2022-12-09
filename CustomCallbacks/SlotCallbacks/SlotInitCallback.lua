--##POST_SLOT_INIT

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_INIT,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)

local function OnSlotUpdate(_, slot)
	if slot.FrameCount ~= 1 then return end

	TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_INIT, slot)
end
TSIL.__AddInternalCallback(
	"SLOT_INIT_CALLBACK_SLOT_UPDATE",
	TSIL.Enums.CustomCallback.POST_SLOT_UPDATE,
	OnSlotUpdate
)