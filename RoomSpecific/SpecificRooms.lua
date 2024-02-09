local MINE_SHAFT_ROOM_SUB_TYPE_SET = {
    [10] = true,
    [11] = true,
    [20] = true,
    [30] = true,
    [31] = true
}


---Helper function to check if the players are in the beast room.
---@return boolean
function TSIL.RoomSpecific.InBeastRoom()
    local room = Game():GetRoom()
    local roomType = room:GetType()
    local roomSubType = TSIL.Rooms.GetRoomSubType()

    return roomType == RoomType.ROOM_DUNGEON and roomSubType == 4
end


---Helper function for determining whether the current room is a crawl space. Use this function over
---comparing to `RoomType.DUNGEON` or `GridRoom.DUNGEON_IDX` since there is a special case of the
---player being in a boss fight that take place in a dungeon.
---@return boolean
function TSIL.RoomSpecific.InCrawlSpace()
    local room = Game:GetRoom()
    local roomType = room:GetType()
    local roomSubType = TSIL.Rooms.GetRoomSubType()

    return roomType == RoomType.ROOM_DUNGEON and roomSubType == 0
end


---Helper function to detect if the current room is one of the rooms in the Death Certificate area.
---@return boolean
function TSIL.RoomSpecific.InDeathCertificateArea()
    local roomStageID = TSIL.Rooms.GetRoomStageID()
    local roomSubType = TSIL.Rooms.GetRoomSubType()

    return roomStageID == TSIL.Enums.StageID.HOME and
    (roomSubType == 33 or roomSubType == 34)
end


---Helper function to check if the players are in a devils crown treasure room.
---@return boolean
function TSIL.RoomSpecific.InDevilsCrownTreasureRoom()
    local roomDescriptor = TSIL.Rooms.GetRoomDescriptorReadOnly()
    return TSIL.Utils.Flags.HasFlags(roomDescriptor.Flags, RoomDescriptor.FLAG_DEVIL_TREASURE)
end


---Helper function to check if the players are in the genesis room.
---@return boolean
function TSIL.RoomSpecific.InGenesisRoom()
    local roomGridIndex = TSIL.Rooms.GetRoomGridIndex()

    return roomGridIndex == GridRooms.ROOM_GENESIS_IDX
end


---Helper function to check if the players are in any of the home closets.
---@return boolean
function TSIL.RoomSpecific.InHomeCloset()
    local level = Game:GetLevel()
    local stage = level:GetStage()
    local roomSubType = TSIL.Rooms.GetRoomSubType()

    return stage == LevelStage.HOME and (roomSubType == 10 or roomSubType == 11)
end


---Helper function to check if the players are in the Mega Satan room.
---@return boolean
function TSIL.RoomSpecific.InMegaSatanRoom()
    local roomGridIndex = TSIL.Rooms.GetRoomGridIndex()

    return roomGridIndex == GridRooms.ROOM_MEGA_SATAN_IDX
end


---Helper function to determine if the current room is part of the Repentance "escape sequence" in
---the Mines/Ashpit.
---@return boolean
function TSIL.RoomSpecific.InMineShaft()
    local roomStageID = TSIL.Rooms.GetRoomStageID()
    local roomSubType = TSIL.Rooms.GetRoomSubType()

    return (roomStageID == TSIL.Enums.StageID.STAGE_MINES or roomStageID == TSIL.Enums.StageID.STAGE_ASHPIT) and
    MINE_SHAFT_ROOM_SUB_TYPE_SET[roomSubType]
end


---Helper function for checking if the current room is a secret exit that leads to a Repentance
---floor.
---@return boolean
function TSIL.RoomSpecific.InSecretExit()
    local roomGridIndex = TSIL.Rooms.GetRoomGridIndex()

    return roomGridIndex == GridRooms.ROOM_SECRET_EXIT_IDX
end


--- Helper function for checking if the current room is a secret shop (from the Member Card
--- collectible).
---
--- Secret shops are simply copies of normal shops, but with the backdrop of a secret room. In other
--- words, they will have the same room type, room variant, and room sub-type of a normal shop. Thus,
--- the only way to detect them is by using the grid index.
---@return boolean
function TSIL.RoomSpecific.InSecretShop()
    local roomGridIndex = TSIL.Rooms.GetRoomGridIndex()

    return roomGridIndex == GridRooms.ROOM_SECRET_SHOP_IDX
end


---Helper function to determine whether or not the current room is the starting room of a floor. It
---only returns true for the starting room of the primary dimension (meaning that being in the
---starting room of the mirror world does not count).
---@return boolean
function TSIL.RoomSpecific.InStartingRoom()
    local level = Game():GetLevel()
    local startingRoomGridIndex = level:GetStartingRoomIndex()
    local roomGridIndex = TSIL.Rooms.GetRoomGridIndex()

    return roomGridIndex == startingRoomGridIndex and TSIL.Dimensions.InDimension(TSIL.Enums.Dimension.MAIN)
end