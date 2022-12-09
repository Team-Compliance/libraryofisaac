--##POST_PRESSURE_PLATE_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PRESSURE_PLATE_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnPressurePlateUpdate(_, gridEntity)
    local pressurePlate = gridEntity:ToPressurePlate()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PRESSURE_PLATE_UPDATE, pressurePlate)
end
TSIL.__AddInternalCallback(
    "PRESSURE_PLATE_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnPressurePlateUpdate,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_PRESSURE_PLATE
)