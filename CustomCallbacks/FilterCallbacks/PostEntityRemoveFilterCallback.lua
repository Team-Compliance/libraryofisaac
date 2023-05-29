--##POST_NPC_UPDATE_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_ENTITY_REMOVE_FILTER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function onEntityRemove(_, entity)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_ENTITY_REMOVE_FILTER, entity)
end

TSIL.__AddInternalCallback(
    "ENTITY_REMOVE_FILTER_CALLBACK_ENTITY_REMOVE",
    ModCallbacks.MC_POST_ENTITY_REMOVE,
    onEntityRemove
)
