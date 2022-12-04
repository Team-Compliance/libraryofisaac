--##POST_SLOT_DESTROYED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_DESTROYED,
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

local PRIZE_GAME_FRAME_DELAY_UNTIL_REMOVAL = 3


local function PostSlotRemoved(_, slot)
    local SlotPrizeAnimationFrameCount = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "SlotPrizeAnimationFrameCount_DESTROYED_SLOT_CALLBACK")

    local slotPtr = GetPtrHash(slot)
    local frameCount = Game():GetFrameCount()

    local prizeFrame = SlotPrizeAnimationFrameCount[tostring(slotPtr)]
    if prizeFrame == nil then
        return
    end

    if prizeFrame + PRIZE_GAME_FRAME_DELAY_UNTIL_REMOVAL == frameCount then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_DESTROYED, slot, true)
    end
end
TSIL.__AddInternalVanillaCallback(
    "SLOT_DESTROYED_CALLBACK_POST_ENTITY_REMOVE",
    ModCallbacks.MC_POST_ENTITY_REMOVE,
    PostSlotRemoved,
    TSIL.Enums.CallbackPriority.MEDIUM,
    EntityType.ENTITY_SLOT
)


local function OnSlotAnimationChange(_, slot)
    local BrokenSlots = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "BrokenSlots_DESTROYED_SLOT_CALLBACK")
    local SlotPrizeAnimationFrameCount = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "SlotPrizeAnimationFrameCount_DESTROYED_SLOT_CALLBACK")

    local slotPtr = GetPtrHash(slot);
    local frameCount = Game():GetFrameCount()

    local alreadyBroken = TSIL.Utils.Tables.IsIn(BrokenSlots, slotPtr)
    if alreadyBroken then return end

    if slot.GridCollisionClass == EntityGridCollisionClass.GROUND then
        BrokenSlots[#BrokenSlots+1] = slotPtr
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_DESTROYED, slot, false)
    end

    local sprite = slot:GetSprite();
    local animation = sprite:GetAnimation();
    if animation == "Prize" then
        SlotPrizeAnimationFrameCount[tostring(slotPtr)] = frameCount
    else
        SlotPrizeAnimationFrameCount[tostring(slotPtr)] = nil
    end
end
TSIL.__AddInternalCustomCallback(
    "SLOT_DESTROYED_CALLBACK_POST_SLOT_ANIMATION_CHANGE",
    TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
    OnSlotAnimationChange,
    TSIL.Enums.CallbackPriority.MEDIUM
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "BrokenSlots_DESTROYED_SLOT_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "SlotPrizeAnimationFrameCount_DESTROYED_SLOT_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCustomCallback(
    "SLOT_DESTROYED_CALLBACK_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad,
    TSIL.Enums.CallbackPriority.MEDIUM
)