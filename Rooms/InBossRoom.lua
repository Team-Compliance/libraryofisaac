--- Helper function to check if the current room is a boss room for a particular boss. This will only
--- work for bosses that have dedicated boss rooms in the "00.special rooms.stb" file.
---@param bossID BossType
---@return boolean
function TSIL.Rooms.InBossRoomOf(bossID)
    local room = Game():GetRoom()
    local roomType = room:GetType()
    local roomStageID = TSIL.Rooms.GetRoomStageID()
    local roomSubType = TSIL.Rooms.GetRoomSubType()

    return roomType == RoomType.ROOM_BOSS and
    roomStageID == TSIL.Enums.StageID.SPECIAL_ROOMS and
    roomSubType == bossID
end