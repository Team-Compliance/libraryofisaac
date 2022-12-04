--##POST_SLOT_ANIMATION_CHANGED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
	TSIL.Enums.CallbackReturnMode.NONE,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]

		local targetVariant = optionalParams[1]
		local targetSubType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant) and
		(TSIL.__IsDefaultParam(targetSubType) or slot.SubType == targetSubType)
	end
)

---@type table<integer, string>
local slotAnimations = {}


local function OnNewRoom()
    slotAnimations = {}
end
TSIL.__AddInternalVanillaCallback(
    "SLOT_ANIMATION_CHANGED_CALLBACK_NEW_ROOM",
    ModCallbacks.MC_POST_NEW_ROOM,
    OnNewRoom,
    TSIL.Enums.CallbackPriority.MEDIUM
)


---@param slot Entity
local function OnRender(_, slot)
    local slotPtr = GetPtrHash(slot)
    local prevAnimation = slotAnimations[slotPtr]
    local currentAnimation = slot:GetSprite():GetAnimation()

    if prevAnimation and prevAnimation ~= currentAnimation then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED, slot, prevAnimation, currentAnimation)
    end

    slotAnimations[slotPtr] = currentAnimation
end
TSIL.__AddInternalCustomCallback(
	"SLOT_ANIMATION_CHANGED_CALLBACK_POST_SLOT_RENDER",
	TSIL.Enums.CustomCallback.POST_SLOT_RENDER,
	OnRender,
	TSIL.Enums.CallbackPriority.MEDIUM
)