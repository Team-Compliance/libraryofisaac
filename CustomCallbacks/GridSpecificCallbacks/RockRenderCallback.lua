--##POST_ROCK_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_ROCK_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)


---@param gridEntity GridEntity
local function OnRockRender(_, gridEntity)
    local rock = gridEntity:ToRock()

    if rock ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_ROCK_RENDER, rock)
    end
end
TSIL.__AddInternalCallback(
    "ROCK_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
    OnRockRender,
    CallbackPriority.DEFAULT
)