--##POST_PIT_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PIT_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnPitRender(_, gridEntity)
    local pit = gridEntity:ToPit()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PIT_RENDER, pit)
end
TSIL.__AddInternalCallback(
    "PIT_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
    OnPitRender,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_PIT
)