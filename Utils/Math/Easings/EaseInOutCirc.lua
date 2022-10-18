---Check https://easings.net/#easeInOutCirc
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutCirc(x)
    if x < 0.5 then
        return (1 - math.sqrt(1 - (2*x)^2)) / 2
    else
        return math.sqrt(1 - (-2 * x + 2)^2 + 1) / 2
    end
end