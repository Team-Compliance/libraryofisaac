--##POST_GREED_MODE_WAVE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_GREED_MODE_WAVE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "greedWave_GREED_MODE_WAVE_CALLBACK",
        0,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "GREED_MODE_WAVE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


local function OnUpdate()
    if not TSIL.Run.IsGreedMode() then
        return
    end

    local level = Game():GetLevel()

    local previousGreedWave = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "greedWave_GREED_MODE_WAVE_CALLBACK")
    local currentGreedWave = level.GreedModeWave
    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "greedWave_GREED_MODE_WAVE_CALLBACK", currentGreedWave)

    if currentGreedWave > previousGreedWave then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GREED_MODE_WAVE, previousGreedWave, currentGreedWave)
    end
end
TSIL.__AddInternalCallback(
    "GREED_MODE_WAVE_CALLBACK_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)