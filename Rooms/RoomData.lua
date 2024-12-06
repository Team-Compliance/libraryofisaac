--- Alias for the `Level.GetCurrentRoomDesc` method. Use this to make it more clear what type of
--- `RoomDescriptor` object that you are retrieving.
---@return RoomDescriptor
function TSIL.Rooms.GetRoomDescriptorReadOnly()
	local level = Game():GetLevel()
	return level:GetCurrentRoomDesc()
end


--- Helper function to get the grid index of the current room.
---
--- - If the current room is inside of the grid, this function will return the `SafeGridIndex` from
---   the room descriptor. (The safe grid index is defined as the top-left 1x1 section that the room
---   overlaps with, or the top-right 1x1 section of a `RoomType.SHAPE_LTL` room.)
--- - If the current room is outside of the grid, it will return the index from the
---   `Level.GetCurrentRoomIndex` method (since `SafeGridIndex` is bugged for these cases).
---
--- Use this function instead of the `Level.GetCurrentRoomIndex` method directly because the latter
--- will return the specific 1x1 quadrant that the player entered the room at. For most situations,
--- using the safe grid index is more reliable than this.
---
--- Data structures that store data per room should use the room's `ListIndex` instead of
--- `SafeGridIndex`, since the former is unique across different dimensions.
---@return integer
function TSIL.Rooms.GetRoomGridIndex()
	local level = Game():GetLevel()
	local currentRoomIndex = level:GetCurrentRoomIndex()

	-- Both `RoomDescriptor.GridIndex` and `RoomDescriptor.SafeGridIndex` will always be equal to -1
	-- for rooms outside of the grid. Thus, we revert to using the `Level.GetCurrentRoomIndex` method
	-- for these cases.
	if currentRoomIndex < 0 then
		return currentRoomIndex
	end

	local roomDescriptor = TSIL.Rooms.GetRoomDescriptorReadOnly()
	return roomDescriptor.SafeGridIndex
end


--- Helper function to get the descriptor for a room.
---@param roomGridIndex integer? @Leave nil to get the current room descriptor.
---@return RoomDescriptor
function TSIL.Rooms.GetRoomDescriptor(roomGridIndex)
	local level = Game():GetLevel()

	if roomGridIndex == nil then
		roomGridIndex = level:GetCurrentRoomIndex()
	end

	return level:GetRoomByIdx(roomGridIndex)
end


--- Helper function to get the room data for the provided room.
---@param roomGridIndex integer? @Leave nil to get the current room data.
---@return RoomConfigRoom? @Can be nil if the room index doesn't correspond to a real room.
function TSIL.Rooms.GetRoomData(roomGridIndex)
	local roomDescriptor = TSIL.Rooms.GetRoomDescriptor(roomGridIndex);
	return roomDescriptor.Data
end


--- Helper function to get the stage ID for a room from the XML/STB data. The room stage ID will
--- correspond to the first number in the filename of the XML/STB file. For example, a Depths room
--- would have a stage ID of 7.
---@param roomGridIndex integer? @Leave nil to get the current room stage ID.
---@return integer
function TSIL.Rooms.GetRoomStageID(roomGridIndex)
	local roomData = TSIL.Rooms.GetRoomData(roomGridIndex)

	if roomData == nil then
		return -1
	end

	return roomData.StageID
end


--- Helper function to get the sub-type for a room from the XML/STB data. The room sub-type will
--- correspond to different things depending on what XML/STB file it draws from. For example, in the
--- "00.special rooms.stb" file, an Angel Room with a sub-type of 0 will correspond to a normal Angel
--- Room and a sub-type of 1 will correspond to an Angel Room shop for The Stairway.
---@param roomGridIndex integer? @Leave nil to get the current room subtype.
---@return integer
function TSIL.Rooms.GetRoomSubType(roomGridIndex)
	local roomData = TSIL.Rooms.GetRoomData(roomGridIndex)

	if roomData == nil then
		return -1
	end

	return roomData.Subtype
end