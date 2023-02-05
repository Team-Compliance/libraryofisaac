--- Helper function to get all grid entities around a grid index, not including itself.
---@param gridIndex GridEntity
---@return GridEntity[]
function TSIL.GridEntities.GetSurroundingGridEntities(gridIndex)
	local room = Game():GetRoom()

	local gridWidth = TSIL.Rooms.GetRoomShapeGridWidth(room:GetRoomShape())

	local gridIndex = gridIndex

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