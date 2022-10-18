---Check https://easings.net/#easeOutQuad
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutQuad(x)
    return 1 - (1 - x) * (1 - x)
end