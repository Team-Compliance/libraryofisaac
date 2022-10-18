---Check https://easings.net/#easeInCirc
---@param x number
---@return number
function TSIL.Utils.Math.EaseInCirc(x)
    return 1 - math.sqrt(1 - x^2)
end