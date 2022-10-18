---Check https://easings.net/#easeOutBack
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutBack(x)
    local c1 = 1.70158
    local c3 = c1 + 1

    return 1 + c3 * (x - 1)^3 + c1 * (x - 1)^2
end