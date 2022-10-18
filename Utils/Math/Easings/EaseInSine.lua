---Check https://easings.net/#easeInSine
---@param x number
---@return number
function TSIL.Utils.Math.EaseInSine(x)
    return 1 - math.cos((x * math.pi) / 2);
end