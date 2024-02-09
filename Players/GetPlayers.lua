--- Returns the n closest players to a certain point.
--- The players are ordered by their distance.
---@param center Vector
---@param numberOfPlayers? integer @Default : 1
---@return EntityPlayer[]
function TSIL.Players.GetClosestPlayers(center, numberOfPlayers)
	if numberOfPlayers == nil then
		numberOfPlayers = 1
	end

	local players = PlayerManager.GetPlayers()

	table.sort(players, function(player1, player2)
		return center:DistanceSquared(player1.Position) <= center:DistanceSquared(player2.Position)
	end)

	local closestPlayers = {}

	for i = 1, numberOfPlayers, 1 do
		closestPlayers[i] = players[i]
	end

	return closestPlayers
end

--- Returns a list of all players that have a certain item
---@param collectibleId CollectibleType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByCollectible(collectibleId)
	local players = PlayerManager.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player:HasCollectible(collectibleId)
	end)
end

--- Returns all the players that have a certain trinket
---@param trinketId TrinketType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByTrinket(trinketId)
	local players = PlayerManager.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player:HasTrinket(trinketId)
	end)
end

--- Returns all the players of a given type.
---@param playerType PlayerType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersOfType(playerType)
	local players = PlayerManager.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player:GetPlayerType() == playerType
	end)
end

--- Returns all the players corresponding to a controller index.
---@param controllerIndex integer
---@return EntityPlayer[]
function TSIL.Players.GetPlayersWithControllerIndex(controllerIndex)
	local players = PlayerManager.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player.ControllerIndex == controllerIndex
	end)
end

---Helper function to get the parent of a given sub player.
---@param subPlayer EntityPlayer
---@return EntityPlayer?
function TSIL.Players.GetSubPlayerParent(subPlayer)
	local subPlayerPtrHash = GetPtrHash(subPlayer);
	local players = PlayerManager.GetPlayers();

	return TSIL.Utils.Tables.FindFirst(players, function(_, player)
		local thisPlayerSubPlayer = player:GetSubPlayer()
		if thisPlayerSubPlayer == nil then
			return false
		end

		local thisPlayerSubPlayerPtrHash = GetPtrHash(thisPlayerSubPlayer);
		return thisPlayerSubPlayerPtrHash == subPlayerPtrHash;
	end)
end
