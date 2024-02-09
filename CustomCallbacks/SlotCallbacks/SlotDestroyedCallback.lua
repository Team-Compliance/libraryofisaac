--##POST_SLOT_DESTROYED
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_DESTROYED,
    TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)

local PRIZE_GAME_FRAME_DELAY_UNTIL_REMOVAL = 3


local function PostSlotRemoved(_, slot)
    local frameCount = Game():GetFrameCount()

    local prizeFrame = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        slot,
        "PrizeAnimationFrameCount_DESTROYED_SLOT_CALLBACK"
    )
    if prizeFrame == nil then
        return
    end

    if prizeFrame + PRIZE_GAME_FRAME_DELAY_UNTIL_REMOVAL == frameCount then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_DESTROYED, slot, true)
    end
end
TSIL.__AddInternalCallback(
    "SLOT_DESTROYED_CALLBACK_POST_ENTITY_REMOVE",
    ModCallbacks.MC_POST_ENTITY_REMOVE,
    PostSlotRemoved,
    CallbackPriority.DEFAULT,
    EntityType.ENTITY_SLOT
)


---@param slot EntitySlot
local function OnSlotAnimationChange(_, slot)
    local frameCount = Game():GetFrameCount()

    local alreadyBroken = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        slot,
        "IsBrokenSlot_DESTROYED_SLOT_CALLBACK"
    )
    if alreadyBroken then return end

    if slot:GetState() == 3 then
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            slot,
            "IsBrokenSlot_DESTROYED_SLOT_CALLBACK",
            true
        )
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_DESTROYED, slot, false)
    end

    local sprite = slot:GetSprite()
    local animation = sprite:GetAnimation()
    if animation == "Prize" then
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            slot,
            "PrizeAnimationFrameCount_DESTROYED_SLOT_CALLBACK",
            frameCount
        )
    else
        TSIL.Entities.SetEntityData(
            TSIL.__MOD,
            slot,
            "PrizeAnimationFrameCount_DESTROYED_SLOT_CALLBACK",
            nil
        )
    end
end
TSIL.__AddInternalCallback(
    "SLOT_DESTROYED_CALLBACK_POST_SLOT_ANIMATION_CHANGE",
    TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
    OnSlotAnimationChange
)