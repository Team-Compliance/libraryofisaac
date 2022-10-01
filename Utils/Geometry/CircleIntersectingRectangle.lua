---Returns whether a given rectangle is intersecting a given circle
---@param RectPos any
---@param RectSize any
---@param CirclePos any
---@param CircleSize any
function TSIL.Utils.Geometry.IsCircleIntersectingWithRectangle(RectPos, RectSize, CirclePos, CircleSize)
    -- local isIntersecting

    -- local circleDistanceX = math.abs(player.Position.X - gridEntity.Position.X)
    -- local circleDistanceY = math.abs(player.Position.Y - gridEntity.Position.Y)

    -- if circleDistanceX > 20 + player.Size + 0.1 or
    -- circleDistanceY > 20 + player.Size + 0.1  then
    --     isIntersecting = false
    -- elseif circleDistanceX <= 20 or circleDistanceY <= 20 then
    --     isIntersecting = true
    -- else
    --     local cornerDistanceSq = (circleDistanceX - 20)^2 + (circleDistanceY - 20)^2
    --     isIntersecting = cornerDistanceSq <= (player.Size + 0.1)^2
    -- end
end