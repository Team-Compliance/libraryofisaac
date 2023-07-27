---Helper function to get the corresponding ambush type for the current room. Returns nil if
---the current room does not correspond to any particular ambush type
---@return AmbushType?
function TSIL.Ambush.GetAmbushType()
    local room = Game():GetRoom()
    local roomType = room:GetType()

    if roomType == RoomType.ROOM_BOSSRUSH then
        return TSIL.Enums.AmbushType.BOSS_RUSH
    elseif roomType == RoomType.ROOM_CHALLENGE then
        return TSIL.Enums.AmbushType.CHALLENGE_ROOM
    end
end
