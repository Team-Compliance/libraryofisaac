---Check https://easings.net/#easeInExpo
---@param x number
---@return number
function TSIL.Utils.Math.EaseInExpo(x)
    if x == 0 then
        return 0
    else
        return 2^(10 * x - 10)
    end
end