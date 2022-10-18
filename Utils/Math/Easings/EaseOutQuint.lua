---Check https://easings.net/#easeOutQuint
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutQuint(x)
    return 1 - (1 - x)^5
end