--##POST_SLOT_PRIZE

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_PRIZE,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]

		local targetVariant = optionalParams[1]
		local targetSubType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant) and
		(TSIL.__IsDefaultParam(targetSubType) or slot.SubType == targetSubType)
	end
)

function OnSlotUpdate(_, slot)
	local slotSpr = slot:GetSprite()

	if not slotSpr:IsEventTriggered("Prize") and not slotSpr:IsEventTriggered("Disappear") then return end

	TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_PRIZE, slot, slotSpr:IsEventTriggered("Disappear"))
end
TSIL.__AddInternalCustomCallback(
	"SLOT_PRIZE_CALLBACK_SLOT_UPDATE",
	TSIL.Enums.CustomCallback.POST_SLOT_UPDATE,
	OnSlotUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)