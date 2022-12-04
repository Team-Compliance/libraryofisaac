--##PRE_NPC_COLLISION_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_NPC_COLLISION_FILTER,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    function (functionParams, optionalParams)
        ---@type Entity
        local entity = functionParams[1]

        local targetType = optionalParams[1]
        local targetVariant = optionalParams[2]
        local targetSubtype = optionalParams[3]

        return (TSIL.__IsDefaultParam(targetType) or entity.Type == targetType) and
        (TSIL.__IsDefaultParam(targetVariant) or entity.Variant == targetVariant) and
        (TSIL.__IsDefaultParam(targetSubtype) or entity.SubType == targetSubtype)
    end
)


local function OnNPCCollision(_, entity, collider, isLow)
    return TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_NPC_COLLISION_FILTER, entity, collider, isLow)
end
TSIL.__AddInternalVanillaCallback(
    "NPC_COLLISION_FILTER_CALLBACK_NPC_COLLISION",
    ModCallbacks.MC_PRE_NPC_COLLISION,
    OnNPCCollision,
    TSIL.Enums.CallbackPriority.MEDIUM
)