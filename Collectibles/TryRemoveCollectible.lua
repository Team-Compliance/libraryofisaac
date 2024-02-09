--- Empties an item pedestal as if a player had already
--- picked it up.
---
--- If it's a shop item, it removes it completely.
---@param collectible EntityPickup
---@return boolean Whether the collectible could be emptied.
function TSIL.Collectibles.TryRemoveCollectible(collectible)
	if collectible.Variant ~= PickupVariant.PICKUP_COLLECTIBLE or
	collectible.SubType == CollectibleType.COLLECTIBLE_NULL then
		return false
	end

	local sprite = collectible:GetSprite()
	collectible.SubType = CollectibleType.COLLECTIBLE_NULL

	if collectible.Price == 0 then
		sprite:SetFrame("Empty",0)
		sprite:ReplaceSpritesheet(4, "gfx/none.png")
		sprite:LoadGraphics()
		return true
	else
		collectible:Remove()
		return true
	end
end