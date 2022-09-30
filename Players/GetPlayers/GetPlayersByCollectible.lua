---Returns a list of all players that have a certain item
---@param collectibleId CollectibleType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByCollectible(collectibleId)
    local players = TSIL.Players.GetPlayers()

    return TSIL.Utils.Tables.Filter(players, function (_, player)
        return player:HasCollectible(collectibleId)
    end)
end