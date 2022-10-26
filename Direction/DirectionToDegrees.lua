local DIRECTION_TO_ANGLE = {
    [Direction.NO_DIRECTION] = 0,
    [Direction.LEFT] = 180,
    [Direction.UP] = 270,
    [Direction.RIGHT] = 0,
    [Direction.DOWN] = 90,
}

--- Helper function to get the corresponding angle degrees from a `Direction` enum.
---@param direction Direction
---@return integer
function TSIL.Direction.DirectionToDegrees(direction)
    return DIRECTION_TO_ANGLE[direction]
end
