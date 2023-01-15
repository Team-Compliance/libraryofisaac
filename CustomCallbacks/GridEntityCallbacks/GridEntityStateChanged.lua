--##POST_GRID_ENTITY_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "gridEntityStates_GRID_ENTITY_STATE_CHANGED_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "GRID_ENTITY_STATE_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param gridEntity GridEntity
local function OnGridEntityUpdate(_, gridEntity)
    local gridEntityStates = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "gridEntityStates_GRID_ENTITY_STATE_CHANGED_CALLBACK"
    )
    local gridIndex = gridEntity:GetGridIndex()

    local previousState = gridEntityStates[gridIndex]
    local currentState = gridEntity.State
    gridEntityStates[gridIndex] = currentState

    if previousState == nil or previousState == currentState then
        return
    end

    TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.POST_GRID_ENTITY_STATE_CHANGED,
        gridEntity,
        previousState,
        currentState
    )
end
TSIL.__AddInternalCallback(
    "GRID_ENTITY_STATE_CHANGED_CALLBACK_ON_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnGridEntityUpdate
)