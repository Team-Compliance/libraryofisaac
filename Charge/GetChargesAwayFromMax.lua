--- Helper function to get the amount of charges away from the maximum charge that a particular
--- player is.
---
--- This function accounts for The Battery. For example, if the player has 2/6 charges on a D6, this
--- function will return 10 (because there are 4 charges remaining on the base charge and 6 charges
--- remaining on The Battery charge).
---@param player EntityPlayer @The player to get the charges from 
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to get the charges from.
---@return integer
function TSIL.Charge.GetChargesAwayFromMax(player, activeSlot)
    local totalCharge = TSIL.Charge.GetTotalCharge(player, activeSlot)
    local hasBattery = player:HasCollectible(CollectibleType.COLLECTIBLE_BATTERY)
    local maxCharges = TSIL.Charge.GetMaxCharges(player, activeSlot)

    ---@type number
    local effectiveMaxCharges

    if hasBattery then
        effectiveMaxCharges = maxCharges * 2
    else
        effectiveMaxCharges = maxCharges
    end

    return effectiveMaxCharges - totalCharge;
end