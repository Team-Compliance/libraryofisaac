--##POST_NPC_DEATH_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_DEATH_FILTER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnNPCDeath(_, entity)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NPC_DEATH_FILTER, entity)
end
TSIL.__AddInternalCallback(
    "NPC_DEATH_FILTER_CALLBACK_NPC_DEATH",
    ModCallbacks.MC_POST_NPC_DEATH,
    OnNPCDeath
)