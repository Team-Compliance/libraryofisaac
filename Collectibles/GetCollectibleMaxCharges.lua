--- Helper function to get the maximum amount of charges that a collectible has. Returns 0 if the
--- provided collectible type was not valid.
---@param collectiblleType CollectibleType
---@return number 
function TSIL.Collectibles.GetCollectibleMaxCharges(collectiblleType)
    local itemConfigItem = Isaac.GetItemConfig():GetCollectible(collectiblleType)

    if not itemConfigItem then
        return 0
    else
        return itemConfigItem.MaxCharges
    end
end