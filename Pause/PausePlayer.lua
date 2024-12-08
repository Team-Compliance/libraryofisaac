local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "pausedPlayersInfo_PAUSE_PLAYER",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM,
        true
    )
end
TSIL.__AddInternalCallback(
    "PAUSE_PLAYER_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


local function OnNewRoomEarly()
    TSIL.Pause.UnpauseAllPlayers()
end
TSIL.__AddInternalCallback(
    "PAUSE_PLAYER_NEW_ROOM_EARLY",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_EARLY,
    OnNewRoomEarly
)


--- Stores the current state of the player so when the player is unpaused
--- it can be restored properly.
---@param player EntityPlayer
local function GetPlayerStateBeforePause(player)
    return {
        ControlsEnabled = player.ControlsEnabled,
        EntityCollisionClass = player.EntityCollisionClass
    }
end


--- Starts the pause effects for a paused player.
---@param player EntityPlayer
local function DoPauseEffects(player)
    player.ControlsEnabled = false
    player.EntityCollisionClass = EntityCollisionClass.ENTCOLL_NONE
end


--- Removes the effects of a paused player.
---@param player EntityPlayer
local function UndoPauseEffects(player, state)
    player.ControlsEnabled = state.ControlsEnabled
    player.EntityCollisionClass = state.EntityCollisionClass
end


--- Pauses a player, removing its controls, stopping them in place and making them intangible.
--- 
--- Does nothing if the player was already paused.
--- 
--- Note that this only lasts for the current room.
---@param player EntityPlayer
function TSIL.Pause.PausePlayer(player)
    local pausedPlayers = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "pausedPlayersInfo_PAUSE_PLAYER"
    )
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    -- Don't pause again if the player was already paused.
    if not pausedPlayers[playerIndex] then
        pausedPlayers[playerIndex] = GetPlayerStateBeforePause(player)

        DoPauseEffects(player)
    end
end


--- Unpauses a player that was stopped using `TSIL.Pause.PausePlayer`.
--- 
--- Does nothing if the player wasn't paused.
---@param player EntityPlayer
function TSIL.Pause.UnpausePlayer(player)
    local pausedPlayers = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "pausedPlayersInfo_PAUSE_PLAYER"
    )
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local state = pausedPlayers[playerIndex]

    pausedPlayers[playerIndex] = nil

    if state then
        UndoPauseEffects(player, state)
    end
end


--- Checks if a player was paused using `TSIL.Pause.PausePlayer`.
---@param player EntityPlayer
function TSIL.Pause.IsPlayerPaused(player)
    local pausedPlayers = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "pausedPlayersInfo_PAUSE_PLAYER"
    )
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    return not not pausedPlayers[playerIndex]
end


--- Pauses all players. Check `TSIL.Pause.PausePlayer` for more information.
function TSIL.Pause.PauseAllPlayers()
    local players = PlayerManager.GetPlayers()

    for _, player in ipairs(players) do
        TSIL.Pause.PausePlayer(player)
    end
end


--- Unpauses all players. Check `TSIL.Pause.PausePlayer` for more information.
function TSIL.Pause.UnpauseAllPlayers()
    local players = PlayerManager.GetPlayers()

    for _, player in ipairs(players) do
        TSIL.Pause.UnpausePlayer(player)
    end
end