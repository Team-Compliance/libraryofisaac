--##POST_TNT_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_TNT_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnTNTRender(_, gridEntity)
    local TNT = gridEntity:ToTNT()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_TNT_RENDER, TNT)
end
TSIL.__AddInternalCallback(
    "TNT_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
    OnTNTRender,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_TNT
)