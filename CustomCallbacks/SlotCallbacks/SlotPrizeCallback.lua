local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

function OnSlotUpdate(_, slot)
    local slotSpr = slot:GetSprite()

    if not slotSpr:IsEventTriggered("Prize") and not slotSpr:IsEventTriggered("Disappear") then return end

    local tableUtils = TSIL.Utils.Tables

    local SlotPrizeCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_SLOT_PRIZE
    end)

    local filteredCallbacks = tableUtils.Filter(SlotPrizeCallbacks, function(_, customCallback)
        local slotVariant = customCallback.params[1]
        return not slotVariant or slot.Variant == slotVariant
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.funct(customCallback.mod, slot, slotSpr:IsEventTriggered("Disappear"))
    end)
end
TSIL.CUSTOM_CALLBACKS["SLOT_PRIZE_CALLBACK_SLOT_UPDATE"] =
{callback = TSIL.Enums.CustomCallback.MC_POST_SLOT_UPDATE, funct = OnSlotUpdate}