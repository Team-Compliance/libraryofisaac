--##POST_NEW_ROOM_EARLY
TSIL.__RegisterCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_ROOM_EARLY)

local currentRoomTopLeftWallPtrHash = nil
local currentRoomTopLeftWallPtrHash2 = nil

local function IsNewRoom()
    local room = Game():GetRoom()
    local topLeftWallGridIndex = TSIL.GridEntities.GetTopLeftWallGridIndex()
    local rightOfTopWallGridIndex = topLeftWallGridIndex + 1

    local topLeftWall = room:GetGridEntity(topLeftWallGridIndex)
    local topLeftWall2 = room:GetGridEntity(rightOfTopWallGridIndex)

    -- Sometimes, the PreEntitySpawn callback can fire before any grid entities in the room have
    -- spawned, which means that the top-left wall will not exist. If ths is the case, then simply
    -- spawn the top-left wall early.
    if topLeftWall == nil then
        ---@diagnostic disable-next-line: cast-local-type
        topLeftWall = TSIL.GridEntities.SpawnGridEntity(GridEntityType.GRID_WALL, 0, topLeftWallGridIndex)
        if topLeftWall == nil then
            TSIL.Log.Log("Failed to spawn a new wall (1) for the POST_NEW_ROOM_EARLY callback.")
            return false
        end
    end

    -- For some reason, the above check will rarely fail. We duplicate the check with another wall
    -- segment to increase the reliability.
    if topLeftWall2 == nil then
        ---@diagnostic disable-next-line: cast-local-type
        topLeftWall2 = TSIL.GridEntities.SpawnGridEntity(GridEntityType.GRID_WALL, 0, rightOfTopWallGridIndex)

        if topLeftWall2 == nil then
            TSIL.Log.Log("Failed to spawn a new wall (2) for the POST_NEW_ROOM_EARLY callback.")
            return false
        end
    end

    local oldTopLeftWallPtrHash = currentRoomTopLeftWallPtrHash
    local oldTopLeftWallPtrHash2 = currentRoomTopLeftWallPtrHash2
    currentRoomTopLeftWallPtrHash = GetPtrHash(topLeftWall)
    currentRoomTopLeftWallPtrHash2 = GetPtrHash(topLeftWall2)

    return oldTopLeftWallPtrHash ~= currentRoomTopLeftWallPtrHash or
        oldTopLeftWallPtrHash2 ~= currentRoomTopLeftWallPtrHash2
end


---@param isFromNewRoomCallback boolean
local function CheckRoomChanged(isFromNewRoomCallback)
    local level = Game():GetLevel()
    local stage = level:GetStage()
    local frameCount = Game():GetFrameCount()

    --Fix for a weird stage api related crash
    if stage == 0 and frameCount == 0 then
        return
    end

    if IsNewRoom() then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NEW_ROOM_EARLY, isFromNewRoomCallback)
    end
end


local function OnNewRoom()
    CheckRoomChanged(true)
end
TSIL.__AddInternalCallback(
    "POST_NEW_ROOM_EARLY_CALLBACK_ON_NEW_ROOM",
    ModCallbacks.MC_POST_NEW_ROOM,
    OnNewRoom
)


local function PreEntitySpawn()
    CheckRoomChanged(false)
end
TSIL.__AddInternalCallback(
    "POST_NEW_ROOM_EARLY_CALLBACK_PRE_ENTITY_SPAWN",
    ModCallbacks.MC_PRE_ENTITY_SPAWN,
    PreEntitySpawn
)