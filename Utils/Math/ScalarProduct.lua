---Helper function to get the scalar product of 2 vectors.
---
---The scalar product is defined as `v1.X * v2.X + v1.Y * v2.Y`
---@param v1 Vector
---@param v2 Vector
---@return number
function TSIL.Utils.Math.ScalarProduct(v1, v2)
    return v1.X * v2.X + v1.Y * v2.Y
end