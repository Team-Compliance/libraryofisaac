--- Helper function to check if a player's active item is "double charged", meaning that it has both
--- a full normal charge and a full charge from The Battery.
---@param player EntityPlayer @The player to check
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to check.
---@return boolean
function TSIL.Charge.IsActiveSlotDoubleCharged(player, activeSlot)
    activeSlot = activeSlot or ActiveSlot.SLOT_PRIMARY

    local totalCharge = player:GetTotalActiveCharge(activeSlot)
    local maxCharge = player:GetActiveMaxCharge(activeSlot)
    
    return totalCharge >= maxCharge * 2
end