--- Returns a list of all players.
---@param ignoreCoopBabies? boolean @Default: true
---@return EntityPlayer[]
function TSIL.Players.GetPlayers(ignoreCoopBabies)
	if ignoreCoopBabies == nil then
		ignoreCoopBabies = true
	end

	local players = {}

	for i = 0, Game():GetNumPlayers() - 1, 1 do
		local player = Game():GetPlayer(i)

		if not ignoreCoopBabies or player.Variant ~= 1 then
			table.insert(players, player)
		end
	end

	return players
end

--- Returns the n closest players to a certain point.
--- The players are ordered by their distance.
---@param center Vector
---@param numberOfPlayers? integer @Default : 1
---@return EntityPlayer[]
function TSIL.Players.GetClosestPlayers(center, numberOfPlayers)
	if numberOfPlayers == nil then
		numberOfPlayers = 1
	end

	local players = TSIL.Players.GetPlayers()

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
	local players = TSIL.Players.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player:HasCollectible(collectibleId)
	end)
end

--- Returns all the players that have a certain trinket
---@param trinketId TrinketType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByTrinket(trinketId)
	local players = TSIL.Players.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player:HasTrinket(trinketId)
	end)
end

--- Returns all the players of a given type.
---@param playerType PlayerType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersOfType(playerType)
	local players = TSIL.Players.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player:GetPlayerType() == playerType
	end)
end

--- Returns all the players corresponding to a controller index.
---@param controllerIndex integer
---@return EntityPlayer[]
function TSIL.Players.GetPlayersWithControllerIndex(controllerIndex)
	local players = TSIL.Players.GetPlayers()

	return TSIL.Utils.Tables.Filter(players, function(_, player)
		return player.ControllerIndex == controllerIndex
	end)
end

---Helper function to get the parent of a given sub player.
---@param subPlayer EntityPlayer
---@return EntityPlayer?
function TSIL.Players.GetSubPlayerParent(subPlayer)
	local subPlayerPtrHash = GetPtrHash(subPlayer);
	local players = TSIL.Players.GetPlayers();

	return TSIL.Utils.Tables.FindFirst(players, function(_, player)
		local thisPlayerSubPlayer = player:GetSubPlayer()
		if thisPlayerSubPlayer == nil then
			return false
		end

		local thisPlayerSubPlayerPtrHash = GetPtrHash(thisPlayerSubPlayer);
		return thisPlayerSubPlayerPtrHash == subPlayerPtrHash;
	end)
end
