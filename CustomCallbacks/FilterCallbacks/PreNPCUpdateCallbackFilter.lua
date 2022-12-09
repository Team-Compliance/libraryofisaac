--##PRE_NPC_UPDATE_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_NPC_UPDATE_FILTER,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function PreNPCUpdate(_, entity)
    local returned = TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_NPC_UPDATE_FILTER, entity)
    return returned
end
TSIL.__AddInternalCallback(
    "PRE_NPC_UPDATE_FILTER_CALLBACK_PRE_NPC_UPDATE",
    ModCallbacks.MC_PRE_NPC_UPDATE,
    PreNPCUpdate
)