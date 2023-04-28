---@type integer?
local currentStage = nil
---@type integer?
local currentStageType = nil
local usedGlowingHourGlass = false
local forceNewLevel = false
local forceNewRoom = false


local function RecordCurrentStage()
    local level = Game():GetLevel();
    local stage = level:GetStage();
    local stageType = level:GetStageType();

    currentStage = stage;
    currentStageType = stageType;
end


local function OnGlowingHourGlassUse()
    -- If Glowing Hourglass is used on the first room of a floor, it will send the player to the
    -- previous floor without triggering the `POST_NEW_LEVEL` callback. Manually check for this.
    usedGlowingHourGlass = true
end
TSIL.__AddInternalCallback(
    "GAME_REORDERED_LOGIC_GLOWING_HOURGLASS_USE",
    ModCallbacks.MC_USE_ITEM,
    OnGlowingHourGlassUse,
    CallbackPriority.DEFAULT,
    CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS
)


local function PostGameStarted(_, isContinued)
    RecordCurrentStage()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GAME_STARTED_REORDERED, isContinued)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_LEVEL_REORDERED)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GAME_STARTED_REORDERED_LAST, isContinued)
end
TSIL.__AddInternalCallback(
    "GAME_REORDERED_LOGIC_POST_GAME_STARTED",
    ModCallbacks.MC_POST_GAME_STARTED,
    PostGameStarted
)


local function PostNewLevel()
    local frameCount = Game():GetFrameCount();

    if frameCount == 0 and not forceNewLevel then
        -- Wait for the `POST_GAME_STARTED` callback to fire.
        return
    end

    forceNewLevel = false;

    RecordCurrentStage();
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_LEVEL_REORDERED)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED)
end
TSIL.__AddInternalCallback(
    "GAME_REORDERED_LOGIC_POST_NEW_LEVEL",
    ModCallbacks.MC_POST_NEW_LEVEL,
    PostNewLevel
)


local function PostNewRoom()
    local frameCount = Game():GetFrameCount()
    local level = Game():GetLevel()
    local stage = level:GetStage()
    local stageType = level:GetStageType()

    if usedGlowingHourGlass then
        usedGlowingHourGlass = false

        if currentStage ~= stage or currentStageType ~= stageType then
            -- The player has used the Glowing Hourglass to take them to the previous floor (which does
            -- not trigger the `POST_NEW_LEVEL` callback). Emulate what happens in the `POST_NEW_LEVEL`
            -- callback.
            RecordCurrentStage()
            TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_LEVEL_REORDERED)
            TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED)
            return
        end
    end

    if (frameCount == 0 or currentStage ~= stage or currentStageType ~= stageType) and
        not forceNewRoom then
        return
    end
    forceNewRoom = false;

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED)
end
TSIL.__AddInternalCallback(
    "GAME_REORDERED_LOGIC_POST_NEW_ROOM",
    ModCallbacks.MC_POST_NEW_ROOM,
    PostNewRoom
)

--TODO: Add the functions to allow people to force the executing or these callbacks
--Where to put them??


-- Helper function to tell the `POST_NEW_LEVEL_REORDERED` callback that it should always fire on
-- the next `POST_NEW_LEVEL`.
--
-- If some specific cases, mods can change the current level during run initialization on the 0th
-- frame. (For example, if you had a mod that made the player start the run in Caves instead of
-- Basement.) However, due to how the callback reordering works, the `POST_NEW_LEVEL_REORDERED`
-- callback will never fire on the 0th frame. To get around this, call this function before
-- changing levels to temporarily force the callback to fire.
--
-- In order to use this function, you must upgrade your mod with
-- `ISCFeature.GAME_REORDERED_CALLBACKS`.

-- function ForceNewLevelCallback()
--     forceNewLevel = true
-- end


-- Helper function to tell the `POST_NEW_ROOM_REORDERED` callback that it should always fire on
-- the next `POST_NEW_ROOM`.
--
-- If some specific cases, mods can change the current room during run initialization on the 0th
-- frame. (For example, if you had a mod that made the player start the Treasure Room of Basement
-- 1 instead of the normal starting room.) However, due to how the callback reordering works, the
-- `POST_NEW_ROOM_REORDERED` callback will never fire on the 0th frame. To get around this, call
-- this function before changing rooms to temporarily force the callback to fire.
--
-- In order to use this function, you must upgrade your mod with
-- `ISCFeature.GAME_REORDERED_CALLBACKS`.

-- function ForceNewRoomCallback()
--     forceNewRoom = true
-- end


-- Helper function to manually set the variables that the reordered callback logic uses to track
-- the current stage and stage type.
--
-- This is useful because if the stage is changed with the `Game.SetStage` method (or the
-- `setStage` helper function), the reordered callbacks will stop working.
--
-- In order to use this function, you must upgrade your mod with
-- `ISCFeature.GAME_REORDERED_CALLBACKS`.

-- function ReorderedCallbacksSetStage(stage, stageType)
--     currentStage = stage;
--     currentStageType = stageType;
-- end