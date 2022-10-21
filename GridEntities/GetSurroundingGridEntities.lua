---comment
---@param gridEntity GridEntity
---@return GridEntity[]
function TSIL.GridEntities.GetSurroundingGridEntities(gridEntity)
    local room = Game():GetRoom()
    local shape = room:GetRoomShape()

    local gridWidth = 15

    if shape == RoomShape.ROOMSHAPE_2x1 or shape == RoomShape.ROOMSHAPE_IIV or
    shape == RoomShape.ROOMSHAPE_2x2 or shape == RoomShape.ROOMSHAPE_LTL or
    shape == RoomShape.ROOMSHAPE_LTR or shape == RoomShape.ROOMSHAPE_LBL or
    shape == RoomShape.ROOMSHAPE_LBR then
        gridWidth = 28
    end

    local gridIndex = gridEntity:GetGridIndex()

    local surroundingGridIndexes = {
        gridIndex - gridWidth, --Top
        gridIndex + gridWidth, --Under
    }

    if gridIndex % gridWidth ~= 0 then
        surroundingGridIndexes[#surroundingGridIndexes+1] = gridIndex - 1
        surroundingGridIndexes[#surroundingGridIndexes+1] = gridIndex - gridWidth - 1
        surroundingGridIndexes[#surroundingGridIndexes+1] = gridIndex + gridWidth - 1
    end

    if gridIndex % gridWidth ~= gridWidth - 1 then
        surroundingGridIndexes[#surroundingGridIndexes+1] = gridIndex + 1
        surroundingGridIndexes[#surroundingGridIndexes+1] = gridIndex - gridWidth + 1
        surroundingGridIndexes[#surroundingGridIndexes+1] = gridIndex + gridWidth + 1
    end

    local validGridIndexes = TSIL.Utils.Tables.Filter(surroundingGridIndexes, function (_, adjacentGridIndex)
        return TSIL.GridEntities.IsGridIndexInRoom(adjacentGridIndex)
    end)

    local surroundingGridEntities = {}

    for _, adjacentGridIndex in ipairs(validGridIndexes) do
        local adjacentGridEntity = room:GetGridEntity(adjacentGridIndex)

        if adjacentGridEntity then
            surroundingGridEntities[#surroundingGridEntities+1] = adjacentGridEntity
        end
    end

    return surroundingGridEntities
end