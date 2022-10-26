--- Helper function to return all doors in the current room.
---
--- You can optionally specify one or more room types to return only the doors
--- that match the specified room types.
---@param ... RoomType
---@return GridEntityDoor[]
function TSIL.Doors.GetDoors(...)
    local possibleRoomTypes = {...}
    local room = Game():GetRoom()
    local doors = {}

    for i = 0, DoorSlot.NUM_DOOR_SLOTS-1, 1 do
        ---@cast i DoorSlot
        local door = room:GetDoor(i)

        if door and (#possibleRoomTypes == 0 or TSIL.Utils.Tables.IsIn(possibleRoomTypes, door.TargetRoomType)) then
            doors[#doors+1] = door
        end
    end

    return doors
end


--- Helper function to return all doors in the current room that lead to
--- a given room index.
---@param ... integer
---@return GridEntityDoor[]
function TSIL.Doors.GetDoorsToRoomIndex(...)
    local possibleRoomIndexes = {...}
    local room = Game():GetRoom()
    local doors = {}

    for i = 0, DoorSlot.NUM_DOOR_SLOTS-1, 1 do
        ---@cast i DoorSlot
        local door = room:GetDoor(i)

        if door and (#possibleRoomIndexes == 0 or TSIL.Utils.Tables.IsIn(possibleRoomIndexes, door.TargetRoomIndex)) then
            doors[#doors+1] = door
        end
    end

    return doors
end