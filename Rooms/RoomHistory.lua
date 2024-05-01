---@class RoomHistoryData
---@field Stage LevelStage
---@field StageType StageType
---@field RoomType RoomType
---@field StageID StageID
---@field Dimension Dimension
---@field RoomVariant integer
---@field RoomSubType integer
---@field RoomName string
---@field RoomGridIndex integer
---@field RoomListIndex integer
---@field RoomVisitedCount integer

local function OnTSILLoaded()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "roomHistory_ROOM_HISTORY", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCallback(
    "ROOM_HISTORY_ON_TSIL_LOADED",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoaded
)


---@param isFromNewRoomCallback boolean
local function OnNewRoomEarly(_, isFromNewRoomCallback)
    local level = Game():GetLevel()
    local stage = level:GetStage()
    local stageType = level:GetStageType()
    local room = Game():GetRoom()
    local roomType = room:GetType()
    local roomDescriptor = level:GetCurrentRoomDesc()
    local roomData = roomDescriptor.Data
    local stageID = roomData.StageID
    local dimension = Game():GetLevel():GetDimension()
    local roomVariant = roomData.Variant
    local roomSubType = roomData.Subtype
    local roomName = roomData.Name
    local roomGridIndex = roomDescriptor.SafeGridIndex
    local roomListIndex = roomDescriptor.ListIndex
    local roomVisitedCount = roomDescriptor.VisitedCount

    if not isFromNewRoomCallback then
        roomVisitedCount = roomVisitedCount + 1
    end

    local roomHistoryData = {
        Stage = stage,
        StageType = stageType,
        RoomType = roomType,
        StageID = stageID,
        Dimension = dimension,
        RoomVariant = roomVariant,
        RoomSubType = roomSubType,
        RoomName = roomName,
        RoomGridIndex = roomGridIndex,
        RoomListIndex = roomListIndex,
        RoomVisitedCount = roomVisitedCount
    }

    local roomHistory = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "roomHistory_ROOM_HISTORY")
    roomHistory[#roomHistory+1] = roomHistoryData
end
TSIL.__AddInternalCallback(
    "ROOM_HISTORY_PRE_NEW_ROOM",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_EARLY,
    OnNewRoomEarly
)


---@param roomHistoryData table
---@return RoomHistoryData
local function MakeRoomHistoryDataReadOnly(roomHistoryData)
    local proxy = {}

    local mt = {
        __type = "RoomHistoryData",
        __index = roomHistoryData,
        __newindex = function()
            error("Attempt to update a read-only table", 2)
        end,
        __eq = function(t1, t2)
            local ci1 = getmetatable(t1).__proxy
            local ci2 = getmetatable(t2).__proxy

            for key, value in pairs(ci1) do
                if value ~= ci2[key] then
                    return false
                end
            end

            return true
        end,
        __proxy = roomHistoryData
    }

    setmetatable(proxy, mt)

    return proxy
end


---Helper function to get information about all of the rooms that a player has visited thus far on this run.
---@return RoomHistoryData[]
function TSIL.Rooms.GetRoomHistory()
    local roomHistory = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "roomHistory_ROOM_HISTORY")

    local readOnlyRoomHistory = TSIL.Utils.Tables.Map(roomHistory, function (_, roomHistoryData)
        return MakeRoomHistoryDataReadOnly(roomHistoryData)
    end)

    return readOnlyRoomHistory
end


--- Helper function to get information about the room that was previously visited.
---
--- In the special case of only one room having been visited thus far (i.e. the starting room of
--- the run), the starting room will be returned.
---@return RoomHistoryData
function TSIL.Rooms.GetPreviousRoomDescription()
    local roomHistory = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "roomHistory_ROOM_HISTORY")

    local previousRoomData = roomHistory[#roomHistory-1]
    if previousRoomData ~= nil then
        return MakeRoomHistoryDataReadOnly(previousRoomData)
    end

    local startingRoomData = roomHistory[1]
    if startingRoomData ~= nil then
        return MakeRoomHistoryDataReadOnly(startingRoomData)
    end

    error(
      "Failed to find a room description for any rooms thus far on this run."
    )
end


--- Helper function to get information about the most recent room that is stored in the room
--- history array.
---
--- This is useful in the `POST_ENTITY_REMOVE` callback; see the `isLeavingRoom` function.
---
--- Note that this function can return nil in the case where it is called on the first room
--- of the run.
---@return RoomHistoryData
function TSIL.Rooms.GetLatestRoomDescription()
    local roomHistory = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "roomHistory_ROOM_HISTORY")

    local lastRoomData = roomHistory[#roomHistory]

    return MakeRoomHistoryDataReadOnly(lastRoomData)
end


--- Helper function to detect if the game is in the state where the room index has changed to a new
--- room, but the entities from the previous room are currently in the process of despawning. (At
--- this point, the `POST_NEW_ROOM` callback and the `POST_NEW_ROOM_EARLY` callback will not have
--- fired yet, and there will not be an entry in the room history array for the current room.)
---
--- This function is intended to be used in the `POST_ENTITY_REMOVE` callback to detect when an
--- entity is despawning.
---@return boolean
function TSIL.Rooms.IsLeavingRoom()
    local level = Game():GetLevel()
    local stageType = level:GetStageType()
    local stage = level:GetStage()
    local roomDescriptor = level:GetCurrentRoomDesc()
    local roomListIndex = roomDescriptor.ListIndex
    local roomVisitedCount = roomDescriptor.VisitedCount
    local latestRoomDescription = TSIL.Rooms.GetLatestRoomDescription()

    -- Sometimes, this function can be called in situations where entities from the previous run are
    -- being despawned. If this is the case, then the room history will currently be empty.
    if latestRoomDescription == nil then
        return false
    end

    return (
      stage ~= latestRoomDescription.Stage or
      stageType ~= latestRoomDescription.StageType or
      roomListIndex ~= latestRoomDescription.RoomListIndex or
      roomVisitedCount ~= latestRoomDescription.RoomVisitedCount
    )
end