--- Helper function to get the combined normal charge and the battery charge for the player's active
--- item. This is useful because you have to add these two values together when setting the active
--- charge.
---@param player EntityPlayer The player to get the charges from.
---@param activeSlot ActiveSlot? Optional. The slot to get the charges from. Default is `ActiveSlot.SLOT_PRIMARY`
---@return integer
function TSIL.Charge.GetTotalCharge(player, activeSlot)
    activeSlot = activeSlot or ActiveSlot.SLOT_PRIMARY
    
    local activeCharge = player:GetActiveCharge(activeSlot)
    local batteryCharge = player:GetBatteryCharge(activeSlot)

    return activeCharge + batteryCharge
end