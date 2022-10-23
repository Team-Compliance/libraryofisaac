--- Helper function to get the maximum amount of charges that a collectible has. Returns 0 if the
--- provided collectible type was not valid.
---@param collectibleType CollectibleType
---@return number 
function TSIL.Collectibles.GetCollectibleMaxCharges(collectibleType)
    local itemConfigItem = Isaac.GetItemConfig():GetCollectible(collectibleType)

    if not itemConfigItem then
        return 0
    else
        return itemConfigItem.MaxCharges
    end
end