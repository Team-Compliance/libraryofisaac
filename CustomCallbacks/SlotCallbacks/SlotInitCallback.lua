local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

local function OnSlotUpdate(_, slot)
    if slot.FrameCount ~= 1 then return end

    local tableUtils = TSIL.Utils.Tables

    local SlotInitCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_SLOT_INIT
    end)

    if not SlotInitCallbacks then return end

    local filteredCallbacks = tableUtils.Filter(SlotInitCallbacks.Functions, function(_, customCallback)
        local slotVariant = customCallback.OptionalParam[1]
        return not slotVariant or slot.Variant == slotVariant
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.Funct(customCallback.Mod, slot)
    end)
end
TSIL.__AddInternalCustomCallback(
    "SLOT_INIT_CALLBACK_SLOT_UPDATE",
    TSIL.Enums.CustomCallback.MC_POST_SLOT_UPDATE,
    OnSlotUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)