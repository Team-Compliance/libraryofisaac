--##POST_SLOT_UPDATE
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_UPDATE,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnFrameUpdate()
	local slots = TSIL.EntitySpecific.GetSlots()

	for _, slot in ipairs(slots) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_UPDATE, slot)
	end
end
TSIL.__AddInternalCallback(
	"SLOT_UPDATE_CALLBACK_POST_UPDATE",
	ModCallbacks.MC_POST_UPDATE,
	OnFrameUpdate
)