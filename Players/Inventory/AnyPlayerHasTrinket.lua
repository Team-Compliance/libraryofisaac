---Returns true if at least one player has the given trinket.
---@param trinketId TrinketType
---@return boolean
function TSIL.Players.DoesAnyPlayerHasTrinket(trinketId)
    local players = TSIL.Players.GetPlayers()

    local numPlayersWithTrinket = TSIL.Utils.Tables.Count(players, function (_, player)
        return player:HasTrinket(trinketId)
    end)

    return numPlayersWithTrinket > 0
end