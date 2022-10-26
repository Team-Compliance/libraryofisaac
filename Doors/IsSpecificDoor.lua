--- Helper function to see if a door leads to an angel deal room.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsAngelRoomDoor(door)
    return door.TargetRoomType == RoomType.ROOM_ANGEL
end


--- Helper function to see if a door leads to an devil deal room.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDevilRoomDoor(door)
    return door.TargetRoomType == RoomType.ROOM_DEVIL
end


--- Helper function to see if a door is the blue womb entrance door that
--- appears after defeating Mom's Heart/It Lives.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsBlueWombDoor(door)
    return door.TargetRoomIndex == GridRooms.ROOM_BLUE_WOOM_IDX
end


--- Helper function to see if a door leads to any of the secret exit introduced
--- in Repentance, that lead you to the Repentance floors.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsSecretExitDoor(door)
    return door.TargetRoomIndex == GridRooms.ROOM_SECRET_EXIT_IDX
end


--- Helper function to see if a door leads to the secret exit to Downpour.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToDownpour(door)
    if not TSIL.Doors.IsSecretExitDoor(door) then
        return false
    end

    local sprite = door:GetSprite()
    local fileName = sprite:GetFilename()

    return string.lower(fileName) == "gfx/grid/door_downpour.anm2"
end


--- Helper function to see if a door leads to the secret exit to Mausoleum.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMausoleum(door)
    if not TSIL.Doors.IsSecretExitDoor(door) then
        return false
    end

    local sprite = door:GetSprite()
    local fileName = sprite:GetFilename()

    return string.lower(fileName) == "gfx/grid/door_mausoleum.anm2"
end


--- Helper function to see if a door leads to the secret exit to the ascent version of Mausoleum,
--- located in Depths 2 and requires The Polaroid or The Negative to open.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMausoleumAscent(door)
    if not TSIL.Doors.IsSecretExitDoor(door) then
        return false
    end

    local sprite = door:GetSprite()
    local fileName = sprite:GetFilename()

    return string.lower(fileName) == "gfx/grid/door_mausoleum_alt.anm2"
end


--- Helper function to see if a door leads to the secret exit to Mines.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMines(door)
    if not TSIL.Doors.IsSecretExitDoor(door) then
        return false
    end

    local sprite = door:GetSprite()
    local fileName = sprite:GetFilename()

    return string.lower(fileName) == "gfx/grid/door_mines.anm2"
end


--- Helper function to see if a door is the door that spawns after defeating Mom in
--- Mausoleum II and requires both knife pieces to open.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMomsHeart(door)
    if not TSIL.Doors.IsSecretExitDoor(door) then
        return false
    end

    local sprite = door:GetSprite()
    local fileName = sprite:GetFilename()

    return string.lower(fileName) == "gfx/grid/door_momsheart.anm2"
end


--- Helper function to check if a door is a hole in the wall that appears after
--- bombing the entrance to a secret room.
---
--- Note that the door still exists even if it hasn't been bombed yet.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsSecretRoomDoor(door)
    local sprite = door:GetSprite()
    local fileName = sprite:GetFilename()

    return string.lower(fileName) == "gfx/grid/door_08_holeinwall.anm2"
end


--- Helper function to check if a door is a hole in the wall that appears after
--- bombing the entrance to a secret room but hasn't been revealed yet.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsHiddenSecretDoor(door)
    local sprite = door:GetSprite()
    local animation = sprite:GetAnimation()

    return TSIL.Doors.IsSecretRoomDoor(door) and animation == "Hidden"
end