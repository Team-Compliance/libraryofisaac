--- Returns `true` if the player has one or more of the provided collectibles
---
--- This function is variadic, meaning that you can specify as many collectible types that you want
--- to check for.
---@param player EntityPlayer
---@vararg CollectibleType
function TSIL.Players.PlayerHasCollectible(player, ...)
	return TSIL.Utils.Tables.Some({ ... }, function(collectible)
		return player:HasCollectible(collectible)
	end)
end
