---Check https://easings.net/#easeInElastic
---@param x number
---@return number
function TSIL.Utils.Math.EaseInElastic(x)
    local c4 = (2 * math.pi) / 3

    if x == 0 or x == 1 then
        return x
    else
        return -2^(10 * x - 10) * math.sin((x * 10 - 10.75) * c4)
    end
end