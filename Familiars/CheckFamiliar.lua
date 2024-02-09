local familiarGenerationRNG = nil


--- Helper function to add and remove familiars based on a target amount that you specify.
---
--- This is a convenience wrapper around the `EntityPlayer.CheckFamiliar` method. Use this helper
--- function instead so that you do not have to retrieve the `ItemConfigItem` and so that you do not
--- specify an incorrect RNG object. (The vanilla method is bugged in that it does not increment the
--- RNG object; see the documentation of the method for more details.)
---
--- This function is meant to be called in the `EVALUATE_CACHE` callback (when the cache flag is
--- equal to `CacheFlag.FAMILIARS`).
---
--- Note that this function is only meant to be used in special circumstances where the familiar
--- count is completely custom and does not correspond to the amount of collectibles. For the general
--- case, use the `checkFamiliarFromCollectibles` helper function instead.
---
--- Note that this will spawn familiars with a completely random `InitSeed`. When calculating random
--- events for this familiar, you should use a data structure that maps familiar `InitSeed` to RNG
--- objects that are initialized based on the seed from `EntityPlayer.GetCollectibleRNG(collectibleType)`.
---@param player EntityPlayer
---@param collectibleType CollectibleType
---@param targetCount integer
---@param familiarVariant FamiliarVariant
---@param familiarSubtype integer? @Optional. The SubType of the familiar to spawn or remove. If not specified, it will seach for existing familiars of all SubTypes, and spawn new familiars with a SubType of 0.
---@return EntityFamiliar[]
function TSIL.Familiars.CheckFamiliar(player, collectibleType, targetCount, familiarVariant, familiarSubtype)
    if not familiarGenerationRNG then
        familiarGenerationRNG = TSIL.RNG.NewRNG()
    end

    familiarGenerationRNG:Next()

    local itemConfigItem = Isaac.GetItemConfig():GetCollectible(collectibleType)

    return player:CheckFamiliarEx(familiarVariant, targetCount, familiarGenerationRNG, itemConfigItem, familiarSubtype)
end


--- Helper function to add and remove familiars based on the amount of associated collectibles that a
--- player has.
---
--- Use this helper function instead of invoking the `EntityPlayer.CheckFamiliar` method directly so
--- that the target count is handled automatically.
---
--- This function is meant to be called in the `EVALUATE_CACHE` callback (when the cache flag is
--- equal to `CacheFlag.FAMILIARS`).
---
--- Use this function when the amount of familiars should be equal to the amount of associated
--- collectibles that the player has (plus any extras from having used Box of Friends or Monster
--- Manual). If you instead need to have a custom amount of familiars, use the `checkFamiliars`
--- function instead.
---
--- Note that this will spawn familiars with a completely random `InitSeed`. When calculating random
--- events for this familiar, you should use a data structure that maps familiar `InitSeed` to RNG
--- objects that are initialized based on the seed from
--- `EntityPlayer.GetCollectibleRNG(collectibleType)`.
---@param player EntityPlayer
---@param collectibleType CollectibleType
---@param familiarVariant FamiliarVariant
---@param familiarSubtype integer? @ Optional. The SubType of the familiar to spawn or remove. If not specified, it will seach for existing familiars of all SubTypes, and spawn new familiars with a SubType of 0.
---@return EntityFamiliar[]
function TSIL.Familiars.CheckFamiliarFromCollectibles(player, collectibleType, familiarVariant, familiarSubtype)
    local numCollectibles = player:GetCollectibleNum(collectibleType)

    local effects = player:GetEffects()
    local numCollectibleEffects = effects:GetCollectibleEffectNum(collectibleType)

    local targetCount = numCollectibles + numCollectibleEffects

    return TSIL.Familiars.CheckFamiliar(
        player,
        collectibleType,
        targetCount,
        familiarVariant,
        familiarSubtype
    )
end