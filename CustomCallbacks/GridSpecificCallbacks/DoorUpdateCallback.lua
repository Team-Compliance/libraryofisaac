--##POST_DOOR_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_DOOR_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnDoorUpdate(_, gridEntity)
    local door = gridEntity:ToDoor()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_DOOR_UPDATE, door)
end
TSIL.__AddInternalCallback(
    "DOOR_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnDoorUpdate,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_DOOR
)