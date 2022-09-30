---Returns true if at least one player has the given item.
---@param collectibleId CollectibleType
---@return boolean
function TSIL.Players.DoesAnyPlayerHasItem(collectibleId)
    local players = TSIL.Players.GetPlayers()

    local numPlayersWithItem = TSIL.Utils.Tables.Count(players, function (_, player)
        return player:HasCollectible(collectibleId)
    end)

    return numPlayersWithItem > 0
end