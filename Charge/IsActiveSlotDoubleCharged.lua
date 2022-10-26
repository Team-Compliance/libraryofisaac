--- Helper function to check if a player's active item is "double charged", meaning that it has both
--- a full normal charge and a full charge from The Battery.
---@param player EntityPlayer The Player to check
---@param activeSlot ActiveSlot? Optional. The slot to check. Default is `ActiveSlot.SLOT_PRIMARY`
---@return boolean
function TSIL.Charge.IsActiveSlotDoubleCharged(player, activeSlot)
    activeSlot = activeSlot or ActiveSlot.SLOT_PRIMARY
    local collectibleType = player:GetActiveItem(activeSlot)
    local batteryCharge = player:GetBatteryCharge(activeSlot)
    local maxCharges = TSIL.Collectibles.GetCollectibleMaxCharges(collectibleType)
    
    return batteryCharge >= maxCharges
end