--##POST_PLAYER_INIT_LATE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PLAYER_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "PlayersTriggered_PLAYER_INIT_LATE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "PLAYER_INIT_LATE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function OnPeffectUpdate(_, player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local playersTriggered = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "PlayersTriggered_PLAYER_INIT_LATE_CALLBACK"
    )

    if not playersTriggered[playerIndex] then
        playersTriggered[playerIndex] = true
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_INIT_LATE, player)
    end
end
TSIL.__AddInternalCallback(
    "PLAYER_INIT_LATE_CALLBACK_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPeffectUpdate
)