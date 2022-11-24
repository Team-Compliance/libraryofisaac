--##POST_SLOT_PRIZE

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_PRIZE,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]
		---@type integer|nil
		local targetVariant = optionalParams[1]

		return TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant
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