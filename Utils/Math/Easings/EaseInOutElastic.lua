---Check https://easings.net/#easeInOutElastic
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutElastic(x)
    local c5 = (2 * math.pi) / 4.5

    if x == 0 or x == 1 then
        return x
    elseif x < 0.5 then
        return -(2^(20 * x - 10) * math.sin((20 * x - 11.125) * c5)) / 2
    else
        return (2^(-20 * x + 10) * math.sin((20 * x - 11.125) * c5)) / 2 + 1
    end
end