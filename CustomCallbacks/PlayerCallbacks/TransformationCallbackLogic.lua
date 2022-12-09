local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "transformationsPerPlayer_TRANSFORMATION_CALLBACK_LOGIC",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "TRANSFORMATION_CALLBACK_LOGIC_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function OnPEffectUpdate(_, player)
    local transformationsPerPlayer = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "transformationsPerPlayer_TRANSFORMATION_CALLBACK_LOGIC")

    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local playerIndexStr = tostring(playerIndex)

    local playerTransformations = transformationsPerPlayer[playerIndexStr]

    if playerTransformations == nil then
        playerTransformations = {}
        transformationsPerPlayer[playerIndexStr] = playerTransformations
    end

    for playerForm = 0, PlayerForm.NUM_PLAYER_FORMS-1, 1 do
        local playerFormStr = tostring(playerForm)

        local currentPlayerHasForm = player:HasPlayerForm(playerForm)
        local previousPlayerHasForm = playerTransformations[playerFormStr]

        if currentPlayerHasForm and not previousPlayerHasForm then
            TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_TRANSFORMATION_GAINED, player, playerForm)
        elseif not currentPlayerHasForm and previousPlayerHasForm then
            TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_TRANSFORMATION_LOST, player, playerForm)
        end

        playerTransformations[playerFormStr] = currentPlayerHasForm
    end
end
TSIL.__AddInternalCallback(
    "TRANSFORMATION_CALLBACK_LOGIC_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPEffectUpdate
)