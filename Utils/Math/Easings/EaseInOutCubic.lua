---Check https://easings.net/#easeInOutCubic
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutCubic(x)
    if x < 0.5 then
        return 4 * x * x * x
    else
        return 1 - (-2 * x + 2)^3 / 2
    end
end