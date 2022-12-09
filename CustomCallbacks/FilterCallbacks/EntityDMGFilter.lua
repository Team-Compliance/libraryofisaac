--##ENTITY_TAKE_DMG_FILTER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.ENTITY_TAKE_DMG_FILTER,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnEntityDamage(_, entity, amount, flags, source, countdown)
    return TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.ENTITY_TAKE_DMG_FILTER, entity, amount, flags, source, countdown)
end
TSIL.__AddInternalCallback(
    "ENTITY_DMG_FILTER_CALLBACK_ENTITY_DMG",
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    OnEntityDamage
)