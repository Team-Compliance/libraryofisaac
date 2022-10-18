---Check https://easings.net/#easeOutSine
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutSine(x)
    return math.sin((x * math.pi) / 2);
end