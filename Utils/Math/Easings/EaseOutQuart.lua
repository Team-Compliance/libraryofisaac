---Check https://easings.net/#easeOutQuart
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutQuart(x)
    return 1 - (1 - x)^4
end