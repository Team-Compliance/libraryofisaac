---Check https://easings.net/#easeOutBounce
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutBounce(x)
    local n1 = 7.5625
    local d1 = 2.75

    if x < 1 / d1 then
        return n1 * x * x
    elseif x < 2/d1 then
        x = x - 1.5 / d1
        return n1 * x * x + 0.75
    elseif x < 2.5/d1 then
        x = x - 2.25 / d1
        return n1 * x * x + 0.9375
    else
        x = x - 2.625 / d1
        return n1 * x * x + 0.984375
    end
end