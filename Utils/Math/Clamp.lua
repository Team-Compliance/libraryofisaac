--- Helper function to clamp a number into a range.
---@param a number
---@param min number
---@param max number
---@return number
function TSIL.Utils.Math.Clamp(a, min, max)
	if min > max then
		local temp = min
		min = max
		max = temp
	end

	return math.max(min, math.min(a, max))
end