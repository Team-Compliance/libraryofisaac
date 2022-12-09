--##POST_PRESSURE_PLATE_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PRESSURE_PLATE_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnPressurePlateRender(_, gridEntity)
    local pressurePlate = gridEntity:ToPressurePlate()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PRESSURE_PLATE_RENDER, pressurePlate)
end
TSIL.__AddInternalCallback(
    "PRESSURE_PLATE_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
    OnPressurePlateRender,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_PRESSURE_PLATE
)