--##POST_SLOT_INIT

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_INIT,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]
		---@type integer|nil
		local targetVariant = optionalParams[1]

		return TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant
	end
)

local function OnSlotUpdate(_, slot)
	if slot.FrameCount ~= 1 then return end

	TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_INIT, slot)
end
TSIL.__AddInternalCustomCallback(
	"SLOT_INIT_CALLBACK_SLOT_UPDATE",
	TSIL.Enums.CustomCallback.POST_SLOT_UPDATE,
	OnSlotUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)