--- Returns wether the given form of tainted lazarus is the active one.
--- If the given player is not tainted lazarus, it'll always return false.
--- 
--- Accounts for when the player has Birthright.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsActiveTaintedLazForm(player)
	if player:GetPlayerType() ~= PlayerType.PLAYER_LAZARUS2 and player:GetPlayerType() ~= PlayerType.PLAYER_LAZARUS2_B then return false end

	if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
		local TSILPlayer = TSIL.Players
		local playerIndex = TSILPlayer.GetPlayerIndex(player)
		local subPlayerIndex = TSILPlayer.GetPlayerIndex(player:GetOtherTwin())

		for i = 0, Game():GetNumPlayers() - 1, 1 do
			local otherPlayer = Game():GetPlayer(i)
			local otherPlayerIndex = TSILPlayer.GetPlayerIndex(otherPlayer)

			if otherPlayerIndex == playerIndex then
				return true
			elseif otherPlayerIndex == subPlayerIndex then
				return false
			end
		end
	else
		return player:Exists()
	end

	return true
end