--##POST_POOP_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_POOP_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnPoopRender(_, gridEntity)
    local poop = gridEntity:ToPoop()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_POOP_RENDER, poop)
end
TSIL.__AddInternalCallback(
    "POOP_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
    OnPoopRender,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_POOP
)