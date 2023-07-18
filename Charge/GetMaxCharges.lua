---Helper function to get the maximum number of charges the player has for a given active slot.
---
---Useful since just checking the item config won't account for items that can have multiple number of
---charges, like Blank Card.
---@param player EntityPlayer @The player to get the charges from 
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to get the charges from.
---@return integer
function TSIL.Charge.GetMaxCharges(player, activeSlot)
    if not activeSlot then activeSlot = ActiveSlot.SLOT_PRIMARY end

    local previousCharge = TSIL.Charge.GetTotalCharge(player, activeSlot)
    --We set the charge to an arbitrary high value to ensure it always maxes out
    player:SetActiveCharge(math.floor(math.maxinteger/100), activeSlot)
    local currentCharge = player:GetActiveCharge(activeSlot)
    player:SetActiveCharge(previousCharge, activeSlot)

    return currentCharge
end
