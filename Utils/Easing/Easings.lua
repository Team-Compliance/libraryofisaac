--- Check https://easings.net/#easeInSine
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInSine(x)
	return 1 - math.cos((x * math.pi) / 2);
end


--- Check https://easings.net/#easeOutSine
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutSine(x)
	return math.sin((x * math.pi) / 2);
end


--- Check https://easings.net/#easeInOutSine
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutSine(x)
	return -(math.cos(math.pi * x) - 1) / 2
end


--- Check https://easings.net/#easeInQuad
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInQuad(x)
	return x * x
end


--- Check https://easings.net/#easeOutQuad
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutQuad(x)
	return 1 - (1 - x) * (1 - x)
end


--- Check https://easings.net/#easeInOutQuad
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutQuad(x)
	if x < 0.5 then
		return 2 * x * x
	else
		return 1 - (-2 * x + 2)^2 / 2
	end
end


--- Check https://easings.net/#easeInCubic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInCubic(x)
	return x * x * x
end


--- Check https://easings.net/#easeOutCubic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutCubic(x)
	return 1 - (1 - x) ^ 3
end


--- Check https://easings.net/#easeInOutCubic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutCubic(x)
	if x < 0.5 then
		return 4 * x * x * x
	else
		return 1 - (-2 * x + 2)^3 / 2
	end
end


--- Check https://easings.net/#easeInQuart
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInQuart(x)
	return x * x * x * x
end


--- Check https://easings.net/#easeOutQuart
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutQuart(x)
	return 1 - (1 - x)^4
end


--- Check https://easings.net/#easeInOutQuart
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutQuart(x)
	if x < 0.5 then
		return 8 * x * x * x * x
	else
		return 1 - (-2 * x + 2)^4 / 2
	end
end


--- Check https://easings.net/#easeInQuint
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInQuint(x)
	return x * x * x * x * x
end


--- Check https://easings.net/#easeOutQuint
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutQuint(x)
	return 1 - (1 - x)^5
end


--- Check https://easings.net/#easeInOutQuint
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutQuint(x)
	if x < 0.5 then
		return 16 * x * x * x * x * x
	else
		return 1 - (-2 * x + 2)^5 / 2
	end
end


--- Check https://easings.net/#easeInExpo
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInExpo(x)
	if x == 0 then
		return 0
	else
		return 2^(10 * x - 10)
	end
end


--- Check https://easings.net/#easeOutExpo
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutExpo(x)
	if x == 1 then
		return 1
	else
		return 1 - 2^(-10 * x)
	end
end


--- Check https://easings.net/#easeInOutExpo
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutExpo(x)
	if x == 0 or x == 1 then
		return x
	elseif x < 0.5 then
		return 2^(20 * x - 10) / 2
	else
		return 2 - 2^(-20 * x + 10) / 2
	end
end


--- Check https://easings.net/#easeInCirc
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInCirc(x)
	return 1 - math.sqrt(1 - x^2)
end


--- Check https://easings.net/#easeOutCirc
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutCirc(x)
	return math.sqrt(1 - (x - 1)^2)
end


--- Check https://easings.net/#easeInOutCirc
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutCirc(x)
	if x < 0.5 then
		return (1 - math.sqrt(1 - (2*x)^2)) / 2
	else
		return math.sqrt(1 - (-2 * x + 2)^2 + 1) / 2
	end
end


--- Check https://easings.net/#easeInBack
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInBack(x)
	local c1 = 1.70158
	local c3 = c1 + 1

	return c3 * x * x * x - c1 * x * x
end


--- Check https://easings.net/#easeOutBack
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutBack(x)
	local c1 = 1.70158
	local c3 = c1 + 1

	return 1 + c3 * (x - 1)^3 + c1 * (x - 1)^2
end


--- Check https://easings.net/#easeInOutBack
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutBack(x)
	local c1 = 1.70158
	local c2 = c1 + 1.525

	if x < 0.5 then
		return ((2 * x)^2 * ((c2 + 1) * 2 * x - c2)) / 2
	else
		return ((2 * x - 2)^2 * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2
	end
end


--- Check https://easings.net/#easeInElastic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInElastic(x)
	local c4 = (2 * math.pi) / 3

	if x == 0 or x == 1 then
		return x
	else
		return -2^(10 * x - 10) * math.sin((x * 10 - 10.75) * c4)
	end
end


--- Check https://easings.net/#easeOutElastic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutElastic(x)
	local c4 = (2 * math.pi) / 3

	if x == 0 or x == 1 then
		return x
	else
		return 2^(-10 * x) * math.sin((x * 10 - 0.75) * c4) + 1
	end
end


--- Check https://easings.net/#easeInOutElastic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutElastic(x)
	local c5 = (2 * math.pi) / 4.5

	if x == 0 or x == 1 then
		return x
	elseif x < 0.5 then
		return -(2^(20 * x - 10) * math.sin((20 * x - 11.125) * c5)) / 2
	else
		return (2^(-20 * x + 10) * math.sin((20 * x - 11.125) * c5)) / 2 + 1
	end
end


--- Check https://easings.net/#easeInBounce
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInBounce(x)
	return 1 - TSIL.Utils.Easings.EaseOutBounce(1 - x);
end


--- Check https://easings.net/#easeOutBounce
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutBounce(x)
	local n1 = 7.5625
	local d1 = 2.75

	if x < 1 / d1 then
		return n1 * x * x
	elseif x < 2/d1 then
		x = x - 1.5 / d1
		return n1 * x * x + 0.75
	elseif x < 2.5/d1 then
		x = x - 2.25 / d1
		return n1 * x * x + 0.9375
	else
		x = x - 2.625 / d1
		return n1 * x * x + 0.984375
	end
end


--- Check https://easings.net/#easeInOutBounce
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutBounce(x)
	if x < 0.5 then
		return (1 - TSIL.Utils.Easings.EaseOutBounce(1 - 2 * x)) / 2
	else
		return (1 + TSIL.Utils.Easings.EaseOutBounce(2 * x - 1)) / 2
	end
end