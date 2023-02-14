--- Returns a direction corresponding to the direction the provided vector is pointing.
---@param vector Vector
---@return Direction
function TSIL.Vector.VectorToDirection(vector)
	local angle = vector:GetAngleDegrees()
	return TSIL.Direction.AngleToDirection(angle)
end
