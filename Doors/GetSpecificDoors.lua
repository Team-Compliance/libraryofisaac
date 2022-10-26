--- Helper function to get the angel room door in the current room.
--- If there isn't any, returns nil.
---@return GridEntityDoor?
function TSIL.Doors.GetAngelRoomDoor()
    local angelDoors = TSIL.Doors.GetDoors(RoomType.ROOM_ANGEL)
    return angelDoors[1]
end


--- Helper function to get the devil room door in the current room.
--- If there isn't any, returns nil.
---@return GridEntityDoor?
function TSIL.Doors.GetDevilRoomDoor()
    local devilDoors = TSIL.Doors.GetDoors(RoomType.ROOM_DEVIL)
    return devilDoors[1]
end


--- Helper function to get an angel or devil room door in the current room.
---
--- Note that if there are both an angel and devil room door it'll only return the one in the lowest door slot.
---@return GridEntityDoor?
function TSIL.Doors.GetAngelOrDevilRoomDoor()
    local angelDevilDoors = TSIL.Doors.GetDoors(RoomType.ROOM_ANGEL, RoomType.ROOM_DEVIL)
    return angelDevilDoors[1]
end


--- Helper function to get the door that leads to the blue womb entrance in the current room.
---@return GridEntityDoor?
function TSIL.Doors.GetBlueWombDoor()
    local blueWombDoors = TSIL.Doors.GetDoorsToRoomIndex(GridRooms.ROOM_BLUE_WOOM_IDX)
    return blueWombDoors[1]
end


--- Helper function to get the door that leads to a repentance secret exit in the current room.
---@return GridEntityDoor?
function TSIL.Doors.GetSecretExitDoor()
    local blueWombDoors = TSIL.Doors.GetDoorsToRoomIndex(GridRooms.ROOM_SECRET_EXIT_IDX)
    return blueWombDoors[1]
end