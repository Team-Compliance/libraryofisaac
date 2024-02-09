--- Helper function to return the maximum charge a player can have in
--- a given active slot.
---
--- Use this over `player:GetActiveMaxCharge` if you want to account for
--- the over charge given by The Battery.
---@param player EntityPlayer
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to get the max charges from.
function TSIL.Charge.GetEffectiveMaxCharge(player, activeSlot)
    if not activeSlot then activeSlot = ActiveSlot.SLOT_PRIMARY end

    local maxCharge = player:GetActiveMaxCharge(activeSlot)

    if player:HasCollectible(CollectibleType.COLLECTIBLE_BATTERY) then
        return maxCharge * 2
    else
        return maxCharge
    end
end