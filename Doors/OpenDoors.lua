--- Helper function to open a door instantly without playing its open animation.
---@param door GridEntityDoor
function TSIL.Doors.OpenDoorFast(door)
    door.State = DoorState.STATE_OPEN

    local sprite = door:GetSprite()
    sprite:Play("Opened", true)
end


--- Helper funciton to open all doors in the current room
---@param playAnim boolean @ If set to false, the doors won't play the open animation.
function TSIL.Doors.OpenAllDoors(playAnim)
    local doors = TSIL.Doors.GetDoors()

    for _, door in ipairs(doors) do
        if playAnim then
            door:Open()
        else
            TSIL.Doors.OpenDoorFast(door)
        end
    end
end