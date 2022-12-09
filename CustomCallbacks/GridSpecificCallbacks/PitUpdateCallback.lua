--##POST_PIT_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PIT_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnPitUpdate(_, gridEntity)
    local pit = gridEntity:ToPit()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PIT_UPDATE, pit)
end
TSIL.__AddInternalCallback(
    "PIT_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnPitUpdate,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_PIT
)