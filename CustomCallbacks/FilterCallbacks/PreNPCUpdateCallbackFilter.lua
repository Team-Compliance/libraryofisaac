--##PRE_NPC_UPDATE_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_NPC_UPDATE_FILTER,
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


local function PreNPCUpdate(_, entity)
    local returned = TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_NPC_UPDATE_FILTER, entity)
    return returned
end
TSIL.__AddInternalVanillaCallback(
    "PRE_NPC_UPDATE_FILTER_CALLBACK_PRE_NPC_UPDATE",
    ModCallbacks.MC_PRE_NPC_UPDATE,
    PreNPCUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)