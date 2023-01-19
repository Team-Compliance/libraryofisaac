--##POST_PLAYER_TYPE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PLAYER_TYPE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "playersTypesMap_PLAYER_TYPE_CHANGE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "PLAYER_TYPE_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function OnPeffectUpdateReordered(_, player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local playerIndexStr = tostring(playerIndex)

    local playerTypesLastFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "playersTypesMap_PLAYER_TYPE_CHANGE_CALLBACK")

    local playerTypeLastFrame = playerTypesLastFrame[playerIndexStr]
    local playerTypeCurrentFrame = player:GetPlayerType()

    if playerTypeLastFrame ~= nil and
    playerTypeLastFrame ~= playerTypeCurrentFrame then
        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_PLAYER_TYPE_CHANGED,
            player,
            playerTypeLastFrame,
            playerTypeCurrentFrame
        )
    end

    playerTypesLastFrame[playerIndexStr] = playerTypeCurrentFrame
end
TSIL.__AddInternalCallback(
    "PLAYER_TYPE_CHANGED_CALLBACK_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPeffectUpdateReordered
)