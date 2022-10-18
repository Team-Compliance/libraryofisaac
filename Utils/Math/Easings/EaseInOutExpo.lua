---Check https://easings.net/#easeInOutExpo
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutExpo(x)
    if x == 0 or x == 1 then
        return x
    elseif x < 0.5 then
        return 2^(20 * x - 10) / 2
    else
        return 2 - 2^(-20 * x + 10) / 2
    end
end