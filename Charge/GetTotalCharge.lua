--- Helper function to get the combined normal charge and the battery charge for the player's active
--- item. This is useful because you have to add these two values together when setting the active
--- charge.
---@param player EntityPlayer @The player to get the charges from.
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to get the charges from.
---@return integer
function TSIL.Charge.GetTotalCharge(player, activeSlot)
    activeSlot = activeSlot or ActiveSlot.SLOT_PRIMARY
    
    local activeCharge = player:GetActiveCharge(activeSlot)
    local batteryCharge = player:GetBatteryCharge(activeSlot)

    return activeCharge + batteryCharge
end