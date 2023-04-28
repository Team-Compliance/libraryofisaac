--##use CustomItemPools/RegisterItemPool.lua

---Helper function to check if a certain collectible is in a custom item pool.
---@param customItemPoolType integer
---@param collectibleType CollectibleType
---@return boolean
function TSIL.CustomItemPools.IsCollectibleInCustomPool(customItemPoolType, collectibleType)
    local itemPoolCollectibles = TSIL.CustomItemPools.GetCollectibleEntriesInItemPool(customItemPoolType)

    return TSIL.Utils.Tables.Some(itemPoolCollectibles, function (value)
        return value.Collectible == collectibleType
    end)
end