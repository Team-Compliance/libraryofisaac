--##POST_NPC_RENDER_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_RENDER_FILTER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnNPCRender(_, entity)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NPC_RENDER_FILTER, entity)
end
TSIL.__AddInternalCallback(
    "NPC_RENDER_FILTER_CALLBACK_NPC_RENDER",
    ModCallbacks.MC_POST_NPC_RENDER,
    OnNPCRender
)