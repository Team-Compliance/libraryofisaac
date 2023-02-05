---Helper function to see if two vectors are equal within the given tolerance `epsilon`.
---@param v1 Vector
---@param v2 Vector
---@param epsilon number? @Default: 0.001 | The tolerance to use when comparing the vectors.
---@return boolean
function TSIL.Vector.VectorFuzzyEquals(v1, v2, epsilon)
    epsilon = epsilon or 1e-3
    return math.abs(v1.X - v2.X) < epsilon and math.abs(v1.Y - v2.Y) < epsilon
end