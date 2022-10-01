local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

local function OnFrameUpdate()
    local tableUtils = TSIL.Utils.Tables

    local GridUpdateCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_GRID_ENTITY_UPDATE
    end)

    if not GridUpdateCallbacks then return end

    local gridEntities = TSIL.GridEntities.GetGridEntities()

    tableUtils.ForEach(gridEntities, function(_, gridEntity)
        local filteredCallbacks = tableUtils.Filter(GridUpdateCallbacks.Functions, function(_, customCallback)
            local targetGridEntityType = customCallback.OptionalParam[1]
            local targetGridEntityVariant = customCallback.OptionalParam[2]
            return (targetGridEntityType == nil or targetGridEntityType == gridEntity:GetType()) and
            (targetGridEntityVariant == nil or targetGridEntityVariant == gridEntity:GetVariant())
        end)

        tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
            customCallback.Funct(customCallback.Mod, gridEntity)
        end)
    end)
end
TSIL.__AddInternalVanillaCallback(
    "GRID_UPDATE_CALLBACK_POST_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnFrameUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)