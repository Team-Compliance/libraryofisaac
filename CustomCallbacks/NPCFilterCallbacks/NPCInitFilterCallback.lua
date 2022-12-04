TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_INIT_FILTER,
    TSIL.Enums.CallbackReturnMode.NONE,
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


local function OnNPCInit(_, entity)
    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NPC_INIT_FILTER, entity)
end
TSIL.__AddInternalVanillaCallback(
    "NPC_INIT_FILTER_CALLBACK_NPC_INIT",
    ModCallbacks.MC_POST_NPC_INIT,
    OnNPCInit,
    TSIL.Enums.CallbackPriority.MEDIUM
)