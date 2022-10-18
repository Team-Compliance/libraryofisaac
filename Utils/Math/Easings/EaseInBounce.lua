---Check https://easings.net/#easeInBounce
---@param x number
---@return number
function TSIL.Utils.Math.EaseInBounce(x)
    return 1 - TSIL.Utils.Math.EaseOutBounce(1 - x);
end