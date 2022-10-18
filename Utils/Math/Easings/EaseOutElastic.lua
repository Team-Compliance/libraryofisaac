---Check https://easings.net/#easeOutElastic
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutElastic(x)
    local c4 = (2 * math.pi) / 3

    if x == 0 or x == 1 then
        return x
    else
        return 2^(-10 * x) * math.sin((x * 10 - 0.75) * c4) + 1
    end
end