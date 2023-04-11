local CustomReviveStates = {
    NONE = 0,

    --For one up revive
    WAITING_FOR_ROOM_TRANSITION = 1,
    WAITING_FOR_ITEM_ANIMATION = 2,

    --For lazarus soul revive
    WAITING_FOR_PLAYER_REVIVE = 3
}

local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC",
        CustomReviveStates.NONE,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "RevivingPlayerIndex_CUSTOM_REVIVE_LOGIC",
        -1,
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_POST_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


local function OnRender()
    local currentReviveState = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC"
    )

    if currentReviveState == CustomReviveStates.WAITING_FOR_ITEM_ANIMATION then
        SFXManager():Stop(SoundEffect.SOUND_1UP)
    end
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_POST_RENDER",
    ModCallbacks.MC_POST_RENDER,
    OnRender
)


---@param familiar EntityFamiliar
local function OnOneUpFamiliarInit(_, familiar)
    local currentReviveState = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC"
    )

    if currentReviveState == CustomReviveStates.WAITING_FOR_ROOM_TRANSITION then
        familiar:Remove()
    end
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_POST_FAMILIAR_INIT_ONE_UP",
    ModCallbacks.MC_FAMILIAR_INIT,
    OnOneUpFamiliarInit,
    CallbackPriority.DEFAULT,
    FamiliarVariant.ONE_UP
)


local function CheckForItemAnimation(player)
    local playerToCheck = player

    if player:GetPlayerType() == PlayerType.PLAYER_THESOUL_B then
        --If it's tainted soul, check for forgotten's body
        playerToCheck = player:GetOtherTwin()
        if playerToCheck == nil then
            --If there is no twin, just go back to the player
            playerToCheck = player
        end
    end

    if not player:IsHoldingItem() then
        return
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_CUSTOM_REVIVE, player)

    TSIL.SaveManager.ResetPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC"
    )
    TSIL.SaveManager.ResetPersistentVariable(
        TSIL.__MOD,
        "RevivingPlayerIndex_CUSTOM_REVIVE_LOGIC"
    )
end


---@param player EntityPlayer
local function CheckForPlayerRevive(player)
    if player:IsDead() then
        return
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_CUSTOM_REVIVE, player)

    TSIL.SaveManager.ResetPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC"
    )
    TSIL.SaveManager.ResetPersistentVariable(
        TSIL.__MOD,
        "RevivingPlayerIndex_CUSTOM_REVIVE_LOGIC"
    )
end


---@param player EntityPlayer
local function OnPeffectUpdateReordered(_, player)
    local revivingPlayerIndex = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "RevivingPlayerIndex_CUSTOM_REVIVE_LOGIC"
    )

    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    if playerIndex ~= revivingPlayerIndex then
        return
    end

    local currentReviveState = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC"
    )

    if currentReviveState == CustomReviveStates.WAITING_FOR_ITEM_ANIMATION then
        CheckForItemAnimation(player)
    elseif currentReviveState == CustomReviveStates.WAITING_FOR_PLAYER_REVIVE then
        CheckForPlayerRevive(player)
    end
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_POST_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPeffectUpdateReordered
)


local function OnNewRoomReordered()
    local currentReviveState = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "CustomReviveState_CUSTOM_REVIVE_LOGIC"
    )

    if currentReviveState == CustomReviveStates.WAITING_FOR_ROOM_TRANSITION then
        TSIL.SaveManager.SetPersistentVariable(
            TSIL.__MOD,
            "CustomReviveState_CUSTOM_REVIVE_LOGIC",
            CustomReviveStates.WAITING_FOR_ITEM_ANIMATION
        )
    end
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_POST_NEW_ROOM_REORDERED",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED,
    OnNewRoomReordered
)


---@param player EntityPlayer
local function OnPlayerAboutToDie(player)
    local revive = TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_CUSTOM_REVIVE, player)

    if revive == TSIL.Enums.CustomReviveType.PREVIOUS_ROOM then
        --Do 1 UP revive
        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        TSIL.SaveManager.SetPersistentVariable(
            TSIL.__MOD,
            "CustomReviveState_CUSTOM_REVIVE_LOGIC",
            CustomReviveStates.WAITING_FOR_ROOM_TRANSITION
        )

        TSIL.SaveManager.SetPersistentVariable(
            TSIL.__MOD,
            "RevivingPlayerIndex_CUSTOM_REVIVE_LOGIC",
            playerIndex
        )

        player:AddCollectible(CollectibleType.COLLECTIBLE_1UP, 0, false)

        TSIL.Utils.Functions.RunInFrames(function ()
            --The player should be dead by now, so kill them just in case
            local playerToKill = TSIL.Players.GetPlayerByIndex(playerIndex)

            if not playerToKill then
                return
            end

            if playerToKill:IsDead() then
                return
            end

            playerToKill:Kill()
        end, 1)
    elseif revive == TSIL.Enums.CustomReviveType.SAME_ROOM then
        --Do Soul of Lazarus revive
        ---@diagnostic disable-next-line: param-type-mismatch
        player:UseCard(Card.CARD_SOUL_LAZARUS, UseFlag.USE_NOANIM | UseFlag.USE_NOANNOUNCER)

        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        TSIL.SaveManager.SetPersistentVariable(
            TSIL.__MOD,
            "CustomReviveState_CUSTOM_REVIVE_LOGIC",
            CustomReviveStates.WAITING_FOR_PLAYER_REVIVE
        )

        TSIL.SaveManager.SetPersistentVariable(
            TSIL.__MOD,
            "RevivingPlayerIndex_CUSTOM_REVIVE_LOGIC",
            playerIndex
        )
    end
end


---@param player EntityPlayer
local function OnFatalPlayerDamage(_, player)
    --If the player has infinite hp, they aren't gonna die, so avoid purposedly killing them
    if TSIL.Debug.IsDebugModeActive(TSIL.Enums.DebugMode.INFINITE_HP) then return end

    OnPlayerAboutToDie(player)
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_POST_PLAYER_FATAL_DAMAGE",
    TSIL.Enums.CustomCallback.POST_PLAYER_FATAL_DAMAGE,
    OnFatalPlayerDamage,
    --Give it very low priority so it runs after all the other fatal damage callbacks
    --since they can return false and prevent the damage.
    -999999
)


---@param player EntityPlayer
local function PreBerserkDeath(_, player)
    OnPlayerAboutToDie(player)
end
TSIL.__AddInternalCallback(
    "CUSTOM_REVIVE_LOGIC_PRE_BERSERK_DEATH",
    TSIL.Enums.CustomCallback.PRE_BERSERK_DEATH,
    PreBerserkDeath
)