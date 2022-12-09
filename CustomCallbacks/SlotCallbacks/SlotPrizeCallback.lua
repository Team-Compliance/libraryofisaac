--##POST_SLOT_PRIZE
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_PRIZE,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)

local function OnSlotUpdate(_, slot)
	local slotSpr = slot:GetSprite()

	if not slotSpr:IsEventTriggered("Prize") and not slotSpr:IsEventTriggered("Disappear") then return end

	TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_PRIZE, slot, slotSpr:IsEventTriggered("Disappear"))
end
TSIL.__AddInternalCallback(
	"SLOT_PRIZE_CALLBACK_SLOT_UPDATE",
	TSIL.Enums.CustomCallback.POST_SLOT_UPDATE,
	OnSlotUpdate
)