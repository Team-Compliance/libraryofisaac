--##use CustomItemPools/RegisterItemPool.lua

---Adds an item to a custom item pool for the current run.
---
---If the item wasn't in the pool to begin with, it'll create a new entry for the item.
---If the item was already in the pool, it'll add the weight you passed to the entry already in the pool,
---unless the `ignoreDuplicate` param is set to true.
---@param customItemPoolType integer
---@param newItemPoolCollectible CustomItemPoolCollectible
---@param ignoreIfDuplicate? boolean @ Default: false | Set to true so if the item is in the pool, it doesn't get added again
function TSIL.CustomItemPools.AddCollectible(customItemPoolType, newItemPoolCollectible, ignoreIfDuplicate)
    if ignoreIfDuplicate == nil then
        ignoreIfDuplicate = false
    end

    ---@type CustomItemPoolCollectible[][]
    local customItemPools = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "itemPools_CUSTOM_ITEM_POOLS"
    )
    local itemPoolCollectibles = customItemPools[customItemPoolType]

    if not itemPoolCollectibles then
        error("There is no registered item pool with that id: " .. customItemPoolType)
    end

    for _, itemPoolCollectible in ipairs(itemPoolCollectibles) do
        if itemPoolCollectible.Collectible == newItemPoolCollectible.Collectible then
            if not ignoreIfDuplicate then
                itemPoolCollectible.Weight = itemPoolCollectible.Weight + newItemPoolCollectible.Weight
            end

            return
        end
    end

    itemPoolCollectibles[#itemPoolCollectibles+1] = newItemPoolCollectible
end



---Adds an item to a registered custom item pool.
---
---Unlike `TSIL.CustomItemPools.AddCollectible`, this will add the collectible to the registered pool,
---so when the pool is reset, this new item will be in the pool.
---@param customItemPoolType integer
---@param newItemPoolCollectible CustomItemPoolCollectible
function TSIL.CustomItemPools.AddCollectibleToRegisteredPool(customItemPoolType, newItemPoolCollectible)
    ---@type CustomItemPoolCollectible[]
    local registeredItemPool = TSIL.__VERSION_PERSISTENT_DATA.CustomItemPools[customItemPoolType]

    if not registeredItemPool then
        error("There is no registered item pool with that id: " .. customItemPoolType)
    end

    local inItemPool = TSIL.Utils.Tables.Some(registeredItemPool, function (itemPoolCollectible)
        return itemPoolCollectible.Collectible == newItemPoolCollectible.Collectible
    end)

    if inItemPool then
        return
    end

    registeredItemPool[#registeredItemPool+1] = newItemPoolCollectible
end



---Adds a list of collectibles to a registered custom item pool.
---
---Unlike `TSIL.CustomItemPools.AddCollectible`, this will add the collectible to the registered pool,
---so when the pool is reset, this new item will be in the pool.
---@param customItemPoolType integer
---@param itemPoolCollectibles CustomItemPoolCollectible[]
function TSIL.CustomItemPools.AddCollectiblesToRegisteredPool(customItemPoolType, itemPoolCollectibles)
    for _, itemPoolCollectible in ipairs(itemPoolCollectibles) do
        TSIL.CustomItemPools.AddCollectibleToRegisteredPool(customItemPoolType, itemPoolCollectible)
    end
end