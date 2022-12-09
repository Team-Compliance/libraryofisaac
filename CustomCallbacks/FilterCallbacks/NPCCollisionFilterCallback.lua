--##PRE_NPC_COLLISION_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_NPC_COLLISION_FILTER,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnNPCCollision(_, entity, collider, isLow)
    return TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_NPC_COLLISION_FILTER, entity, collider, isLow)
end
TSIL.__AddInternalCallback(
    "NPC_COLLISION_FILTER_CALLBACK_NPC_COLLISION",
    ModCallbacks.MC_PRE_NPC_COLLISION,
    OnNPCCollision
)