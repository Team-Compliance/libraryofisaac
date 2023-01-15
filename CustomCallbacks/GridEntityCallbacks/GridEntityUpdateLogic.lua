local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "initializedGridEntities_GRID_ENTITY_UPDATE_LOGIC",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "GRID_ENTITY_UPDATE_LOGIC_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param gridEntitiesMap table<integer, GridEntity>
local function CheckGridEntitiesRemoved(gridEntitiesMap)
    local initializedGridEntities = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "initializedGridEntities_GRID_ENTITY_UPDATE_LOGIC"
    )

    for gridIndexStr, gridEntityTuple in pairs(initializedGridEntities) do
        local gridIndex = tonumber(gridIndexStr)

        local storedGridEntityType = gridEntityTuple.Type
        local storedGridEntityVariant = gridEntityTuple.Variant

        local gridEntity = gridEntitiesMap[gridIndex]

        if gridEntity == nil or gridEntity:GetType() ~= storedGridEntityType then
            initializedGridEntities[gridIndexStr] = nil

            local gridEntityTypeCustom = nil --getCustomGridEntityType(gridIndex)
            if gridEntityTypeCustom == nil then
                TSIL.__TriggerCustomCallback(
                    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_REMOVED,
                    storedGridEntityType,
                    storedGridEntityVariant,
                    gridIndex
                )
            else
                -- TSIL.__TriggerCustomCallback(
                --     TSIL.Enums.CustomCallback.POST_GRID_ENTITY_CUSTOM_REMOVED,
                --     gridEntityTypeCustom,
                --     gridIndex
                -- )
            end
        end
    end
end


---@param gridEntity GridEntity
local function UpdateTupleInMap(gridEntity)
    local gridEntityType = gridEntity:GetType()
    local variant = gridEntity:GetVariant()
    local gridIndex = gridEntity:GetGridIndex()
    local newTuple = {
        Type = gridEntityType,
        Variant = variant,
        State = gridEntity.State,
    }

    local initializedGridEntities = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "initializedGridEntities_GRID_ENTITY_UPDATE_LOGIC"
    )
    initializedGridEntities[tostring(gridIndex)] = newTuple
end


---@param gridIndex integer
---@param gridEntity GridEntity
local function CheckGridEntityStateChanged(gridIndex, gridEntity)
    local initializedGridEntities = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "initializedGridEntities_GRID_ENTITY_UPDATE_LOGIC"
    )
    local gridEntityTuple = initializedGridEntities[tostring(gridIndex)]
    if gridEntityTuple == nil then
        return
    end

    local oldState = gridEntityTuple.State
    local newState = gridEntity.State;
    if oldState ~= newState then
        UpdateTupleInMap(gridEntity);

        local gridEntityTypeCustom = nil --GetCustomGridEntityType(gridEntity);
        if gridEntityTypeCustom == nil then
            TSIL.__TriggerCustomCallback(
                TSIL.Enums.CustomCallback.POST_GRID_ENTITY_STATE_CHANGED,
                gridEntity,
                oldState,
                newState
            )
        else
            -- TSIL.__TriggerCustomCallback(
            --     TSIL.Enums.CustomCallback.POST_GRID_ENTITY_CUSTOM_STATE_CHANGED,
            --     gridEntity,
            --     gridEntityTypeCustom,
            --     oldState,
            --     newState
            -- )
        end

        if TSIL.GridEntities.IsGridEntityBroken(gridEntity) then
            if gridEntityTypeCustom == nil then
                TSIL.__TriggerCustomCallback(
                    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_BROKEN,
                    gridEntity
                )
            else
                -- TSIL.__TriggerCustomCallback(
                --     TSIL.Enums.CustomCallback.POST_GRID_ENTITY_CUSTOM_BROKEN,
                --     gridEntity
                -- )
            end
        end
    end
end


---@param gridIndex integer
---@param gridEntity GridEntity
---@param fromNewRoom boolean
local function CheckNewGridEntity(gridIndex, gridEntity, fromNewRoom)
    local initializedGridEntities = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "initializedGridEntities_GRID_ENTITY_UPDATE_LOGIC"
    )
    local gridEntityTuple = initializedGridEntities[tostring(gridIndex)]
    local gridEntityType = gridEntity:GetType()

    if gridEntityTuple == nil or gridEntityTuple.Type ~= gridEntityType then
        UpdateTupleInMap(gridEntity)

        local gridEntityTypeCustom = nil --GetCustomGridEntityType(gridEntity);
        if gridEntityTypeCustom == nil then
            TSIL.__TriggerCustomCallback(
                TSIL.Enums.CustomCallback.POST_GRID_ENTITY_INIT,
                gridEntity,
                fromNewRoom
            )
        else
            -- TSIL.__TriggerCustomCallback(
            --     TSIL.Enums.CustomCallback.POST_GRID_ENTITY_CUSTOM_INIT,
            --     gridEntity,
            --     gridEntityTypeCustom,
            --     fromNewRoom
            -- )
        end
    end
end


local function OnNewRoom()
    local gridEntitiesMap = TSIL.GridEntities.GetGridEntitiesMap()

    for gridIndex, gridEntity in pairs(gridEntitiesMap) do
        CheckNewGridEntity(gridIndex, gridEntity, false);
    end
end
TSIL.__AddInternalCallback(
    "GRID_ENTITY_UPDATE_LOGIC_ON_NEW_ROOM_REORDERED",
    TSIL.Enums.CustomCallback.POST_NEW_ROOM_REORDERED,
    OnNewRoom
)


local function OnUpdate()
    local gridEntitiesMap = TSIL.GridEntities.GetGridEntitiesMap()

    CheckGridEntitiesRemoved(gridEntitiesMap);

    for gridIndex, gridEntity in pairs(gridEntitiesMap) do
        CheckGridEntityStateChanged(gridIndex, gridEntity);
        CheckNewGridEntity(gridIndex, gridEntity, true);

        local gridEntityTypeCustom = nil --GetCustomGridEntityType(gridIndex);
        if gridEntityTypeCustom == nil then
            TSIL.__TriggerCustomCallback(
                TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
                gridEntity
            )
        else
            TSIL.__TriggerCustomCallback(
                TSIL.Enums.CustomCallback.POST_GRID_ENTITY_CUSTOM_UPDATE,
                gridEntity,
                gridEntityTypeCustom
            )
        end
    end
end
TSIL.__AddInternalCallback(
    "GRID_ENTITY_UPDATE_LOGIC_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)
