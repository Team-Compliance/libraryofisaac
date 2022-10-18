---Check https://easings.net/#easeInOutBounce
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutBounce(x)
    if x < 0.5 then
        return (1 - TSIL.Utils.Math.EaseOutBounce(1 - 2 * x)) / 2
    else
        return (1 + TSIL.Utils.Math.EaseOutBounce(2 * x - 1)) / 2
    end
end