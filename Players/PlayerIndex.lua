---@class PlayerIndex : integer

--- Returns a given player's index. Useful for storing unique data per player.
---@param player EntityPlayer
---@param differentiateSoulAndForgotten? boolean
---@return PlayerIndex
function TSIL.Players.GetPlayerIndex(player, differentiateSoulAndForgotten)
	if differentiateSoulAndForgotten == nil then
		differentiateSoulAndForgotten = false
	end

	local playerToUse = player
	local isSubPlayer = player:IsSubPlayer()
	if isSubPlayer then
		local playerParent = TSIL.Players.GetSubPlayerParent(player)
		if playerParent ~= nil then
			playerToUse = playerParent
		end
	end

	if differentiateSoulAndForgotten and player:GetPlayerType() == PlayerType.PLAYER_THESOUL then
		---@diagnostic disable-next-line: return-type-mismatch
		return playerToUse:GetCollectibleRNG(3):GetSeed()
	end

	---@diagnostic disable-next-line: return-type-mismatch
	return playerToUse:GetCollectibleRNG(1):GetSeed()
end

--- Returns a player given its index.
---@param playerIndex PlayerIndex
---@return EntityPlayer?
function TSIL.Players.GetPlayerByIndex(playerIndex)
	local players = PlayerManager.GetPlayers()

	return TSIL.Utils.Tables.FindFirst(players, function(_, player)
		return TSIL.Players.GetPlayerIndex(player) == playerIndex
	end)
end
