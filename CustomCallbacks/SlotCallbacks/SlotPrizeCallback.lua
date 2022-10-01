local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

function OnSlotUpdate(_, slot)
    local slotSpr = slot:GetSprite()

    if not slotSpr:IsEventTriggered("Prize") and not slotSpr:IsEventTriggered("Disappear") then return end

    local tableUtils = TSIL.Utils.Tables

    local SlotPrizeCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_SLOT_PRIZE
    end)

    if not SlotPrizeCallbacks then return end

    local filteredCallbacks = tableUtils.Filter(SlotPrizeCallbacks.Functions, function(_, customCallback)
        local slotVariant = customCallback.OptionalParam[1]
        return not slotVariant or slot.Variant == slotVariant
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.Funct(customCallback.Mod, slot, slotSpr:IsEventTriggered("Disappear"))
    end)
end
TSIL.__AddInternalCustomCallback(
    "SLOT_PRIZE_CALLBACK_SLOT_UPDATE",
    TSIL.Enums.CustomCallback.MC_POST_SLOT_UPDATE,
    OnSlotUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)