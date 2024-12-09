local loadedDataOnThisRun = false


local function OnPlayerInit()
    if loadedDataOnThisRun then
        return
    end

    loadedDataOnThisRun = true

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
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_PRE_NEW_ROOM",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_EARLY,
    OnNewRoomEarly,
    CallbackPriority.IMPORTANT
)


---@param slot integer
local function OnGlowingHourglassSave(_, slot)
    TSIL.SaveManager.MakeGlowingHourGlassBackup(slot)
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_GLOWING_HOURGLASS_SAVE",
    ModCallbacks.MC_POST_GLOWING_HOURGLASS_SAVE,
    OnGlowingHourglassSave,
    CallbackPriority.IMPORTANT
)


---@param slot integer
local function OnGlowingHourglassLoad(_, slot)
    TSIL.SaveManager.RestoreGlowingHourGlassBackup(slot)
end
TSIL.__AddInternalCallback(
    "SAVE_MANAGER_GLOWING_HOURGLASS_LOAD",
    ModCallbacks.MC_POST_GLOWING_HOURGLASS_LOAD,
    OnGlowingHourglassLoad,
    CallbackPriority.IMPORTANT
)