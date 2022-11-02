local RED_HEART_SUB_TYPES_SET = {
    [HeartSubType.HEART_FULL] = true,
    [HeartSubType.HEART_HALF] = true,
    [HeartSubType.HEART_DOUBLEPACK] = true,
}


---Helper function to get all of the red heart pickup entities in the room.
---@return EntityPickup[]
function TSIL.Pickups.GetRedHearts()
    local hearts = TSIL.PickupSpecific.GetHearts()

    return TSIL.Utils.Tables.Filter(hearts, function (_, heart)
        return RED_HEART_SUB_TYPES_SET[heart.SubType]
    end)
end


---Helper function to test if the provided pickup matches one of the various red heart sub types.
---@param pickup EntityPickup
---@return boolean
function TSIL.Pickups.IsRedHeart(pickup)
    return pickup.Variant == PickupVariant.PICKUP_HEART and
    RED_HEART_SUB_TYPES_SET[pickup.SubType] ~= nil
end