---Check https://easings.net/#easeOutCubic
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutCubic(x)
    return 1 - (1 - x) ^ 3
end