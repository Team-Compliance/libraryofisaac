--##POST_POOP_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_POOP_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnPoopUpdate(_, gridEntity)
    local poop = gridEntity:ToPoop()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_POOP_UPDATE, poop)
end
TSIL.__AddInternalCallback(
    "POOP_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnPoopUpdate,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_POOP
)