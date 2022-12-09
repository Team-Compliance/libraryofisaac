--##POST_TNT_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_TNT_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnTNTUpdate(_, gridEntity)
    local TNT = gridEntity:ToTNT()

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_TNT_UPDATE, TNT)
end
TSIL.__AddInternalCallback(
    "TNT_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnTNTUpdate,
    CallbackPriority.DEFAULT,
    GridEntityType.GRID_TNT
)