---Helper function to copy a `Vector` Isaac API class.
---@param vector Vector
---@return Vector
function TSIL.Vector.CopyVector(vector)
    if not TSIL.IsaacAPIClass.IsVector(vector) then
        error("Failed to copy a Vector object since the provided object was not a userdata Vector class.")
    end

    return Vector(vector.X, vector.Y)
end