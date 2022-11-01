--- Helper function to get the width of the grid in a given room shape.
---@param shape RoomShape
---@return integer
function TSIL.Rooms.GetRoomShapeGridWidth(shape)
	local gridWidth = 15

	if shape == RoomShape.ROOMSHAPE_2x1 or shape == RoomShape.ROOMSHAPE_IIH or
	shape == RoomShape.ROOMSHAPE_2x2 or shape == RoomShape.ROOMSHAPE_LTL or
	shape == RoomShape.ROOMSHAPE_LTR or shape == RoomShape.ROOMSHAPE_LBL or
	shape == RoomShape.ROOMSHAPE_LBR then
		gridWidth = 28
	end

    return gridWidth
end