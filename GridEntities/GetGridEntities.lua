--- Returns a list with all grid entities in the room.
---@param ... GridEntityType
---@return GridEntity[]
function TSIL.GridEntities.GetGridEntities(...)
	local gridEntityTypes = {...}

	---@type GridEntity[]
	local gridEntities = {}

	local room = Game():GetRoom()

	for i = 0, room:GetGridSize() - 1, 1 do
		local gridEntity = room:GetGridEntity(i)

		gridEntities[#gridEntities+1] = gridEntity
	end

	if #gridEntityTypes > 0 then
		return TSIL.Utils.Tables.Filter(gridEntities, function (_, gridEntity)
			return TSIL.Utils.Tables.IsIn(gridEntityTypes, gridEntity:GetType())
		end)
	else
		return gridEntities
	end
end


--- Returns a map with all grid entities in the room indexed by their grid index.
---@param ... GridEntityType
---@return table<integer, GridEntity>
function TSIL.GridEntities.GetGridEntitiesMap(...)
	local gridEntities = TSIL.GridEntities.GetGridEntities(...)
	---@type table<integer, GridEntity>
	local gridEntitiesMap = {}

	TSIL.Utils.Tables.ForEach(gridEntities, function (_, gridEntity)
		gridEntitiesMap[gridEntity:GetGridIndex()] = gridEntity
	end)

	return gridEntitiesMap
end