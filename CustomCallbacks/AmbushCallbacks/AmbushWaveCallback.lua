--##POST_AMBUSH_WAVE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_AMBUSH_WAVE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)

local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "ambushWaveAlive_AMBUSH_WAVE_CALLBACK", false, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "AMBUSH_WAVE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)

local function OnUpdate()
    local room = Game():GetRoom()
    if not room:IsAmbushActive() then
        return
    end

    local ambushWaveAlive = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "ambushWaveAlive_AMBUSH_WAVE_CALLBACK")
    local countingFunction
    local ambushType = TSIL.Ambush.GetAmbushType()
    if ambushType == TSIL.Enums.AmbushType.BOSS_RUSH then
        countingFunction = Isaac.CountBosses
    else
        countingFunction = Isaac.CountEnemies
    end

    if ambushWaveAlive and countingFunction() == 0 then
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "ambushWaveAlive_AMBUSH_WAVE_CALLBACK", false)
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_AMBUSH_WAVE, ambushType)
    elseif not ambushWaveAlive and countingFunction() > 0 then
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "ambushWaveAlive_AMBUSH_WAVE_CALLBACK", true)
    end
end

TSIL.__AddInternalCallback(
    "AMBUSH_WAVE_CALLBACK_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)