local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "gameStartedFired_PLAYER_REORDERED_LOGIC", false, TSIL.Enums.VariablePersistenceMode.RESET_RUN)

    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "postPEffectUpdateQueue_PLAYER_REORDERED_LOGIC", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "postPlayerUpdateQueue_PLAYER_REORDERED_LOGIC", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "postPlayerRenderQueue_PLAYER_REORDERED_LOGIC", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCallback(
    "PLAYER_REORDERED_LOGIC_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function PostPEffectUpdate(_, player)
    local gameStartedFired = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "gameStartedFired_PLAYER_REORDERED_LOGIC")

    if gameStartedFired then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED, player)
    else
        -- Defer callback execution until the `POST_GAME_STARTED` callback fires.
        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        local postPEffectUpdateQueue = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "postPEffectUpdateQueue_PLAYER_REORDERED_LOGIC")
        postPEffectUpdateQueue[#postPEffectUpdateQueue+1] = playerIndex
    end
end
TSIL.__AddInternalCallback(
    "PLAYER_REORDERED_POST_PEFFECT_UPDATE",
    ModCallbacks.MC_POST_PEFFECT_UPDATE,
    PostPEffectUpdate
)


---@param player EntityPlayer
local function PostPlayerUpdate(_, player)
    local gameStartedFired = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "gameStartedFired_PLAYER_REORDERED_LOGIC")

    if gameStartedFired then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_UPDATE_REORDERED, player)
    else
        -- Defer callback execution until the `POST_GAME_STARTED` callback fires.
        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        local postPlayerUpdateQueue = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "postPlayerUpdateQueue_PLAYER_REORDERED_LOGIC")
        postPlayerUpdateQueue[#postPlayerUpdateQueue+1] = playerIndex
    end
end
TSIL.__AddInternalCallback(
    "PLAYER_REORDERED_POST_PLAYER_UPDATE",
    ModCallbacks.MC_POST_PLAYER_UPDATE,
    PostPlayerUpdate
)


---@param player EntityPlayer
local function PostPlayerRender(_, player)
    local gameStartedFired = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "gameStartedFired_PLAYER_REORDERED_LOGIC")

    if gameStartedFired then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PLAYER_RENDER_REORDERED, player)
    else
        -- Defer callback execution until the `POST_GAME_STARTED` callback fires.
        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        local postPlayerRenderQueue = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "postPlayerRenderQueue_PLAYER_REORDERED_LOGIC")
        postPlayerRenderQueue[#postPlayerRenderQueue+1] = playerIndex
    end
end
TSIL.__AddInternalCallback(
    "PLAYER_REORDERED_POST_PLAYER_RENDER",
    ModCallbacks.MC_POST_PLAYER_RENDER,
    PostPlayerRender
)


---@param playerIndexes PlayerIndex[]
---@param callbackToFire CustomCallback
local function Dequeue(playerIndexes, callbackToFire)
    for _, playerIndex in ipairs(playerIndexes) do
        local player = TSIL.Players.GetPlayerByIndex(playerIndex)

        TSIL.__TriggerCustomCallback(callbackToFire, player)
    end
end


local function PostGameStartedReorderedLast()
    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "gameStartedFired_PLAYER_REORDERED_LOGIC", true)

    local postPEffectUpdateQueue = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "postPEffectUpdateQueue_PLAYER_REORDERED_LOGIC")
    Dequeue(postPEffectUpdateQueue, TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED)

    local postPlayerUpdateQueue = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "postPlayerUpdateQueue_PLAYER_REORDERED_LOGIC")
    Dequeue(postPlayerUpdateQueue, TSIL.Enums.CustomCallback.POST_PLAYER_UPDATE_REORDERED)

    local postPlayerRenderQueue = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "postPlayerRenderQueue_PLAYER_REORDERED_LOGIC")
    Dequeue(postPlayerRenderQueue, TSIL.Enums.CustomCallback.POST_PLAYER_RENDER_REORDERED)
end
TSIL.__AddInternalCallback(
    "PLAYER_REORDERED_LOGIC_GAME_STARTED_REORDERED_LAST",
    TSIL.Enums.CustomCallback.POST_GAME_STARTED_REORDERED_LAST,
    PostGameStartedReorderedLast
)