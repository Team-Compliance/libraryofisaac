--- Checks if an entity is colliding with a grid entity.
--- If it does, returns the first grid entity it's colliding with, else returns nil.
---@param entity Entity
---@return GridEntity?
function TSIL.Entities.IsCollidingWithGrid(entity)
	local room = Game():GetRoom()

	for x = -1, 1, 1 do
		for y = -1, 1, 1 do
			if x~= 0 or y~=0 then
				local gridPosition = entity.Position + Vector(x*40, y*40)
				local gridEntity = room:GetGridEntityFromPos(gridPosition)

				if gridEntity and
				TSIL.Entities.CanCollideWithGridEntity(entity, gridEntity) and
				TSIL.Utils.Math.IsCircleIntersectingWithRectangle(gridEntity.Position, Vector(40, 40), entity.Position, entity.Size) then
					return gridEntity
				end
			end
		end
	end

	return nil
end