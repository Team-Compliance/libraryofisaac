local EMPTY_ROOM_BLACKLIST_ENTITY_SET = {
    [EntityType.ENTITY_PLAYER] = true,
    [EntityType.ENTITY_TEAR] = true,
    [EntityType.ENTITY_FAMILIAR] = true,
    [EntityType.ENTITY_LASER] = true,
    [EntityType.ENTITY_KNIFE] = true,
    [EntityType.ENTITY_PROJECTILE] = true,
    [EntityType.ENTITY_DARK_ESAU] = true,
}

---@param corners integer[]
---@param shape RoomShape
---@return integer[]
local function CornersToGridIndexList(corners, shape)
    local gridIndexes = {}

    for i = 2, #corners + 1, 1 do
        local corner1
        local corner2

        if i <= #corners then
            corner1 = corners[i-1]
            corner2 = corners[i]
        else
            corner1 = corners[i-1]
            corner2 = corners[1]
        end


        local gridIndexesBetween = TSIL.GridIndexes.GetGridIndexesBetween(corner1, corner2, shape)

        for _, gridIndex in ipairs(gridIndexesBetween) do
            gridIndexes[#gridIndexes+1] = gridIndex
        end
    end

    return gridIndexes
end


local WALL_INDEXES_FOR_ROOM_SHAPE
local WALL_INDEXES_CLOSET
local WALL_INDEXES_BLACK_CLOSET
local WALL_INDEXES_MOTHER_FIGHT


---@param gridIndex integer
---@return boolean
local function isVanillaWallGridIndex(gridIndex)
    if not WALL_INDEXES_FOR_ROOM_SHAPE then
        --Load the tables here so as to not mess up script load order
        WALL_INDEXES_FOR_ROOM_SHAPE = {
            [RoomShape.ROOMSHAPE_1x1] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 14, 134, 120}, RoomShape.ROOMSHAPE_1x1)
            ),
            [RoomShape.ROOMSHAPE_IH] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({30, 44, 104, 90}, RoomShape.ROOMSHAPE_IH)
            ),
            [RoomShape.ROOMSHAPE_IV] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({4, 10, 130, 124}, RoomShape.ROOMSHAPE_IV)
            ),
            [RoomShape.ROOMSHAPE_1x2] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 14, 239, 225}, RoomShape.ROOMSHAPE_1x2)
            ),
            [RoomShape.ROOMSHAPE_IIV] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({4, 10, 235, 229}, RoomShape.ROOMSHAPE_IIV)
            ),
            [RoomShape.ROOMSHAPE_2x1] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 27, 251, 224}, RoomShape.ROOMSHAPE_2x1)
            ),
            [RoomShape.ROOMSHAPE_IIH] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({56, 83, 195, 168}, RoomShape.ROOMSHAPE_IIH)
            ),
            [RoomShape.ROOMSHAPE_2x2] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 27, 447, 420}, RoomShape.ROOMSHAPE_2x2)
            ),
            [RoomShape.ROOMSHAPE_LTL] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({13, 27, 447, 420, 196, 209}, RoomShape.ROOMSHAPE_LTL)
            ),
            [RoomShape.ROOMSHAPE_LTR] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 14, 210, 223, 447, 420}, RoomShape.ROOMSHAPE_LTR)
            ),
            [RoomShape.ROOMSHAPE_LBL] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 27, 447, 433, 237, 224}, RoomShape.ROOMSHAPE_LBL)
            ),
            [RoomShape.ROOMSHAPE_LBR] = TSIL.Utils.Tables.ConstructDictionaryFromTable(
                CornersToGridIndexList({0, 27, 251, 238, 434, 420}, RoomShape.ROOMSHAPE_LBR)
            ),
        }

        WALL_INDEXES_CLOSET = TSIL.Utils.Tables.ConstructDictionaryFromTable(
            CornersToGridIndexList({30, 38, 98, 90}, RoomShape.ROOMSHAPE_1x1)
        )

        WALL_INDEXES_BLACK_CLOSET = TSIL.Utils.Tables.ConstructDictionaryFromTable(
            CornersToGridIndexList({36, 44, 104, 96}, RoomShape.ROOMSHAPE_1x1)
        )

        WALL_INDEXES_MOTHER_FIGHT = TSIL.Utils.Tables.ConstructDictionaryFromTable(
            CornersToGridIndexList({0, 14, 164, 150}, RoomShape.ROOMSHAPE_1x1)
        )
    end

    local level = Game():GetLevel()
    local room = Game():GetRoom()
    local roomDesc = level:GetCurrentRoomDesc()

    local roomShape = room:GetRoomShape()
    local stage = level:GetStage()
    local roomSubtype = roomDesc.Data.Subtype
    local roomType = room:GetType()
    local stageId = roomDesc.Data.StageID

    if stage == LevelStage.STAGE8 and (roomSubtype == 10 or roomSubtype == 11) then
        if roomSubtype == 10 then
            return WALL_INDEXES_CLOSET[gridIndex]
        elseif roomSubtype == 11 then
            return WALL_INDEXES_BLACK_CLOSET[gridIndex]
        end
    elseif roomType == RoomType.ROOM_BOSS and stageId == 0 and roomSubtype == 88 then
        return WALL_INDEXES_MOTHER_FIGHT[gridIndex]
    else
        return WALL_INDEXES_FOR_ROOM_SHAPE[roomShape][gridIndex]
    end

    return false
end


local function EmptyRoomEntities()
    local room = Game():GetRoom()

    local entities = TSIL.Entities.GetEntities()

    TSIL.Utils.Tables.ForEach(entities, function (_, entity)
        if EMPTY_ROOM_BLACKLIST_ENTITY_SET[entity.Type] then
            return
        end

        if entity:HasEntityFlags(EntityFlag.FLAG_CHARM) or
        entity:HasEntityFlags(EntityFlag.FLAG_FRIENDLY) or
        entity:HasEntityFlags(EntityFlag.FLAG_PERSISTENT) then
            return
        end

        entity:ClearEntityFlags(EntityFlag.FLAG_APPEAR)
        entity:Remove()

        if entity.Type == EntityType.ENTITY_FIREPLACE then
            local gridIndex = room:GetGridIndex(entity.Position)
            room:SetGridPath(gridIndex, 0)
        end
    end)
end


local function EmptyRoomGrid()
    local removedOneOrMoreGridEntities = false
    local gridEntities = TSIL.GridEntities.GetGridEntities()

    TSIL.Utils.Tables.ForEach(gridEntities, function (_, gridEntity)
        local gridEntityType = gridEntity:GetType()
        local gridIndex = gridEntity:GetGridIndex()

        if gridEntityType == GridEntityType.GRID_WALL and
        isVanillaWallGridIndex(gridIndex) then
            return
        end

        if gridEntityType == GridEntityType.GRID_DOOR then
            return
        end

        TSIL.GridEntities.RemoveGridEntity(gridEntity, false)
        removedOneOrMoreGridEntities = true
    end)

    if removedOneOrMoreGridEntities then
        TSIL.Rooms.UpdateRoom()
    end
end

---Helper function to remove all naturally spawning entities and grid entities from a room.
---Notably, this will not remove players, tears, familiars, lasers, knives, projectiles,
---blacklisted NPCs such as Dark Esau, charmed NPCs, friendly NPCs, persistent NPCs, most effects,
---doors, and walls.
function TSIL.Rooms.EmptyRoom()
    EmptyRoomEntities()
    EmptyRoomGrid()
end