--- Helper function to check if a given door slot can be present in a given room shape.
---@param doorSlot DoorSlot
---@param roomShape RoomShape
---@return boolean
function TSIL.Doors.IsDoorSlotInRoomShape(doorSlot, roomShape)
    local doorSlotsInRoomShape = TSIL.Doors.GetDoorSlotsForRoomShape(roomShape)
    return TSIL.Utils.Tables.IsIn(doorSlotsInRoomShape, doorSlot)
end