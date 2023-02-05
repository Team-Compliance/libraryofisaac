--- Rounds a number to the closest number of decimal places given.
--- 
--- Defaults to rounding to the nearest integer.
---@param n number
---@param decimalPlaces integer? @Default: 0
---@return number
function TSIL.Utils.Math.Round(n, decimalPlaces)
	decimalPlaces = decimalPlaces or 0
	local mult = 10^(decimalPlaces or 0)
	return math.floor(n * mult + 0.5) / mult
end