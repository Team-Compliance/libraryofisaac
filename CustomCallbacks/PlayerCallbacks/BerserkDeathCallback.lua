--##PRE_BERSERK_DEATH

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_BERSERK_DEATH,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)


---@param player EntityPlayer
local function OnPeffectUpdate(_, player)
    if TSIL.Players.IsChildPlayer(player) then
        return
    end

    local effects = player:GetEffects();
    local berserkEffect = effects:GetCollectibleEffect(CollectibleType.COLLECTIBLE_BERSERK);
    local numHitsRemaining = TSIL.Players.GetPlayerNumHitsRemaining(player)

    if berserkEffect ~= nil and
    berserkEffect.Cooldown == 1 and
    numHitsRemaining == 0 and
    not TSIL.Players.WillPlayerRevive(player) then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_BERSERK_DEATH, player)
    end
end
TSIL.__AddInternalCallback(
    "PRE_BERSERK_DEATH_CALLBACK_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPeffectUpdate
)