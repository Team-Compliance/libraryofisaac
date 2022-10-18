---Check https://easings.net/#easeOutCirc
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutCirc(x)
    return math.sqrt(1 - (x - 1)^2)
end