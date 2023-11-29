--##POST_GRID_COLLISION

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_COLLISION,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


---@param grid GridEntity
local function OnGridUpdate(_, grid)
	local closeEntities = Isaac.FindInRadius(grid.Position, 120)

	local filteredEntities = TSIL.Utils.Tables.Filter(closeEntities, function (_, entity)
		return TSIL.Entities.CanCollideWithGridEntity(entity, grid) and
		TSIL.Utils.Math.IsCircleIntersectingWithRectangle(grid.Position, Vector(40, 40), entity.Position, entity.Size)
	end)

	for _, entity in ipairs(filteredEntities) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_COLLISION, grid, entity)
	end
end
TSIL.__AddInternalCallback(
	"GRID_COLLISION_CALLBACK_POST_GRID_UPDATE",
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	OnGridUpdate
)