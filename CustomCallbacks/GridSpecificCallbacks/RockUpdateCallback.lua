--##POST_ROCK_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_ROCK_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)


---@param gridEntity GridEntity
local function OnRockUpdate(_, gridEntity)
    local rock = gridEntity:ToRock()

    if rock ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_ROCK_UPDATE, rock)
    end
end
TSIL.__AddInternalCallback(
    "ROCK_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnRockUpdate,
    CallbackPriority.DEFAULT
)