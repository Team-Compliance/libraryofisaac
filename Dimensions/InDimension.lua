--- Helper function to check if the players are in a given dimension.
---@param dimension Dimension
---@return boolean
function TSIL.Dimensions.InDimension(dimension)
    return TSIL.Dimension.GetDimension() == dimension
end