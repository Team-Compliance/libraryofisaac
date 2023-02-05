--- Returns whether a given rectangle is intersecting a given circle.
---@param RectPos Vector @Center of the rectangle
---@param RectSize Vector
---@param CirclePos Vector @Center of the circle
---@param CircleSize number
---@return boolean
function TSIL.Utils.Math.IsCircleIntersectingWithRectangle(RectPos, RectSize, CirclePos, CircleSize)
	local circleDistanceX = math.abs(CirclePos.X - RectPos.X)
	local circleDistanceY = math.abs(CirclePos.Y - RectPos.Y)

	if circleDistanceX > RectSize.X/2 + CircleSize + 0.1 or
	circleDistanceY > RectSize.Y/2 + CircleSize + 0.1  then
		return false
	elseif circleDistanceX <= 20 or circleDistanceY <= 20 then
		return true
	else
		local cornerDistanceSq = (circleDistanceX - 20)^2 + (circleDistanceY - 20)^2
		return cornerDistanceSq <= (CircleSize + 0.1)^2
	end
end