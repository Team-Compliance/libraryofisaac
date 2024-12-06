---Uses the player's current health and other miscellaneous things to determine if incoming damage
---will be fatal.
---@param player EntityPlayer
---@param amount number
---@param source EntityRef
---@param lastDamageGameFrame integer?
---@return boolean
function TSIL.Players.IsDamageToPlayerFatal(player, amount, source, lastDamageGameFrame)
    local gameFrameCount = Game():GetFrameCount();
    local character = player:GetPlayerType();
    local effects = player:GetEffects();
    local isBerserk = effects:HasCollectibleEffect(CollectibleType.COLLECTIBLE_BERSERK);

    -- If we are Tainted Jacob and the damage source is Dark Esau, this will not be fatal damage
    -- (because we will transform into Tainted Jacob's lost form).
    if character == PlayerType.PLAYER_JACOB_B and
    source.Type == EntityType.ENTITY_DARK_ESAU then
        return false
    end
  
    -- If we are berserk, no damage is fatal. (The death is deferred until the end of the berserk
    -- effect.)
    if isBerserk then
        return false
    end

    -- If we are playing Tainted Samson and the incoming hit will cause us to become Berserk, then
    -- this will not be fatal damage.
    local TAINTED_SAMSON_BERSERK_CHARGE_FROM_TAKING_DAMAGE = 10000
    local berserkChargeAfterHit = player.SamsonBerserkCharge + TAINTED_SAMSON_BERSERK_CHARGE_FROM_TAKING_DAMAGE

    local MAX_TAINTED_SAMSON_BERSERK_CHARGE = 100000
    if character == PlayerType.PLAYER_SAMSON_B and
    berserkChargeAfterHit >= MAX_TAINTED_SAMSON_BERSERK_CHARGE then
        return false
    end

    -- If Spirit Shackles is activated, no damage is fatal.
    if TSIL.Players.WillReviveFromSpiritShackles(player) then
        return false
    end

    -- If we are Tainted Jacob in the Lost Form, we may have plenty of health left, but we will still
    -- die in one hit to anything.
    if character == PlayerType.PLAYER_JACOB2_B then
        return true
    end

    -- If we are in the "Lost Curse" form from touching a white fire, all damage will be fatal.
    local hasLostCurse = effects:HasNullEffect(NullItemID.ID_LOST_CURSE)
    if hasLostCurse then
        return true
    end

    local playerNumAllHearts = TSIL.Players.GetPlayerNumHitsRemaining(player)
    if amount < playerNumAllHearts then
        return false
    end

    -- This will not be fatal damage if the player has Heartbreak and two slots open for broken
    -- hearts.
    if TSIL.Players.WillReviveFromHeartbreak(player) then
        return false
    end

    -- This will not be fatal damage if we have Glass Cannon and this is the second time we are taking
    -- damage on the same frame.
    if player:HasCollectible(CollectibleType.COLLECTIBLE_BROKEN_GLASS_CANNON) and
    gameFrameCount == lastDamageGameFrame then
        return false
    end

    -- This will not be fatal damage if we have two different kinds of hearts. For example, a bomb
    -- explosion deals 2 damage, but if the player has one half soul heart and one half red heart, the
    -- game will only remove the soul heart.
    local hearts = player:GetHearts();
    local eternalHearts = player:GetEternalHearts();
    local soulHearts = player:GetSoulHearts();
    local boneHearts = player:GetBoneHearts();
    if (hearts > 0 and soulHearts > 0) or
      (hearts > 0 and boneHearts > 0) or
      (soulHearts > 0 and boneHearts > 0) or
      (soulHearts > 0 and eternalHearts > 0) or
      boneHearts >= 2 -- Two bone hearts and nothing else should not result in a death
    then
        return false;
    end
  
    return true
end


--- Assuming that we are on the frame of fatal damage, this function returns whether or not
--- Mysterious Paper would rotate to Missing Poster on the frame that the "Game Over" screen would
--- appear (which would subsequently save the player from fatal damage).
---
--- Mysterious Paper rotates between the 4 items on every frame, in order. The formula for whether
--- Mysterious Paper be Missing Power is: `gameFrameCount % 4 === 3`
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillMysteriousPaperRevive(player)
    local gameFrameCount = Game():GetFrameCount()
    local sprite = player:GetSprite()

    -- We want to explicitly check the length of the death animation because we might be playing on a
    -- modded character that has a custom death animation.
    local animation = player:GetDeathAnimName()
    local deathAnimationFrames = TSIL.Sprites.GetLastFrameOfAnimation(sprite, animation)
    local frameOfDeath = gameFrameCount + deathAnimationFrames + 1
    -- (We add 1 because it takes one frame for the death animation to begin.)

    return frameOfDeath % 4 == 3;
end


--- The `EntityPlayer.WillPlayerRevive` method does not properly account for Mysterious Paper, so use
--- this helper function instead for more robust revival detection.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillPlayerRevive(player)
    local trinketSituation = TSIL.Players.TemporarilyRemoveTrinket(player, TrinketType.TRINKET_MYSTERIOUS_PAPER)

    local willRevive = player:WillPlayerRevive() or
      (trinketSituation ~= nil and TSIL.Players.WillMysteriousPaperRevive(player))

    TSIL.Players.GiveTrinketsBack(player, trinketSituation)

    return willRevive
end


--- Helper function to determine if the player will be revived by the Heartbreak collectible if they
--- take fatal damage. This is contingent on the character that they are playing as and the amount of
--- broken hearts that they already have.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillReviveFromHeartbreak(player)
    if not player:HasCollectible(CollectibleType.COLLECTIBLE_HEARTBREAK) then
     	return false
	end

    local maxHeartContainers = TSIL.Players.GetPlayerMaxHeartContainers(player)
    local numBrokenHeartsThatWillBeAdded = 2
	if TSIL.Players.IsKeeper(player) then
		numBrokenHeartsThatWillBeAdded = 1
	end
    local brokenHearts = player:GetBrokenHearts()
    local numBrokenHeartsAfterRevival = numBrokenHeartsThatWillBeAdded + brokenHearts

    return maxHeartContainers > numBrokenHeartsAfterRevival;
end


--- Helper function to determine if the Spirit Shackles item is in an enabled state. (It can be
--- either enabled or disabled.)
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillReviveFromSpiritShackles(player)
    if not player:HasCollectible(CollectibleType.COLLECTIBLE_SPIRIT_SHACKLES) then
     	return false
	end

	local effects = player:GetEffects()

    local spiritShacklesEnabled = not effects:HasNullEffect(NullItemID.ID_SPIRIT_SHACKLES_DISABLED)
    local playerInSoulForm = effects:HasNullEffect(NullItemID.ID_SPIRIT_SHACKLES_SOUL)

    return spiritShacklesEnabled and not playerInSoulForm
end