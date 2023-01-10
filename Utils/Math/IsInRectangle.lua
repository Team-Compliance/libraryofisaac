---Helper function to check if a point is inside a rectangle.
---
---Also works with rotated rectangles.
---@param pos Vector
---@param topLeft Vector
---@param topRight Vector
---@param bottomRight Vector
---@return boolean
function TSIL.Utils.Math.IsInRectangle(pos, topLeft, topRight, bottomRight)
    local AM = pos - topRight
    local AB = bottomRight - topRight
    local AD = topLeft - topRight

    local AMpAB = TSIL.Utils.Math.ScalarProduct(AM, AB)
    local ABpAB = TSIL.Utils.Math.ScalarProduct(AB, AB)
    local AMpAD = TSIL.Utils.Math.ScalarProduct(AM, AD)
    local ADpAD = TSIL.Utils.Math.ScalarProduct(AD, AD)

    return 0 < AMpAB and AMpAB < ABpAB and 0 < AMpAD and AMpAD < ADpAD
end