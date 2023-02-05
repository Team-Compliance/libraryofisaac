--- Helper function to get the grid index of the top left wall.
---@return integer
function TSIL.GridEntities.GetTopLeftWallGridIndex()
	local room = Game():GetRoom()
	local gridSize = room:GetGridSize()
	local roomShape = room:GetRoomShape()

	for i = 0, gridSize, 1 do
		if TSIL.Rooms.IsGridIndexInRoomShape(i, roomShape) then
			return i
		end
	end

	return 0
end


--- Helper function to get the top left wall grid entity.
---@return GridEntity
function TSIL.GridEntities.GetTopLeftWall()
	local room = Game():GetRoom()

	local topLeftGridIndex = TSIL.GridEntities.GetTopLeftWallGridIndex()

	return room:GetGridEntity(topLeftGridIndex)
end