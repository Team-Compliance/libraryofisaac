--##POST_SLOT_ANIMATION_CHANGED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)

---@type table<integer, string>
local slotAnimations = {}


local function OnNewRoom()
    slotAnimations = {}
end
TSIL.__AddInternalCallback(
    "SLOT_ANIMATION_CHANGED_CALLBACK_NEW_ROOM",
    ModCallbacks.MC_POST_NEW_ROOM,
    OnNewRoom
)


---@param slot Entity
local function OnSlotRender(_, slot)
    local slotPtr = GetPtrHash(slot)
    local prevAnimation = slotAnimations[slotPtr]
    local currentAnimation = slot:GetSprite():GetAnimation()

    if prevAnimation and prevAnimation ~= currentAnimation then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED, slot, prevAnimation, currentAnimation)
    end

    slotAnimations[slotPtr] = currentAnimation
end
TSIL.__AddInternalCallback(
	"SLOT_ANIMATION_CHANGED_CALLBACK_POST_SLOT_RENDER",
	TSIL.Enums.CustomCallback.POST_SLOT_RENDER,
	OnSlotRender
)