--##POST_PLAYER_INIT_FIRST

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PLAYER_INIT_FIRST,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)


local function OnNewRoomReordered()
    if not TSIL.RoomSpecific.InGenesisRoom() then
        return
    end

    for i = 0, Game():GetNumPlayers()-1, 1 do
        local player = Game():GetPlayer(i)
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_INIT_FIRST, player)
    end
end
TSIL.__AddInternalCallback(
    "PLAYER_INIT_FIRST_CALLBACK_ON_NEW_ROOM_REORDERED",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED,
    OnNewRoomReordered
)


---@param player EntityPlayer
local function OnPlayerInitLate(_, player)
    if TSIL.Players.IsChildPlayer(player) then
        return
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_INIT_FIRST, player)
end
TSIL.__AddInternalCallback(
    "PLAYER_INIT_FIRST_CALLBACK_ON_PLAYER_INIT_LATE",
    TSIL.Enums.CustomCallback.POST_PLAYER_INIT_LATE,
    OnPlayerInitLate
)
