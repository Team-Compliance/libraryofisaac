---Check https://easings.net/#easeInOutQuart
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutQuart(x)
    if x < 0.5 then
        return 8 * x * x * x * x
    else
        return 1 - (-2 * x + 2)^4 / 2
    end
end