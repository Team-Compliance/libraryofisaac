--- Returns the combined value of all of the player's red hearts, soul/black hearts, and bone hearts,
--- minus the value of the player's rotten hearts.
---
--- This is equivalent to the number of hits that the player can currently take, but does not take
--- into account double damage from champion enemies and/or being on later floors. (For example, on
--- Womb 1, players who have 1 soul heart remaining would die in 1 hit to anything, even though this
--- function would report that they have 2 hits remaining.)
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetPlayerNumHitsRemaining(player)
    local hearts = player:GetHearts()
    local soulHearts = player:GetSoulHearts();
    local boneHearts = player:GetBoneHearts();
    local eternalHearts = player:GetEternalHearts();
    local rottenHearts = player:GetRottenHearts();

    return hearts + soulHearts + boneHearts + eternalHearts - rottenHearts;
end