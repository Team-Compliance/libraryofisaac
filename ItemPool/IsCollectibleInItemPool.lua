---Helper function to see if the given collectible is still present in the given item pool.
---
---This function ignores modifiers like T.Lost offensive item mechanic and passive effects like the NO! trinket.
---If you want to account for them, use `ItemPool:CanSpawnCollectible()`.
---@param collectibleType CollectibleType
---@param itemPoolType ItemPoolType
---@return boolean
function TSIL.ItemPool.IsCollectibleInItemPool(collectibleType, itemPoolType)
    local itemPool = Game():GetItemPool()
    local collectibles = itemPool:GetCollectiblesFromPool(itemPoolType)
    local poolItem = collectibles[collectibleType]

    local itemConfig = Isaac.GetItemConfig()
    local itemInfo = itemConfig:GetCollectible(collectibleType)
    local achievement = itemInfo.AchievementID

    --The collectible isn't in the pool to begin with
    if not poolItem then
        return false
    end

    --If the weight is less than what would be considered to be removed it's not in the pool
    if poolItem.weight < poolItem.removeOn then
        return false
    end

    --Hidden items are never in pools
    if itemInfo.Hidden then
        return false
    end

    if achievement > 0 then
        --Check if the linked achievement is unlocked
        local persistentGameData = Isaac.GetPersistentGameData()
        return persistentGameData:Unlocked(achievement)
    else
        --No linked achievement
        return true
    end
end