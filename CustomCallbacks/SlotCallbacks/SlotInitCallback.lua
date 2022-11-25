--##POST_SLOT_INIT

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_INIT,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]

		local targetVariant = optionalParams[1]
		local targetSubType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant) and
		(TSIL.__IsDefaultParam(targetSubType) or slot.SubType == targetSubType)
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