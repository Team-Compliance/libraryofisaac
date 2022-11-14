---@class PlayerIndex : number

--- Returns a given player's index. Useful for storing unique data per player.
--- @param player EntityPlayer
--- @return PlayerIndex
function TSIL.Players.GetPlayerIndex(player)
	---@diagnostic disable-next-line: return-type-mismatch
	return player:GetCollectibleRNG(1):GetSeed()
end


--- Returns a player given its index.
--- @param playerIndex PlayerIndex
--- @return EntityPlayer?
function TSIL.Players.GetPlayerByIndex(playerIndex)
	local players = TSIL.Players.GetPlayers()

	return TSIL.Utils.Tables.FindFirst(players, function (_, player)
		return TSIL.Players.GetPlayerIndex(player) == playerIndex
	end)
end