local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "usedFlipAtLeastOnce_FLIP_CALLBACK_LOGIC",
        false,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "FLIP_CALLBACK_LOGIC_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param oldLazarus EntityPlayer
---@return EntityPlayer?
local function GetNewLazarus(oldLazarus)
    local oldCharacter = oldLazarus:GetPlayerType();

    ---@type PlayerType
    local newCharacter
    if oldCharacter == PlayerType.PLAYER_LAZARUS2 then
        newCharacter = PlayerType.PLAYER_LAZARUS_2_B
    elseif oldCharacter == PlayerType.PLAYER_LAZARUS_2_B then
        newCharacter = PlayerType.PLAYER_LAZARUS2
    else
        return nil
    end

    local playersOfType = TSIL.Players.GetPlayersOfType(newCharacter)
    return TSIL.Utils.Tables.FindFirst(playersOfType, function(_, player)
        return player.FrameCount == oldLazarus.FrameCount
    end)
end


---@param player EntityPlayer
local function OnFlipUse(_, _, _, player)
    if not TSIL.Players.IsTaintedLazarus(player) then
        return
    end

    local newLazarus = GetNewLazarus(player)
    if newLazarus == nil then
        return
    end

    local usedFlipAtLeastOnce = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD,
        "usedFlipAtLeastOnce_FLIP_CALLBACK_LOGIC")
    if not usedFlipAtLeastOnce then
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "usedFlipAtLeastOnce_FLIP_CALLBACK_LOGIC", true)
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_FIRST_FLIP, player)
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_FLIP, player)
end
TSIL.__AddInternalCallback(
    "FLIP_CALLBACK_LOGIC_ON_FLIP_USE",
    ModCallbacks.MC_USE_ITEM,
    OnFlipUse,
    CallbackPriority.DEFAULT,
    CollectibleType.COLLECTIBLE_FLIP
)
