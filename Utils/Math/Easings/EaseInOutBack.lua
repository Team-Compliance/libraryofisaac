---Check https://easings.net/#easeInOutBack
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutBack(x)
    local c1 = 1.70158
    local c2 = c1 + 1.525

    if x < 0.5 then
        return ((2 * x)^2 * ((c2 + 1) * 2 * x - c2)) / 2
    else
        return ((2 * x - 2)^2 * ((c2 + 1) * (x * 2 - 2) + c2) + 2) / 2
    end
end