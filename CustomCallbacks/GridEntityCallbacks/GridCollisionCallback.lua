--##POST_GRID_COLLISION
local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList


--- @param grid GridEntity
local function OnGridUpdate(_, grid)
	local tableUtils = TSIL.Utils.Tables

	local GridCollisionCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
		return CustomCallback.Callback == TSIL.Enums.CustomCallback.POST_GRID_COLLISION
	end)

	if not GridCollisionCallbacks then return end

	local filteredByGridCallbacks = tableUtils.Filter(GridCollisionCallbacks.Functions, function(_, customCallback)
		local gridType = customCallback.OptionalParam[1]
		local gridVariant = customCallback.OptionalParam[2]
		return (not gridType or grid:GetType() == gridType) and (not gridVariant or grid:GetVariant() == gridVariant)
	end)

	if #filteredByGridCallbacks == 0 then return end

	local closeEntities = Isaac.FindInRadius(grid.Position, 120)

	local filteredEntities = tableUtils.Filter(closeEntities, function (_, entity)
		return TSIL.Utils.Math.IsCircleIntersectingWithRectangle(grid.Position, Vector(40, 40), entity.Position, entity.Size)
	end)

	tableUtils.ForEach(filteredEntities, function (_, entity)
		local filteredByEntityCallbacks = tableUtils.Filter(filteredByGridCallbacks, function(_, customCallback)
			local entityType = customCallback.OptionalParam[3]
			local entityVariant = customCallback.OptionalParam[4]
			return (not entityType or entity.Type == entityType) and (not entityVariant or entity.Variant == entityVariant)
		end)

		if #filteredByEntityCallbacks == 0 then return end

		tableUtils.ForEach(filteredByEntityCallbacks, function (_, customCallback)
			customCallback.Funct(customCallback.Mod, grid, entity)
		end)
	end)
end
TSIL.__AddInternalCustomCallback(
	"GRID_COLLISION_CALLBACK_POST_GRID_UPDATE",
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	OnGridUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)