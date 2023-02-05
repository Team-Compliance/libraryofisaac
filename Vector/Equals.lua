---Helper function to check if two vectors are exactly equal.
---@param v1 Vector
---@param v2 Vector
---@return boolean
function TSIL.Vector.VectorEquals(v1, v2)
    return v1.X == v2.X and v1.Y == v1.Y
end