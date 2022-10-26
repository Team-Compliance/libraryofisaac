--- Helper function to get the amount of charges away from the maximum charge that a particular
--- player is.
---
--- This function accounts for The Battery. For example, if the player has 2/6 charges on a D6, this
--- function will return 10 (because there are 4 charges remaining on the base charge and 6 charges
--- remaining on The Battery charge).
---@param player EntityPlayer The player to get the charges from 
---@param activeSlot ActiveSlot? Optional. The slot to get the charges from. Default is `ActiveSlot.SLOT_PRIMARY`.
---@return integer
function TSIL.Charge.GetChargesAwayFromMax(player, activeSlot)
    activeSlot = activeSlot or ActiveSlot.SLOT_PRIMARY
    local totalCharge = TSIL.Charge.GetTotalCharge(player, activeSlot)
    local activeItem = player:GetActiveItem(activeSlot)
    local hasBattery = player:HasCollectible(CollectibleType.COLLECTIBLE_BATTERY)
    local maxCharges = TSIL.Collectibles.GetCollectibleMaxCharges(activeItem)

    ---@type number
    local effectiveMaxCharges

    if hasBattery then
        effectiveMaxCharges = maxCharges * 2
    else
        effectiveMaxCharges = maxCharges
    end

    return effectiveMaxCharges - totalCharge;
end