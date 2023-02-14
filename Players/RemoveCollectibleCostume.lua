--- Removes a costume from the provided player.
---@param player EntityPlayer
---@param collectible CollectibleType
function TSIL.Players.RemoveCollectibleCostume(player, collectible)
	local itemConfig = Isaac.GetItemConfig()
	local collectibleConfig = itemConfig:GetCollectible(collectible)

	if collectibleConfig then
		player:RemoveCostume(collectibleConfig)
	end
end
