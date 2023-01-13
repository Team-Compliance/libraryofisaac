local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "usedEsauJrFrame_ESAU_JR_CALLBACK_LOGIC",
        -1,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "usedEsauJrControllerIndex_ESAU_JR_CALLBACK_LOGIC",
        -1,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "usedEsauJrAtLeastOnce_ESAU_JR_CALLBACK_LOGIC",
        false,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end

TSIL.__AddInternalCallback(
    "ESAU_JR_CALLBACK_LOGIC_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


local function OnUpdate()
    local frameCount = Game():GetFrameCount()

    local usedEsauJrFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "usedEsauJrFrame_ESAU_JR_CALLBACK_LOGIC")
    if usedEsauJrFrame == -1 or frameCount < usedEsauJrFrame + 1 then
        return
    end

    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "usedEsauJrFrame_ESAU_JR_CALLBACK_LOGIC", -1)

    local usedEsauJrControllerIndex = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD,
        "usedEsauJrControllerIndex_ESAU_JR_CALLBACK_LOGIC")

    if usedEsauJrControllerIndex == -1 then
        return
    end

    local players = TSIL.Players.GetPlayersWithControllerIndex(usedEsauJrControllerIndex)
    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "usedEsauJrControllerIndex_ESAU_JR_CALLBACK_LOGIC", -1)

    local player = players[1]
    if player == nil then
        return
    end

    local usedEsauJrAtLeastOnce = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD,
        "usedEsauJrAtLeastOnce_ESAU_JR_CALLBACK_LOGIC")
    if not usedEsauJrAtLeastOnce then
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "usedEsauJrAtLeastOnce_ESAU_JR_CALLBACK_LOGIC", true)
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_FIRST_ESAU_JR, player)
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_ESAU_JR, player)
end

TSIL.__AddInternalCallback(
    "ESAU_JR_CALLBACK_LOGIC_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)



local function OnEsauJrUse(_, _, _, player)
    local frameCount = Game():GetFrameCount()

    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "usedEsauJrFrame_ESAU_JR_CALLBACK_LOGIC", frameCount + 1)
    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "usedEsauJrControllerIndex_ESAU_JR_CALLBACK_LOGIC",
        player.ControllerIndex)
end

TSIL.__AddInternalCallback(
    "ESAU_JR_CALLBACK_LOGIC_ON_ESAU_JR_USE",
    ModCallbacks.MC_USE_ITEM,
    OnEsauJrUse,
    CallbackPriority.DEFAULT,
    CollectibleType.COLLECTIBLE_ESAU_JR
)
