--##POST_PLAYER_FATAL_DAMAGE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PLAYER_FATAL_DAMAGE,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    function (functionParams, optionalParams)
        ---@type EntityPlayer
        local player = functionParams[1]

        local targetPlayerType = optionalParams[1]
        local targetPlayerVariant = optionalParams[2]

        return (TSIL.__IsDefaultParam(targetPlayerType) or player:GetPlayerType() == targetPlayerType) and
        (TSIL.__IsDefaultParam(targetPlayerVariant) or player.Variant == targetPlayerVariant)
    end
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "playersLastDamageGameFrame_PLAYER_FATAL_DAMAGE_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCustomCallback(
    "PLAYER_FATAL_DAMAGE_CALLBACK_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad,
    TSIL.Enums.CallbackPriority.MEDIUM
)


---@param entity Entity
---@param amount number
---@param damageFlags integer
---@param source EntityRef
---@param countdownFrames integer
local function OnPlayerDamage(_, entity, amount, damageFlags, source, countdownFrames)
    local player = entity:ToPlayer()

    if TSIL.Players.IsChildPlayer(player) then
        return
    end

    local playersLastDamageGameFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "playersLastDamageGameFrame_PLAYER_FATAL_DAMAGE_CALLBACK")

    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local playerIndexStr = tostring(playerIndex)

    local lastDamageGameFrame = playersLastDamageGameFrame[playerIndexStr]
    local currentGameFrame = Game():GetFrameCount()
    playersLastDamageGameFrame[playerIndexStr] = currentGameFrame

    -- If the player has a revival item such as Dead Cat, this will not be fatal damage.
    if TSIL.Players.WillPlayerRevive(player) then
        return nil
    end

    if not TSIL.Players.IsDamageToPlayerFatal(player, amount, source, lastDamageGameFrame) then
        return nil
    end

    local shouldSustainDeath = TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.POST_PLAYER_FATAL_DAMAGE,
        player,
        amount,
        damageFlags,
        source,
        countdownFrames
    )

    return shouldSustainDeath
end
TSIL.__AddInternalVanillaCallback(
    "PLAYER_FATAL_DAMAGE_CALLBACK_ON_PLAYER_DAMAGE",
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    OnPlayerDamage,
    TSIL.Enums.CallbackPriority.MEDIUM,
    EntityType.ENTITY_PLAYER
)


---@param player EntityPlayer
local function PreBibleUse(_, _, _, player)
    if not TSIL.Rooms.InBossRoomOf(TSIL.Enums.BossID.SATAN) then
        return nil
    end

    local shouldSustainDeath = TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.POST_PLAYER_FATAL_DAMAGE,
        player,
        0,
        0,
        EntityRef(player),
        0
    )

    if shouldSustainDeath ~= nil then
        return not shouldSustainDeath
    end
end
TSIL.__AddInternalVanillaCallback(
    "PLAYER_FATAL_DAMAGE_CALLBACK_PRE_BIBLE_USE",
    ModCallbacks.MC_PRE_USE_ITEM,
    PreBibleUse,
    TSIL.Enums.CallbackPriority.MEDIUM,
    CollectibleType.COLLECTIBLE_BIBLE
)