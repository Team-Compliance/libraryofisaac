--- Helper function to set a collectible sprite to a red question mark.
---@param collectible EntityPickup
function TSIL.Collectibles.SetCollectibleBlind(collectible)
    if collectible.Type ~= EntityType.ENTITY_PICKUP or
    collectible.Variant ~= PickupVariant.PICKUP_COLLECTIBLE then
        error("The SetCollectibleBlind function was given a non collectible: " .. collectible.Type)
    end

    TSIL.Collectibles.SetCollectibleSprite(collectible, "gfx/items/collectibles/questionmark.png")
end


--- Helper function to change a collectible into a glitched one.
---@param collectible EntityPickup
function TSIL.Collectibles.SetCollectibleGlitched(collectible)
    if collectible.Type ~= EntityType.ENTITY_PICKUP or
    collectible.Variant ~= PickupVariant.PICKUP_COLLECTIBLE then
        error("The SetCollectibleGlitched function was given a non collectible: " .. collectible.Type)
    end

    local haveTMTRAINER = PlayerManager.AnyoneHasCollectible(CollectibleType.COLLECTIBLE_TMTRAINER)

    if not haveTMTRAINER then
        Isaac.GetPlayer(0):AddCollectible(CollectibleType.COLLECTIBLE_TMTRAINER)
    end

    local itemPool = Game():GetItemPool()
    local collectibleType = itemPool:GetCollectible(ItemPoolType.POOL_TREASURE)

    TSIL.Collectibles.SetCollectibleSubType(collectible, collectibleType)

    if not haveTMTRAINER then
        Isaac.GetPlayer(0):RemoveCollectible(CollectibleType.COLLECTIBLE_TMTRAINER)
    end
end


--- Helper function to change the collectible in a pedestal.
---
--- If `COLLECTIBLE_NULL` is given as the new subtype, it'll try removing the item,
--- as if the player had already picked it. Check `TSIL.Collectibles.TryRemoveCollectible()`
--- for more information.
---@param collectible EntityPickup
---@param newSubType CollectibleType
function TSIL.Collectibles.SetCollectibleSubType(collectible, newSubType)
    if collectible.Type ~= EntityType.ENTITY_PICKUP or
    collectible.Variant ~= PickupVariant.PICKUP_COLLECTIBLE then
        error("The SetCollectibleSubType function was given a non collectible: " .. collectible.Type)
    end

    if newSubType == CollectibleType.COLLECTIBLE_NULL then
        TSIL.Collectibles.TryRemoveCollectible(collectible)
        return
    end

    collectible:Morph(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, newSubType, true, true, true)
end