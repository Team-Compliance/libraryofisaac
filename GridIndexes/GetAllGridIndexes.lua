--- Helper function to get every legal grid index for the current room.
--- If `onlyInRoom` is set to true it will only return those that are actually in the room,
--- accounting for L shaped and small rooms.
---@param onlyInRoom boolean? @ Default: true
---@return integer[]
function TSIL.GridIndexes.GetAllGridIndexes(onlyInRoom)
	if onlyInRoom == nil then onlyInRoom = true end

	local room = Game():GetRoom()
	local gridSize = room:GetGridSize()
	local roomShape = room:GetRoomShape()

	local gridIndexes = {}

	for i = 0, gridSize, 1 do
		if not onlyInRoom or TSIL.Rooms.IsGridIndexInRoomShape(i, roomShape) then
			gridIndexes[#gridIndexes+1] = i
		end
	end

	return gridIndexes
end