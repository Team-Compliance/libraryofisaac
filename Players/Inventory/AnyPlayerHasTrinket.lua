--- Returns true if at least one player has the given trinket.
--- @param trinketId TrinketType
--- @param ignoreModifiers boolean? @Default : false
--- @return boolean
function TSIL.Players.DoesAnyPlayerHasTrinket(trinketId, ignoreModifiers)
	local players = TSIL.Players.GetPlayers()

	local numPlayersWithTrinket = TSIL.Utils.Tables.Count(players, function (_, player)
		return player:HasTrinket(trinketId, ignoreModifiers)
	end)

	return numPlayersWithTrinket > 0
end