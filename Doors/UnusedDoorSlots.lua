--- Helper function to get all unused door slots in the current room.
---
--- Useful to spawn custom doors.
---@return DoorSlot[]
function TSIL.Doors.GetUnusedDoorSlots()
    local room = Game():GetRoom()
    local unusedDoorSlots = {}

    for i = 0, DoorSlot.NUM_DOOR_SLOTS-1, 1 do
        ---@cast i DoorSlot
        if room:IsDoorSlotAllowed(i) and not room:GetDoor(i) then
            unusedDoorSlots[#unusedDoorSlots+1] = i
        end
    end

    return unusedDoorSlots
end


--- Helper function to check if the current room has any unused door slots.
---@return boolean
function TSIL.Doors.HasUnusedDoorSlot()
    local unusedDoorSots = TSIL.Doors.GetUnusedDoorSlots()
    return #unusedDoorSots > 0
end