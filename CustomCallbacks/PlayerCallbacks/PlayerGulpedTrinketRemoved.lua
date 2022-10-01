local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param player EntityPlayer
---@param trinketId TrinketType
return function (player, trinketId)
    local tableUtils = TSIL.Utils.Tables

    local PlayerGulpedTrinketRemovedCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_PLAYER_GULPED_TRINKET_REMOVED
    end)

    if not PlayerGulpedTrinketRemovedCallbacks then return end

    local filteredCallbacks = tableUtils.Filter(PlayerGulpedTrinketRemovedCallbacks.Functions, function(_, customCallback)
        local callbackTrinket = customCallback.OptionalParam[1]
        return callbackTrinket == nil or callbackTrinket == trinketId
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.Funct(customCallback.Mod, player, trinketId)
    end)
end