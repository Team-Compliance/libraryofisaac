--- Helper function to remove a single door
---@param door GridEntityDoor
function TSIL.Doors.RemoveDoor(door)
    local room = Game():GetRoom()
    room:RemoveDoor(door.Slot)
end


--- Helper function to remove all the given doors
---@param doors GridEntityDoor[]
function TSIL.Doors.RemoveDoors(doors)
    for _, door in ipairs(doors) do
        TSIL.Doors.RemoveDoor(door)
    end
end


--- Helper function to remove all doors of the given room types.
---@param ... RoomType @ If no room type is specified, all doors will get removed.
function TSIL.Doors.RemoveAllDoorsOfType(...)
    local doors = TSIL.Doors.GetDoors(...)
    TSIL.Doors.RemoveDoors(doors)
end