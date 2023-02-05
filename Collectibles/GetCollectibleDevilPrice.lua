--- Helper function to get the coin cost a collectible would have if it were being offered as a
--- Devil Room Deal.
---@param collectibleType CollectibleType
---@return integer
function TSIL.Collectibles.GetCollectibleDevilCoinPrice(collectibleType)
    if collectibleType == CollectibleType.COLLECTIBLE_NULL then
        return 0
    end

    local defaultPrice = 15
    local itemConfig = Isaac.GetItemConfig()
    local itemConfigItem = itemConfig:GetCollectible(collectibleType)

    if not itemConfigItem then
        return defaultPrice
    end

    return itemConfigItem.DevilPrice * defaultPrice
end


--- Helper function to get the heart cost a collectible would have if it were being offered as a
--- Devil Room Deal.
---@param collectibleType CollectibleType @ If this is set to `COLLECTIBLE_NULL` then it'll return `PRICE_FREE`
---@param player EntityPlayer
---@return PickupPrice
function TSIL.Collectibles.GetCollectibleDevilHeartPrice(collectibleType, player)
    if collectibleType == CollectibleType.COLLECTIBLE_NULL then
        return PickupPrice.PRICE_FREE
    end

    local maxHearts = player:GetMaxHearts()

    if maxHearts == 0 then
        return PickupPrice.PRICE_THREE_SOULHEARTS
    end

    local defaultPrice = PickupPrice.PRICE_ONE_HEART
    local itemConfig = Isaac.GetItemConfig()
    local itemConfigItem = itemConfig:GetCollectible(collectibleType)

    if not itemConfigItem then
        return defaultPrice
    end

    if itemConfigItem.DevilPrice == 2 then
        if maxHearts <= 2 then
            return PickupPrice.PRICE_ONE_HEART_AND_TWO_SOULHEARTS
        else
            return PickupPrice.PRICE_TWO_HEARTS
        end
    else
        return PickupPrice.PRICE_ONE_HEART
    end
end