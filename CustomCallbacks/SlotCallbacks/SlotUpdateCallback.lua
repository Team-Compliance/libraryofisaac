local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

local function OnFrameUpdate()
    local tableUtils = TSIL.Utils.Tables

    local SlotUpdateCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_SLOT_UPDATE
    end)

    local slots = Isaac.FindByType(EntityType.ENTITY_SLOT)

    tableUtils.ForEach(slots, function(_, slot)
        local filteredCallbacks = tableUtils.Filter(SlotUpdateCallbacks, function(_, customCallback)
            local slotVariant = customCallback.params[1]
            return not slotVariant or slot.Variant == slotVariant
        end)

        tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
            customCallback.funct(customCallback.mod, slot)
        end)
    end)
end
TSIL.CALLBACKS["SLOT_UPDATE_CALLBACK_POST_UPDATE"] =
{callback = ModCallbacks.MC_POST_UPDATE, funct = OnFrameUpdate}