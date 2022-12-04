TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.ENTITY_TAKE_DMG_FILTER,
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


local function OnEntityDamage(_, entity, amount, flags, source, countdown)
    return TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.ENTITY_TAKE_DMG_FILTER, entity, amount, flags, source, countdown)
end
TSIL.__AddInternalVanillaCallback(
    "ENTITY_DMG_FILTER_CALLBACK_ENTITY_DMG",
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    OnEntityDamage,
    TSIL.Enums.CallbackPriority.MEDIUM
)