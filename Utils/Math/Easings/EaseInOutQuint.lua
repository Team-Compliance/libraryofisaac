---Check https://easings.net/#easeInOutQuint
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutQuint(x)
    if x < 0.5 then
        return 16 * x * x * x * x * x
    else
        return 1 - (-2 * x + 2)^5 / 2
    end
end