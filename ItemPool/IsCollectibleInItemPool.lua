local COLLECTIBLE_TYPE_THAT_IS_NOT_IN_ANY_POOLS = CollectibleType.COLLECTIBLE_KEY_PIECE_1
local COLLECTIBLES_THAT_AFFECT_ITEM_POOLS = {
    CollectibleType.COLLECTIBLE_CHAOS,
    CollectibleType.COLLECTIBLE_SACRED_ORB,
    CollectibleType.COLLECTIBLE_TMTRAINER
}

local TRINKETS_THAT_AFFECT_ITEM_POOLS = {
    TrinketType.TRINKET_NO
}


---@return table
---@return table
local function RemoveItemsAndTrinketsThatAffectItemPools()
    local removedItemsMap = {}
    local removedTrinketsMap = {}

    for _, player in ipairs(TSIL.Players.GetPlayers()) do
        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        local removedItems = {}

        for _, itemToRemove in ipairs(COLLECTIBLES_THAT_AFFECT_ITEM_POOLS) do
            local numCollectibles = player:GetCollectibleNum(itemToRemove)

            for i = 1, numCollectibles, 1 do
                player:RemoveCollectible(itemToRemove)
                removedItems[#removedItems+1] = itemToRemove
            end
        end

        removedItemsMap[playerIndex] = removedItems

        local removedTrinkets = {}

        for _, trinketToRemove in ipairs(TRINKETS_THAT_AFFECT_ITEM_POOLS) do
            if player:HasTrinket(trinketToRemove) then
                local numTrinkets = player:GetTrinketMultiplier(trinketToRemove)

                for i = 1, numTrinkets, 1 do
                    player:TryRemoveTrinket(trinketToRemove)
                    removedTrinkets[#removedTrinkets+1] = trinketToRemove
                end
            end
        end

        removedTrinketsMap[playerIndex] = removedTrinkets
    end

    return removedItemsMap, removedTrinketsMap
end


---@param removedItemsMap table
---@param removedTrinketsMap table
local function RestoreItemsAndTrinketsThatAffectItemPools(removedItemsMap, removedTrinketsMap)
    for _, player in ipairs(TSIL.Players.GetPlayers()) do
        local playerIndex = TSIL.Players.GetPlayerIndex(player)

        local removedItems = removedItemsMap[playerIndex]
        if removedItems ~= nil then
            for _, collectibleType in ipairs(removedItems) do
                player:AddCollectible(collectibleType, 0, false)
            end
        end

        local removedTrinkets = removedTrinketsMap[playerIndex]
        if removedTrinkets ~= nil then
            for _, trinketType in ipairs(removedTrinkets) do
                player:AddTrinket(trinketType)
            end
        end
    end
end


---Helper function to see if the given collectible is still present in the given item pool.
---
---If the collectible is non-offensive, any Tainted Losts will be temporarily changed to Isaac 
---and then changed back. (This is because Tainted Lost is not able to retrieve non-offensive 
---collectibles from item pools).
---
---Under the hood, this function works by using the ItemPool.AddRoomBlacklist method to blacklist
---every collectible except for the one provided.
---@param collectibleType CollectibleType
---@param itemPoolType ItemPoolType
---@return boolean
function TSIL.ItemPool.IsCollectibleInItemPool(collectibleType, itemPoolType)
    --We use a specific collectible which is known to not be in any pools as a default value. Thus,
    --we must explicitly handle this case.
    if collectibleType == COLLECTIBLE_TYPE_THAT_IS_NOT_IN_ANY_POOLS then
      return false
    end

    --On Tainted Lost, it is impossible to retrieve non-offensive collectibles from pools, so we
    --temporarily change the character to Isaac.
    local taintedLosts = TSIL.Players.GetPlayersOfType(PlayerType.PLAYER_THELOST_B)
    local isOffensive = TSIL.Collectibles.CollectibleHasFlag(
      collectibleType,
      TSIL.Enums.ItemConfigTag.OFFENSIVE
    )

    local changedPlayerTypes = false;
    if not isOffensive then
        changedPlayerTypes = true;
        for _, player in ipairs(taintedLosts) do
            player:ChangePlayerType(PlayerType.PLAYER_ISAAC);
        end
    end

    local removedItemsMap, removedTrinketsMap = RemoveItemsAndTrinketsThatAffectItemPools()

    --Blacklist every collectible in the game except for the provided collectible.
    local itemPool = Game():GetItemPool();
    itemPool:ResetRoomBlacklist();
    for _, itemConfigItem in ipairs(TSIL.Collectibles.GetCollectibles()) do
        if itemConfigItem.ID ~= collectibleType then
            ---@diagnostic disable-next-line: param-type-mismatch
            itemPool:AddRoomBlacklist(itemConfigItem.ID)
        end
    end

    --Get a collectible from the pool and see if it is the intended collectible. (We can use any
    --arbitrary value as the seed since it should not influence the result.)
    local seed = 1
    local retrievedCollectibleType = itemPool:GetCollectible(
      itemPoolType,
      false,
      seed,
      COLLECTIBLE_TYPE_THAT_IS_NOT_IN_ANY_POOLS
    )
    local collectibleUnlocked = retrievedCollectibleType == collectibleType

    --Reset the blacklist
    itemPool:ResetRoomBlacklist()

    RestoreItemsAndTrinketsThatAffectItemPools(removedItemsMap, removedTrinketsMap)

    --Change any players back to Tainted Lost, if necessary.
    if changedPlayerTypes then
        for _, player in taintedLosts do
            player:ChangePlayerType(PlayerType.PLAYER_THELOST_B);
        end
    end

    return collectibleUnlocked;
end