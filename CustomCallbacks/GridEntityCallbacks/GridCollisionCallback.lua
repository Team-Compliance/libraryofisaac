local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList


---@param grid GridEntity
local function OnGridUpdate(grid)
    local tableUtils = TSIL.Utils.Tables

    local GridCollisionCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_GRID_ENTITY_UPDATE
    end)

    local filteredCallbacks = tableUtils.Filter(GridCollisionCallbacks, function(_, customCallback)
        local gridType = customCallback.params[1]
        local gridVariant = customCallback.params[2]
        return (not gridType or grid:GetType() == gridType) and (not gridVariant or grid:GetType() == gridVariant)
    end)

    local closeEntities = Isaac.FindInRadius(grid.Position, 80)
end
TSIL.__AddInternalCustomCallback(
    "GRID_COLLISION_CALLBACK_POST_GRID_UPDATE",
    TSIL.Enums.CustomCallback.MC_POST_GRID_ENTITY_UPDATE,
    OnGridUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)