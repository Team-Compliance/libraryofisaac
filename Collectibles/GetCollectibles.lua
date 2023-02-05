--- Returns a list with all items currently loaded.
---
--- Use only inside a callback or not all modded items may be loaded.
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetCollectibles()
	local collectibles = {}

	local itemConfig = Isaac.GetItemConfig()
	local itemList = itemConfig:GetCollectibles()

	--itemList.Size actually returns the last item id, not the actual size
	for id = 1, itemList.Size - 1, 1 do
		local item = itemConfig:GetCollectible(id)
		if item then
			table.insert(collectibles, item)
		end
	end

	return collectibles
end


--- Returns a list of all items of a certain quality.
---
--- Use only inside a callback or not all modded items may be loaded.
---@param quality integer
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetCollectiblesByQuality(quality)
	local collectibles = TSIL.Collectibles.GetCollectibles()

	return TSIL.Utils.Tables.Filter(collectibles, function (_, collectible)
		return collectible.Quality == quality
	end)
end


--- Returns a list of all vanilla items.
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetVanillaCollectibles()
	local collectibles = {}

	local itemConfig = Isaac.GetItemConfig()

	--itemList.Size actually returns the last item id, not the actual size
	for id = 1, CollectibleType.NUM_COLLECTIBLES, 1 do
		local item = itemConfig:GetCollectible(id)
		if item then
			table.insert(collectibles, item)
		end
	end

	return collectibles
end


--- Returns a list of all modded items currently loaded.
--- 
--- Use only inside a callback or not all modded items may be loaded.
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetModdedCollectibles()
	local collectibles = {}

	local itemConfig = Isaac.GetItemConfig()
	local itemList = itemConfig:GetCollectibles()

	--itemList.Size actually returns the last item id, not the actual size
	for id = CollectibleType.NUM_COLLECTIBLES, itemList.Size - 1, 1 do
		local item = itemConfig:GetCollectible(id)
		if item then
			table.insert(collectibles, item)
		end
	end

	return collectibles
end


--- Returns a list of all items that have all the given tags.
--- 
--- Use only inside a callback or not all modded items may be loaded.
---@param ... ItemConfigTag
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetCollectiblesWithTag(...)
	local tags = {...}
	local totalTags = 0
	for _, tag in ipairs(tags) do
		totalTags = totalTags | tag
	end

	local collectibles = {}

	local itemConfig = Isaac.GetItemConfig()
	local itemList = itemConfig:GetCollectibles()

	--itemList.Size actually returns the last item id, not the actual size
	for id = 1, itemList.Size - 1, 1 do
		local item = itemConfig:GetCollectible(id)
		if item and item:HasTags(totalTags) then
			table.insert(collectibles, item)
		end
	end

	return collectibles
end