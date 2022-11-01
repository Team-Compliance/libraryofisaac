--- Returns a given player's index. Useful for storing unique data per player.
--- @param player EntityPlayer
--- @return integer
function TSIL.Players.GetPlayerIndex(player)
	return player:GetCollectibleRNG(1):GetSeed()
end


--- Returns a player given its index.
--- @param playerIndex integer
--- @return EntityPlayer?
function TSIL.Players.GetPlayerByIndex(playerIndex)
	local players = TSIL.Players.GetPlayers()

	return TSIL.Utils.Tables.FindFirst(players, function (_, player)
		return TSIL.Players.GetPlayerIndex(player) == playerIndex
	end)
end