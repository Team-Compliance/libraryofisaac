--##POST_NPC_INIT_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_INIT_FILTER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnNPCInit(_, entity)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NPC_INIT_FILTER, entity)
end
TSIL.__AddInternalCallback(
    "NPC_INIT_FILTER_CALLBACK_NPC_INIT",
    ModCallbacks.MC_POST_NPC_INIT,
    OnNPCInit
)