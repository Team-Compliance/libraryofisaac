---Helper function to check if a collectible type has a given flag
---@param collectibleType CollectibleType
---@param flag ItemConfigTag
---@return boolean
function TSIL.Collectibles.CollectibleHasFlag(collectibleType, flag)
    local itemConfig = Isaac.GetItemConfig()
    local itemConfigItem = itemConfig:GetCollectible(collectibleType)

    return itemConfigItem:HasTags(flag)
end