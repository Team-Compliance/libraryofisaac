local restoreGlowingHourGlassDataOnNextRoom = false
local loadedDataOnThisRun = false


local function OnGlowingHourglassUse()
    restoreGlowingHourGlassDataOnNextRoom = true
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_USE_GLOWING_HOURGLASS",
    ModCallbacks.MC_USE_ITEM,
    OnGlowingHourglassUse,
    CallbackPriority.IMPORTANT,
    CollectibleType.COLLECTIBLE_GLOWING_HOUR_GLASS
)


local function OnPlayerInit()
    if loadedDataOnThisRun then
        return
    end

    loadedDataOnThisRun = true
    restoreGlowingHourGlassDataOnNextRoom = false

    TSIL.SaveManager.LoadFromDisk()

    local gameFrameCount = Game():GetFrameCount()
    local isContinued = gameFrameCount ~= 0

    if not isContinued then
        TSIL.SaveManager.RestoreDefaultsForAllFeaturesAndKeys()
    end
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_PLAYER_INIT",
    ModCallbacks.MC_POST_PLAYER_INIT,
    OnPlayerInit,
    CallbackPriority.IMPORTANT
)


local function OnGameExit()
    TSIL.SaveManager.SaveToDisk()
    TSIL.SaveManager.RestoreDefaultsForAllFeaturesAndKeys()
    loadedDataOnThisRun = false
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_GAME_EXIT",
    ModCallbacks.MC_PRE_GAME_EXIT,
    OnGameExit,
    CallbackPriority.IMPORTANT
)


local function OnNewLevel()
    TSIL.SaveManager.RestoreDefaultsForAllFeaturesKey("level")

    if not TSIL.Stage.OnFirstFloor() then
        TSIL.SaveManager.SaveToDisk()
    end
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_NEW_LEVEL",
    ModCallbacks.MC_POST_NEW_LEVEL,
    OnNewLevel,
    CallbackPriority.IMPORTANT
)


local function OnNewRoomEarly()
    TSIL.SaveManager.RestoreDefaultsForAllFeaturesKey("room")

    if restoreGlowingHourGlassDataOnNextRoom then
        restoreGlowingHourGlassDataOnNextRoom = false
        TSIL.SaveManager.RestoreGlowingHourGlassBackup()
    else
        TSIL.SaveManager.MakeGlowingHourGlassBackup()
    end
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_PRE_NEW_ROOM",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_EARLY,
    OnNewRoomEarly,
    CallbackPriority.IMPORTANT
)