--- Returns a list with all grid entities in the room.
---@param ... GridEntityType
---@return GridEntity[]
function TSIL.GridEntities.GetGridEntities(...)
	local gridEntityTypes = {...}
	local gridEntityTypesDict = TSIL.Utils.Tables.ConstructDictionaryFromTable(gridEntityTypes)

	---@type GridEntity[]
	local gridEntities = {}

	local room = Game():GetRoom()

	for i = 0, room:GetGridSize() - 1, 1 do
		local gridEntity = room:GetGridEntity(i)

		if #gridEntityTypes == 0 or (gridEntity and gridEntityTypesDict[gridEntity:GetType()]) then
			gridEntities[#gridEntities+1] = gridEntity
		end
	end

	return gridEntities
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