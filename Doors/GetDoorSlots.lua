local ALL_DOORS = {
    DoorSlot.LEFT0,
    DoorSlot.UP0,
    DoorSlot.RIGHT0,
    DoorSlot.DOWN0,
    DoorSlot.LEFT1,
    DoorSlot.UP1,
    DoorSlot.RIGHT1,
    DoorSlot.DOWN1,
}

local ROOM_SHAPE_TO_DOOR_SLOTS = {
    [RoomShape.ROOMSHAPE_1x1] = {
        DoorSlot.LEFT0,
        DoorSlot.UP0,
        DoorSlot.RIGHT0,
        DoorSlot.DOWN0,
    },
    [RoomShape.ROOMSHAPE_IH] = {
        DoorSlot.LEFT0,
        DoorSlot.RIGHT0,
    },
    [RoomShape.ROOMSHAPE_IV] = {
        DoorSlot.UP0,
        DoorSlot.DOWN0,
    },
    [RoomShape.ROOMSHAPE_1x2] = {
        DoorSlot.LEFT0,
        DoorSlot.UP0,
        DoorSlot.RIGHT0,
        DoorSlot.DOWN0,
        DoorSlot.LEFT1,
        DoorSlot.RIGHT1
    },
    [RoomShape.ROOMSHAPE_IIV] = {
        DoorSlot.UP0,
        DoorSlot.DOWN0,
    },
    [RoomShape.ROOMSHAPE_2x1] = {
        DoorSlot.LEFT0,
        DoorSlot.UP0,
        DoorSlot.RIGHT0,
        DoorSlot.DOWN0,
        DoorSlot.UP1,
        DoorSlot.DOWN1
    },
    [RoomShape.ROOMSHAPE_IIH] = {
        DoorSlot.LEFT0,
        DoorSlot.RIGHT0,
    },
    [RoomShape.ROOMSHAPE_2x2] = ALL_DOORS,
    [RoomShape.ROOMSHAPE_LTL] = ALL_DOORS,
    [RoomShape.ROOMSHAPE_LTR] = ALL_DOORS,
    [RoomShape.ROOMSHAPE_LBL] = ALL_DOORS,
    [RoomShape.ROOMSHAPE_LBR] = ALL_DOORS
}


--- Helper function to get all the possible door slots in a room shape.
---@param roomShape RoomShape
---@return DoorSlot[]
function TSIL.Doors.GetDoorSlotsForRoomShape(roomShape)
    return ROOM_SHAPE_TO_DOOR_SLOTS[roomShape]
end