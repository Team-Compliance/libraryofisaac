---@class PickupIndex : integer

---@class PickupDescription
---@field Position Vector
---@field InitSeed integer


local function OnTSILLoad()
    local AddVariable = TSIL.SaveManager.AddPersistentVariable

    AddVariable(TSIL.__MOD, "pickupCounter_PICKUP_INDEX", 0, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
    AddVariable(TSIL.__MOD, "pickupDataTreasureRooms_PICKUP_INDEX", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
    AddVariable(TSIL.__MOD, "pickupDataBossRooms_PICKUP_INDEX", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)

    AddVariable(TSIL.__MOD, "pickupData_PICKUP_INDEX", {}, TSIL.Enums.VariablePersistenceMode.RESET_LEVEL)

    AddVariable(TSIL.__MOD, "pickupIndexes_PICKUP_INDEX", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end

TSIL.__AddInternalCallback(
    "PICKUP_INDEX_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param pickup EntityPickup
---@param pickupDescriptions table<PickupIndex, PickupDescription>
---@return PickupIndex?
local function GetStoredPickupIndex(pickup, pickupDescriptions)
    for pickupIndex, pickupDescription in pairs(pickupDescriptions) do
        if TSIL.Vector.VectorEquals(pickup.Position, pickupDescription.Position) and
            pickup.InitSeed == pickupDescription.InitSeed then
            return pickupIndex
        end
    end
end

---@param pickup EntityPickup
---@return PickupIndex?
local function GetPostAscentPickupIndex(pickup)
    -- If we have not found the pickup index yet, we might be re-entering a post-Ascent Treasure
    -- Room or Boss Room.
    if not TSIL.Stage.OnAscent() then
        return nil
    end

    local room = Game():GetRoom();
    local roomType = room:GetType();

    if roomType == RoomType.ROOM_TREASURE then
        local treasurePickups = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupDataTreasureRooms_PICKUP_INDEX")
        return GetStoredPickupIndex(pickup, treasurePickups)
    elseif roomType == RoomType.ROOM_BOSS then
        local bossPickups = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupDataBossRooms_PICKUP_INDEX")
        return GetStoredPickupIndex(pickup, bossPickups)
    end
end

---@param entity Entity
---@param pickupIndex PickupIndex
local function TrackDespawningPickupMetadata(entity, pickupIndex)
    -- The "latest" room description is really the previous room, because the `POST_NEW_ROOM`
    -- callback has not fired yet.
    local previousRoomDescription = TSIL.Rooms.GetLatestRoomDescription()
    if previousRoomDescription == nil then
        return
    end

    local previousRoomListIndex = previousRoomDescription.RoomListIndex
    local pickupData = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupData_PICKUP_INDEX")
    local pickupDescriptions = pickupData[previousRoomListIndex]

    if pickupDescriptions == nil then
        pickupDescriptions = {}
        pickupData[previousRoomListIndex] = pickupDescriptions
    end

    local pickupDescription = {
        Position = entity.Position,
        InitSeed = entity.InitSeed,
    }
    pickupDescriptions[pickupIndex] = pickupDescription

    -- If the despawning pickup was in a Treasure Room or Boss Room, then it is possible that the
    -- pickup could re-appear during The Ascent. If this is the case, we store the metadata on a
    -- separate map to reference later.
    if TSIL.Stage.OnAscent() then
        return
    end

    local room = Game():GetRoom()
    local roomType = room:GetType()

    if roomType == RoomType.ROOM_TREASURE then
        local treasurePickups = TSIL.SaveManager.GetPersistentVariable(
            TSIL.__MOD,
            "pickupDataTreasureRooms_PICKUP_INDEX"
        )
        treasurePickups[pickupIndex] = pickupDescription
    elseif roomType == RoomType.ROOM_BOSS then
        local bossPickups = TSIL.SaveManager.GetPersistentVariable(
            TSIL.__MOD,
            "pickupDataBossRooms_PICKUP_INDEX"
        )
        bossPickups[pickupIndex] = pickupDescription
    end
end

---@param entity Entity
local function CheckDespawningFromPlayerLeavingRoom(entity)
    local ptrHash = GetPtrHash(entity)
    local pickupIndexes = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupIndexes_PICKUP_INDEX")
    local pickupIndex = pickupIndexes[ptrHash]

    if pickupIndex == nil then
        return
    end

    if not TSIL.Rooms.IsLeavingRoom() then
        return
    end

    TrackDespawningPickupMetadata(entity, pickupIndex)
end

local function GetPickupIndexFromPreviousData(pickup)
    local level = Game():GetLevel()
    local roomDescriptor = level:GetCurrentRoomDesc()
    local roomListIndex = roomDescriptor.ListIndex

    local pickupData = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupData_PICKUP_INDEX")
    local pickupDescriptions = pickupData[roomListIndex]

    if pickupDescriptions == nil then
        pickupDescriptions = {}
        pickupData[roomListIndex] = pickupDescriptions
    end

    local pickupIndex = GetStoredPickupIndex(pickup, pickupDescriptions)
    if pickupIndex == nil then
        pickupIndex = GetPostAscentPickupIndex(pickup)
    end

    return pickupIndex
end

local function SetPickupIndex(pickup)
    local ptrHash = GetPtrHash(pickup)

    -- In certain situations, pickups can be morphed, which will trigger the `POST_PICKUP_INIT`
    -- callback but should not incur a new pickup counter. (For example, the collectible rotation
    -- with Tainted Isaac.) For these situations, we will already be tracking an index for this
    -- pointer hash.
    local pickupIndexes = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupIndexes_PICKUP_INDEX")

    if pickupIndexes[ptrHash] ~= nil then
        return
    end

    -- First, handle the special case of re-entering a room with a previously tracked pickup. If we
    -- find a match in the level pickup data, we will use the pickup index from the match.
    local pickupIndexFromLevelData = GetPickupIndexFromPreviousData(pickup)
    local room = Game():GetRoom()
    local isFirstVisit = room:IsFirstVisit()
    local roomFrameCount = room:GetFrameCount()

    if pickupIndexFromLevelData ~= nil
    and not isFirstVisit
    and roomFrameCount <= 0 then
        pickupIndexes[ptrHash] = pickupIndexFromLevelData
        return
    end

    -- This is a brand new pickup that we have not previously seen on this run.
    local pickupCounter = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupCounter_PICKUP_INDEX")
    pickupCounter = pickupCounter + 1
    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "pickupCounter_PICKUP_INDEX", pickupCounter)
    pickupIndexes[ptrHash] = pickupCounter
end


local function PostPickupInit(_, pickup)
    SetPickupIndex(pickup)
end
TSIL.__AddInternalCallback(
    "PICKUP_INDEX_POST_PICKUP_INDEX",
    ModCallbacks.MC_POST_PICKUP_INIT,
    PostPickupInit
)


local function PostPickupRemove(_, pickup)
    CheckDespawningFromPlayerLeavingRoom(pickup)
end
TSIL.__AddInternalCallback(
    "PICKUP_INDEX_POST_ENTITY_REMOVED",
    ModCallbacks.MC_POST_ENTITY_REMOVE,
    PostPickupRemove,
    CallbackPriority.DEFAULT
)


--- Mods often have to track variables relating to a pickups. Finding an index for these kinds of
--- data structures is difficult, since pickups are respawned every time a player re-enters a room,
--- so the `PtrHash` will change.
---
--- Use this function to get a unique index for a pickup to use in these data structures.
---
--- Specifically, `PickupIndex` is a number that represents the spawn order of the pickup on the
--- current run. For example, the first pickup spawned will have an index of 1, the second one will
--- have an index of 2, and so on.
---@param pickup EntityPickup
---@return PickupIndex
function TSIL.Pickups.GetPickupIndex(pickup)
    local ptrHash = GetPtrHash(pickup)
    local pickupIndexes = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupIndexes_PICKUP_INDEX")

    local pickupIndexInitial = pickupIndexes[ptrHash]
    if pickupIndexInitial ~= nil then
        return pickupIndexInitial
    end

    SetPickupIndex(pickup)
    local pickupIndex = pickupIndexes[ptrHash]
    if pickupIndex ~= nil then
        return pickupIndex
    end

    error("Failed to generate a new pickup index for pickup")
end