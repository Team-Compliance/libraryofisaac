--- Returns all the entities that are colliding with a given grid entity.
--- 
--- Note that this function won't work in the `POST_NEW_ROOM` callback, since
--- entities don't have collision yet.
---@param gridEntity GridEntity
---@return Entity[]
function TSIL.GridEntities.GetCollidingEntitiesWithGridEntity(gridEntity)
	local closeEntities = Isaac.FindInRadius(gridEntity.Position, 80)

	return TSIL.Utils.Tables.Filter(closeEntities, function (_, entity)
		return entity:CollidesWithGrid()
		and TSIL.Entities.CanCollideWithGridEntity(entity, gridEntity)
		and TSIL.Utils.Math.IsCircleIntersectingWithRectangle(
			gridEntity.Position,
			Vector(20, 20),
			entity.Position,
			entity.Size + 0.1
		)
	end)
end