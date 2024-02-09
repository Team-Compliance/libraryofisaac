---Returns the number of red hearts that the player has, excluding any rotten hearts. For example,
---if the player has one full black heart, one full soul heart, and one half black heart, this
---function returns 3.
---
---This is different from the `EntityPlayer.GetHearts` method, since that returns a value that
---includes rotten hearts.
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetHearts(player)
    local rottenHearts = player:GetRottenHearts()
    local hearts = player:GetHearts()

    return hearts - rottenHearts * 2;
end

--- Returns the number of soul hearts that the player has, excluding any black hearts. For example,
--- if the player has one full black heart, one full soul heart, and one half black heart, this
--- function returns 2.
---
--- This is different from the `EntityPlayer.GetSoulHearts` method, since that returns the combined
--- number of soul hearts and black hearts.
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetSoulHearts(player)
    local soulHearts = player:GetSoulHearts();
    local blackHearts = TSIL.Players.GetBlackHeartsNum(player);

  return soulHearts - blackHearts
end


--- Returns the number of black hearts that the player has, excluding any soul hearts. For example,
--- if the player has one full black heart, one full soul heart, and one half black heart, this
--- function returns 3.
---
--- This is different from the `EntityPlayer.GetBlackHearts` method, since that returns a bitmask.
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetBlackHeartsNum(player)
    local blackHeartsBitmask = player:GetBlackHearts();
    local blackHeartBits = TSIL.Utils.Flags.CountBits(blackHeartsBitmask);

    return blackHeartBits * 2;
end


---Helper function to get the amount of a given health type a player has.
---@param player EntityPlayer
---@param healthType PlayerHeartType
function TSIL.Players.GetPlayerHealthType(player, healthType)
    local HealthType = TSIL.Enums.PlayerHeartType
    if healthType == HealthType.RED then
        return TSIL.Players.GetHearts(player)
    elseif healthType == HealthType.SOUL then
        return TSIL.Players.GetSoulHearts(player)
    elseif healthType == HealthType.ETERNAL then
        return player:GetEternalHearts()
    elseif healthType == HealthType.BLACK then
        return TSIL.Players.GetBlackHeartsNum(player)
    elseif healthType == HealthType.GOLDEN then
        return player:GetGoldenHearts()
    elseif healthType == HealthType.BONE then
        return player:GetBoneHearts()
    elseif healthType == HealthType.ROTTEN then
        return player:GetRottenHearts()
    elseif healthType == HealthType.BROKEN then
        return player:GetBrokenHearts()
    elseif healthType == HealthType.MAX_HEARTS then
        return player:GetMaxHearts()
    end
end