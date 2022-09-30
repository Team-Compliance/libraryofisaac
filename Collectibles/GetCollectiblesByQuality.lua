---Returns a list of all items of a certain quality.
---Use only inside a callback or not all modded items may be loaded.
---@param quality integer 0|1|2|3|4
---@return CollectibleType[]
function TSIL.Collectibles.GetCollectiblesByQuality(quality)
    local collectibles = TSIL.Collectibles.GetCollectibles()

    return TSIL.Utils.Tables.Filter(collectibles, function (collectible)
        return collectible.Quality == quality
    end)
end