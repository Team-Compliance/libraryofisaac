---Check https://easings.net/#easeOutExpo
---@param x number
---@return number
function TSIL.Utils.Math.EaseOutExpo(x)
    if x == 1 then
        return 1
    else
        return 1 - 2^(-10 * x)
    end
end