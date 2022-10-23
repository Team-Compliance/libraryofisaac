local DOOR_SLOT_TO_DIRECTION = {
    [DoorSlot.NO_DOOR_SLOT] = Direction.NO_DIRECTION,
    [DoorSlot.LEFT0] = Direction.LEFT,
    [DoorSlot.UP0] = Direction.UP,
    [DoorSlot.RIGHT0] = Direction.RIGHT,
    [DoorSlot.DOWN0] = Direction.DOWN,
    [DoorSlot.LEFT1] = Direction.LEFT,
    [DoorSlot.UP1] = Direction.UP,
    [DoorSlot.RIGHT1] = Direction.RIGHT,
    [DoorSlot.DOWN1] = Direction.DOWN,
}


--- Helper function to get the direction corresponding to a given door slot.
---@param doorSlot DoorSlot
---@return Direction
function TSIL.Doors.DoorSlotToDirection(doorSlot)
    return DOOR_SLOT_TO_DIRECTION[doorSlot]
end