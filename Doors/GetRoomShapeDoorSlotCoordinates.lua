local ROOM_SHAPE_TO_DOOR_SLOT_COORDINATES = {
    [RoomShape.ROOMSHAPE_1x1] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=13, y=3},
        [DoorSlot.DOWN0] = {x=6, y=7}
    },
    [RoomShape.ROOMSHAPE_IH] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.RIGHT0] = {x=13, y=3},
    },
    [RoomShape.ROOMSHAPE_IV] = {
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.DOWN0] = {x=6, y=7}
    },
    [RoomShape.ROOMSHAPE_1x2] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=13, y=3},
        [DoorSlot.DOWN0] = {x=6, y=14},
        [DoorSlot.LEFT1] = {x=-1, y=10},
        [DoorSlot.RIGHT1] = {x=13, y=10}
    },
    [RoomShape.ROOMSHAPE_IIV] = {
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.DOWN0] = {x=6, y=14},
    },
    [RoomShape.ROOMSHAPE_2x1] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=26, y=3},
        [DoorSlot.DOWN0] = {x=6, y=7},
        [DoorSlot.UP1] = {x=19, y=-1},
        [DoorSlot.DOWN1] = {x=19, y=7}
    },
    [RoomShape.ROOMSHAPE_IIH] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.RIGHT0] = {x=26, y=3},
    },
    [RoomShape.ROOMSHAPE_2x2] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=26, y=3},
        [DoorSlot.DOWN0] = {x=6, y=14},
        [DoorSlot.LEFT1] = {x=-1, y=10},
        [DoorSlot.UP1] = {x=19, y=-1},
        [DoorSlot.RIGHT1] = {x=26, y=10},
        [DoorSlot.DOWN1] = {x=19, y=14}
    },
    [RoomShape.ROOMSHAPE_LTL] = {
        [DoorSlot.LEFT0] = {x=12, y=3},
        [DoorSlot.UP0] = {x=6, y=6},
        [DoorSlot.RIGHT0] = {x=26, y=3},
        [DoorSlot.DOWN0] = {x=6, y=14},
        [DoorSlot.LEFT1] = {x=-1, y=10},
        [DoorSlot.UP1] = {x=19, y=-1},
        [DoorSlot.RIGHT1] = {x=26, y=10},
        [DoorSlot.DOWN1] = {x=19, y=14}
    },
    [RoomShape.ROOMSHAPE_LTR] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=13, y=3},
        [DoorSlot.DOWN0] = {x=6, y=14},
        [DoorSlot.LEFT1] = {x=-1, y=10},
        [DoorSlot.UP1] = {x=19, y=6},
        [DoorSlot.RIGHT1] = {x=26, y=10},
        [DoorSlot.DOWN1] = {x=19, y=14}
    },
    [RoomShape.ROOMSHAPE_LBL] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=26, y=3},
        [DoorSlot.DOWN0] = {x=6, y=7},
        [DoorSlot.LEFT1] = {x=12, y=10},
        [DoorSlot.UP1] = {x=19, y=-1},
        [DoorSlot.RIGHT1] = {x=26, y=10},
        [DoorSlot.DOWN1] = {x=19, y=14}
    },
    [RoomShape.ROOMSHAPE_LBR] = {
        [DoorSlot.LEFT0] = {x=-1, y=3},
        [DoorSlot.UP0] = {x=6, y=-1},
        [DoorSlot.RIGHT0] = {x=26, y=3},
        [DoorSlot.DOWN0] = {x=6, y=14},
        [DoorSlot.LEFT1] = {x=-1, y=10},
        [DoorSlot.UP1] = {x=19, y=-1},
        [DoorSlot.RIGHT1] = {x=13, y=10},
        [DoorSlot.DOWN1] = {x=19, y=7}
    },
}


--- Helper function to get the corresponding door slot for a given room shape and grid coordinates.
---@param roomShape RoomShape
---@param x integer
---@param y integer
---@return DoorSlot?
function TSIL.Doors.GetRoomShapeDoorSlot(roomShape, x, y)
    local coordinatesPerDoorSlot = ROOM_SHAPE_TO_DOOR_SLOT_COORDINATES[roomShape]

    for doorSlot, coordinates in pairs(coordinatesPerDoorSlot) do
        if x == coordinates.x and y == coordinates.y then
            return doorSlot
        end
    end

    return nil
end


--- Helper function to get the grid coordinates for a specific room shape and door slot combination.
---@param roomShape RoomShape
---@param doorSlot DoorSlot
---@return {x:integer, y:integer}?
function TSIL.Doors.GetRoomShapeDoorSlotCoordinates(roomShape, doorSlot)
    local coordinatesPerDoorSlot = ROOM_SHAPE_TO_DOOR_SLOT_COORDINATES[roomShape]
    return coordinatesPerDoorSlot[doorSlot]
end