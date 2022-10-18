---Check https://easings.net/#easeInOutSine
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutSine(x)
    return -(math.cos(math.pi * x) - 1) / 2
end