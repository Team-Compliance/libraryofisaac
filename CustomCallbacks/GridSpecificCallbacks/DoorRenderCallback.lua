--##POST_DOOR_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_DOOR_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnDoorRender(_, gridEntity)
    local door = gridEntity:ToDoor()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_DOOR_RENDER, door)
end
TSIL.__AddInternalCallback(
    "DOOR_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
    OnDoorRender,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_DOOR
)