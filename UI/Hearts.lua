--- Returns how many hearts that are being displayed on the provided player's UI
---@param player EntityPlayer
---@return integer
function TSIL.UI.GetVisibleHearts(player)
	local effectiveMaxHearts = player:GetEffectiveMaxHearts()
	local soulHearts = player:GetSoulHearts()
	local boneHearts = player:GetBoneHearts()
	local maxHearts = math.max(effectiveMaxHearts, boneHearts * 2)

	local visibleHearts = math.ceil((maxHearts + soulHearts) / 2)

	if visibleHearts < 1 then
		visibleHearts = 1
	end

	return visibleHearts
end

--- Returns how many hearts that are being displayed in a row. If the player has more than 6
--- hearts, then this function will return 6 due to the hearts wrapping into rows.
---@param player EntityPlayer
---@return integer
function TSIL.UI.GetHeartRowLength(player)
	local maxHearts = player:GetMaxHearts()
	local soulHearts = player:GetSoulHearts()
	local boneHearts = player:GetBoneHearts()

	local combinedHearts = maxHearts + soulHearts + boneHearts
	local heartRowLength = combinedHearts / 2

	return math.min(heartRowLength, 6)
end
