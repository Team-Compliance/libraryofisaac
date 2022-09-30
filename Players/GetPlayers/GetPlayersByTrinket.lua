---Returns all the players that have a certain trinket
---@param trinketId TrinketType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByTrinket(trinketId)
    local players = TSIL.Players.GetPlayers()

    return TSIL.Utils.Tables.Filter(players, function (_, player)
        return player:HasTrinket(trinketId)
    end)
end