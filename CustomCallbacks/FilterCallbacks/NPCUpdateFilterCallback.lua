--##POST_NPC_UPDATE_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_UPDATE_FILTER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnNPCUpdate(_, entity)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NPC_UPDATE_FILTER, entity)
end
TSIL.__AddInternalCallback(
    "NPC_UPDATE_FILTER_CALLBACK_NPC_UPDATE",
    ModCallbacks.MC_NPC_UPDATE,
    OnNPCUpdate
)