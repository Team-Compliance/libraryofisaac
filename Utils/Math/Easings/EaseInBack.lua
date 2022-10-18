---Check https://easings.net/#easeInBack
---@param x number
---@return number
function TSIL.Utils.Math.EaseInBack(x)
    local c1 = 1.70158
    local c3 = c1 + 1

    return c3 * x * x * x - c1 * x * x
end