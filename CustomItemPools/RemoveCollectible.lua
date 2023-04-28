--##use CustomItemPools/RegisterItemPool.lua

---Helper function to remove an item from the given custom item pool.
---
---Will return true if the item was in the pool before being removed.
---@param customItemPoolType integer
---@param collectibleType CollectibleType
---@param decreaseBy? number @ If provided, it'll remove the weight from the item instead of removing the item completely
---@return boolean
function TSIL.CustomItemPools.RemoveCollectible(customItemPoolType, collectibleType, decreaseBy)
    ---@type CustomItemPoolCollectible[][]
    local customItemPools = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "itemPools_CUSTOM_ITEM_POOLS"
    )
    local itemPoolCollectibles = customItemPools[customItemPoolType]

    if not itemPoolCollectibles then
        error("There is no registered item pool with that id: " .. customItemPoolType)
    end

    local wasInPool = false

    for index, itemPoolCollectible in ipairs(itemPoolCollectibles) do
        if itemPoolCollectible.Collectible == collectibleType then
            wasInPool = true

            if decreaseBy then
                itemPoolCollectible.Weight = itemPoolCollectible.Weight - decreaseBy
                if itemPoolCollectible.Weight < itemPoolCollectible.RemoveOn then
                    table.remove(itemPoolCollectibles, index)
                end
            else
                table.remove(itemPoolCollectibles, index)
            end

            break
        end
    end

    return wasInPool
end