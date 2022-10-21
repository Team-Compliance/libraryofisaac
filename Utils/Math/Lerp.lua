--- Helper function to lineally interpolate between two numbers.
--- @param a number
--- @param b number
--- @param t number
--- @return number
--- @within TSIL.Utils.Math
function TSIL.Utils.Math.Lerp(a, b, t)
	return a + (b - a) * t;
end