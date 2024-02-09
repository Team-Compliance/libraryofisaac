--##POST_SLOT_ANIMATION_CHANGED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param slot EntitySlot
local function OnSlotRender(_, slot)
    local prevAnimation = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        slot,
        "SlotAnimation_SLOT_ANIMATION_CHANGED_CALLBACK"
    )
    local currentAnimation = slot:GetSprite():GetAnimation()

    if prevAnimation and prevAnimation ~= currentAnimation then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED, slot, prevAnimation, currentAnimation)
    end

    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        slot,
        "SlotAnimation_SLOT_ANIMATION_CHANGED_CALLBACK",
        currentAnimation
    )
end
TSIL.__AddInternalCallback(
	"SLOT_ANIMATION_CHANGED_CALLBACK_POST_SLOT_RENDER",
	ModCallbacks.MC_POST_SLOT_RENDER,
	OnSlotRender
)