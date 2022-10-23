local DIRECTION_TO_VECTOR = {
    [Direction.NO_DIRECTION] = Vector.Zero,
    [Direction.LEFT] = Vector(-1, 0),
    [Direction.UP] = Vector(0, -1),
    [Direction.RIGHT] = Vector(1, 0),
    [Direction.DOWN] = Vector(0, 1)
}


--- Helper function to get the offset from a door position that a player will enter a room at.
---@param doorSlot any
---@return Vector
function TSIL.Doors.GetDoorSlotEnterPositionOffset(doorSlot)
    local direction = TSIL.Doors.DoorSlotToDirection(doorSlot)
    local vector = DIRECTION_TO_VECTOR[direction]

    local oppositeVector = vector * -1

    return oppositeVector * 40
end


--- Helper function to get the position that a player will enter a room at corresponding to a door slot.
---@param doorSlot DoorSlot
---@return Vector
function TSIL.Doors.GetDoorSlotEnterPosition(doorSlot)
    local room = Game():GetRoom()

    local position = room:GetDoorSlotPosition(doorSlot)
    local offset = TSIL.Doors.GetDoorSlotEnterPositionOffset(doorSlot)

    return position + offset
end


--- Helper function to get the position that a player will enter a room at corresponding to a door.
---@param door GridEntityDoor
---@return Vector
function TSIL.Doors.GetDoorEnterPosition(door)
    local offset = TSIL.Doors.GetDoorSlotEnterPositionOffset(door.Slot)
    return door.Position + offset
end