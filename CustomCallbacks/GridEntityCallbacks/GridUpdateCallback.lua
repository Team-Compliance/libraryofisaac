local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

local function OnFrameUpdate()
    local room = Game():GetRoom()

    local tableUtils = TSIL.Utils.Tables

    local GridUpdateCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_GRID_ENTITY_UPDATE
    end)

    for i = 0, room:GetGridSize() - 1, 1 do
        local gridEntity = room:GetGridEntity(i)

        if gridEntity then
            tableUtils.ForEach(GridUpdateCallbacks, function (_, customCallback)
                local targetGridEntityType = customCallback.params[1]

                if targetGridEntityType == nil or targetGridEntityType == gridEntity:GetType() then
                    customCallback.funct(customCallback.mod, gridEntity)
                end
            end)
        end
    end
end

TSIL.CALLBACKS["GRID_UPDATE_CALLBACK_POST_UPDATE"] =
{callback = ModCallbacks.MC_POST_UPDATE, funct = OnFrameUpdate}