--- Helper function to open a door instantly without playing its open animation.
---@param door GridEntityDoor
function TSIL.Doors.CloseDoorFast(door)
    door.State = DoorState.STATE_CLOSED

    local sprite = door:GetSprite()
    sprite:Play("Closed", true)
end


--- Helper funciton to close all doors in the current room.
---@param playAnim boolean @ If set to false, the doors won't play the close animation.
function TSIL.Doors.CloseAllDoors(playAnim)
    local doors = TSIL.Doors.GetDoors()

    for _, door in ipairs(doors) do
        if playAnim then
            door:Close(true)
        else
            TSIL.Doors.CloseDoorFast(door)
        end
    end
end


--- Helper function to reset an unlocked door back to its locked state.
---@param door GridEntityDoor
function TSIL.Doors.LockDoor(door)
    local level = Game():GetLevel()

    local roomDescriptor = level:GetRoomByIdx(door.TargetRoomIndex)
    roomDescriptor.VisitedCount = 0

    door:SetVariant(DoorVariant.DOOR_LOCKED)
    door:SetLocked(true)
    door:Close(true)
end