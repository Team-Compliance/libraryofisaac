---Check https://easings.net/#easeInOutQuad
---@param x number
---@return number
function TSIL.Utils.Math.EaseInOutQuad(x)
    if x < 0.5 then
        return 2 * x * x
    else
        return 1 - (-2 * x + 2)^2 / 2
    end
end