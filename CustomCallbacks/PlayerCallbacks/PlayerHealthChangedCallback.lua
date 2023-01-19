--##POST_PLAYER_HEALTH_CHANGED

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PLAYER_HEALTH_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "PlayersHealthMap_PLAYER_HEALTH_CHANGED_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end

TSIL.__AddInternalCallback(
    "PLAYER_HEALTH_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function OnPeffectUpdate(_, player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player, true);

    local playersHealthMap = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "PlayersHealthMap_PLAYER_HEALTH_CHANGED_CALLBACK"
    )
    local playerHealthMap = playersHealthMap[tostring(playerIndex)]

    if playerHealthMap == nil then
        playerHealthMap = {}
        playersHealthMap[tostring(playerIndex)] = playerHealthMap
    end

    for healthType = 1, 9, 1 do
        local storedHealthValue = playerHealthMap[tostring(healthType)]
        local currentHealthValue = TSIL.Players.GetPlayerHealthType(player, healthType);
        playerHealthMap[tostring(healthType)] = currentHealthValue

        if storedHealthValue ~= nil and
            storedHealthValue ~= currentHealthValue then

            TSIL.__TriggerCustomCallback(
                TSIL.Enums.CustomCallback.POST_PLAYER_HEALTH_CHANGED,
                player,
                healthType,
                storedHealthValue,
                currentHealthValue
            )
        end
    end
end

TSIL.__AddInternalCallback(
    "POST_PLAYER_HEALTH_CHANGED_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPeffectUpdate
)
