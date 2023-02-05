--- Returns the number of trinkets a player has smelted.
--- Won't count the trinkets they're currently holding.
---@param player EntityPlayer
---@param trinket TrinketType
---@return integer
function TSIL.Players.GetSmeltedTrinketMultiplier(player, trinket)
	local totalMultiplier = player:GetTrinketMultiplier(trinket)
	local playerHasMomsBox = player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BOX)

	for i = 0, 1 do
		local slotTrinket = player:GetTrinket(i)
		if slotTrinket & ~ TrinketType.TRINKET_GOLDEN_FLAG == trinket then
			local reduction = playerHasMomsBox and 2 or 1
			if slotTrinket & TrinketType.TRINKET_GOLDEN_FLAG > 0 then
				reduction = reduction + 1
			end

			totalMultiplier = totalMultiplier - reduction
		end
	end

	return totalMultiplier
end