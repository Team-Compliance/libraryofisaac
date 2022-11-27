--##POST_GRID_COLLISION

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_COLLISION,
	function (functionParams, optionalParams)
		---@type GridEntity
		local gridEntity = functionParams[1]
		---@type Entity
		local entity = functionParams[2]

		local targetGridType = optionalParams[1]
		local targetGridVariant = optionalParams[2]
		local targetEntityType = optionalParams[3]
		local targetEntityVariant = optionalParams[4]

		return (TSIL.__IsDefaultParam(targetGridType) or gridEntity:GetType() == targetGridType) and
		(TSIL.__IsDefaultParam(targetGridVariant) or gridEntity:GetVariant() == targetGridVariant) and
		(TSIL.__IsDefaultParam(targetEntityType) or entity.Type == targetEntityType) and
		(TSIL.__IsDefaultParam(targetEntityVariant) or entity.Variant == targetEntityVariant)
	end
)


--- @param grid GridEntity
local function OnGridUpdate(_, grid)
	local closeEntities = Isaac.FindInRadius(grid.Position, 120)

	local filteredEntities = TSIL.Utils.Tables.Filter(closeEntities, function (_, entity)
		return TSIL.Utils.Math.IsCircleIntersectingWithRectangle(grid.Position, Vector(40, 40), entity.Position, entity.Size)
	end)

	for _, entity in ipairs(filteredEntities) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_COLLISION, grid, entity)
	end
end
TSIL.__AddInternalCustomCallback(
	"GRID_COLLISION_CALLBACK_POST_GRID_UPDATE",
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	OnGridUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)