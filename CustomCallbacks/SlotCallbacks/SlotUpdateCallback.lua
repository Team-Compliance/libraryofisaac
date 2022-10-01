local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

local function OnFrameUpdate()
    local tableUtils = TSIL.Utils.Tables

    local SlotUpdateCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_SLOT_UPDATE
    end)

    if not SlotUpdateCallbacks then return end

    local slots = Isaac.FindByType(EntityType.ENTITY_SLOT)

    tableUtils.ForEach(slots, function(_, slot)
        local filteredCallbacks = tableUtils.Filter(SlotUpdateCallbacks.Functions, function(_, customCallback)
            local slotVariant = customCallback.OptionalParam[1]
            return not slotVariant or slot.Variant == slotVariant
        end)

        tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
            customCallback.Funct(customCallback.Mod, slot)
        end)
    end)
end
TSIL.__AddInternalVanillaCallback(
    "SLOT_UPDATE_CALLBACK_POST_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnFrameUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)