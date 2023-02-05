---Helper function to see if a vector has a length greater than zero within the given tolerance `epsilon`.
---@param v Vector
---@param epsilon number? @Default: 0.001 | The tolerance of how close to zero the vector can be.
---@return boolean
function TSIL.Vector.VectorHasLength(v, epsilon)
    epsilon = epsilon or 1e-3
    return v:Length() > epsilon
end