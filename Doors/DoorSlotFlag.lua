--- Helper function to get a door slot flag from a door slot.
---@param doorSlot DoorSlot
---@return integer
function TSIL.Doors.DoorSlotToDoorSlotFlag(doorSlot)
    return 1 << doorSlot
end


--- Helper function to convert the provided door slots into a door slot bitmask.
---@param ... DoorSlot
---@return integer
function TSIL.Doors.DoorSlotsToDoorSlotBitMask(...)
    local doorSlots = {...}
    local doorSlotBitMask = 0

    for _, doorSlot in ipairs(doorSlots) do
        doorSlotBitMask = doorSlotBitMask | TSIL.Doors.DoorSlotToDoorSlotFlag(doorSlot)
    end

    return doorSlotBitMask
end


--- Helper function to get the door slots corresponding to a door slot bit mask.
---@param doorSlotBitMask integer
---@return DoorSlot[]
function TSIL.Doors.GetDoorSlotsFromDoorSlotBitMask(doorSlotBitMask)
    local doorSlots = {}

    for doorSlot = 0, DoorSlot.NUM_DOOR_SLOTS-1, 1 do
        ---@diagnostic disable-next-line: unknown-cast-variable
        ---@cast doorSlot DoorSlot
        if TSIL.Utils.Flags.HasFlags(doorSlotBitMask, TSIL.Doors.DoorSlotToDoorSlotFlag(doorSlot)) then
            doorSlots[#doorSlots+1] = doorSlot
        end
    end

    return doorSlots
end