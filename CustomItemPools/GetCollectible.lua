--##use CustomItemPools/RegisterItemPool.lua

---Helper function to get an item from a custom item pool created with `TSIL.CustomItemPools.RegisterCustomItemPool()`.
---
---Similar to vanilla pools, the item will only get it's weight decreased if the `decrease` argument is set to true.
---@param customItemPoolType integer
---@param decrease? boolean @Default: true
---@param seedOrRNG? integer | RNG @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called.
---@param defaultItem? CollectibleType @Default: CollectibleType.COLLECTIBLE_NULL
function TSIL.CustomItemPools.GetCollectible(customItemPoolType, decrease, seedOrRNG, defaultItem)
    if decrease == nil then
        decrease = true
    end

    seedOrRNG = seedOrRNG or TSIL.RNG.GetRandomSeed()

    ---@type RNG
    local rng

    if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
        ---@cast seedOrRNG RNG
        rng = seedOrRNG
    else
        ---@cast seedOrRNG integer?
        rng = TSIL.RNG.NewRNG(seedOrRNG)
    end

    if defaultItem == nil then
        defaultItem = CollectibleType.COLLECTIBLE_NULL
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

    if #itemPoolCollectibles == 0 then
        --The item pool is empty
        local returnVal = TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_GET_COLLECTIBLE_CUSTOM_ITEM_POOL,
            defaultItem,
            customItemPoolType,
            decrease,
            rng:GetSeed()
        )

        if returnVal then
            return returnVal
        end

        return defaultItem
    end

    local weigthedList = TSIL.Utils.Tables.Map(itemPoolCollectibles, function (_, itemPoolCollectible)
        return {
            chance = itemPoolCollectible.Weight,
            value = itemPoolCollectible.Collectible
        }
    end)
    ---@type CollectibleType
    local chosenCollectible = TSIL.Random.GetRandomElementFromWeightedList(rng, weigthedList)

    for index, itemPoolCollectible in ipairs(itemPoolCollectibles) do
        if itemPoolCollectible.Collectible == chosenCollectible and decrease then
            itemPoolCollectible.Weight = itemPoolCollectible.Weight - itemPoolCollectible.DecreaseBy

            if itemPoolCollectible.Weight < itemPoolCollectible.RemoveOn then
                table.remove(itemPoolCollectibles, index)
            end

            break
        end
    end

    local returnVal = TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.POST_GET_COLLECTIBLE_CUSTOM_ITEM_POOL,
        chosenCollectible,
        customItemPoolType,
        decrease,
        rng:GetSeed()
    )

    if returnVal then
        chosenCollectible = returnVal
    end

    return chosenCollectible
end


---Helper function to get a copy of the current item entries for a given pool.
---@param customItemPoolType integer
---@return CustomItemPoolCollectible[]
function TSIL.CustomItemPools.GetCollectibleEntriesInItemPool(customItemPoolType)
    ---@type CustomItemPoolCollectible[][]
    local customItemPools = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "itemPools_CUSTOM_ITEM_POOLS"
    )
    local itemPoolCollectibles = customItemPools[customItemPoolType]

    if not itemPoolCollectibles then
        error("There is no registered item pool with that id: " .. customItemPoolType)
    end

    return TSIL.Utils.Tables.Copy(itemPoolCollectibles)
end