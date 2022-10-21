--- Returns a given player's index.
--- @param player EntityPlayer
--- @return integer
--- @within TSIL.Players
function TSIL.Players.GetPlayerIndex(player)
	return player:GetCollectibleRNG(1):GetSeed()
end