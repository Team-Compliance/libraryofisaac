---Helper function to get all of the pickups in the room.
---@param pickupVariant PickupVariant|integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityPickup[]
function TSIL.Entities.GetPickups(pickupVariant, subType)
    local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_PICKUP, pickupVariant, subType)
    local pickups = {}

    for _, v in pairs(entities) do
        local pickup = v:ToPickup()
        if pickup then
            table.insert(pickups, pickup)
        end
    end

    return pickups
end