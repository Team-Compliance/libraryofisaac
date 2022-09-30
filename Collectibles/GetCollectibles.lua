---Returns a list with all item ids currently loaded.
---Use only inside a callback or not all modded items may be loaded.
---@return CollectibleType[]
function TSIL.Collectibles.GetCollectibles()
    local collectibles = {}

    local itemConfig = Isaac.GetItemConfig()
    local itemList = itemConfig:GetCollectibles()

    --itemList.Size actually returns the last item id, not the actual size
    for id = 1, itemList.Size - 1, 1 do
        local item = itemConfig:GetCollectible(id)
        if item then
            table.insert(collectibles, item)
        end
    end

    return collectibles
end