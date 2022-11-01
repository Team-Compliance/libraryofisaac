--- Returns true if at least one player has the given item.
--- @param collectibleId CollectibleType
--- @param ignoreModifiers boolean? @Default : false
--- @return boolean
function TSIL.Players.DoesAnyPlayerHasItem(collectibleId, ignoreModifiers)
	local players = TSIL.Players.GetPlayers()

	local numPlayersWithItem = TSIL.Utils.Tables.Count(players, function (_, player)
		return player:HasCollectible(collectibleId, ignoreModifiers)
	end)

	return numPlayersWithItem > 0
end