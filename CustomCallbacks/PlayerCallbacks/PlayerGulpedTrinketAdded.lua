local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param player EntityPlayer
---@param trinketId TrinketType
return function (player, trinketId)
    local tableUtils = TSIL.Utils.Tables

    local PlayerGulpedTrinketAddedCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        local callbackCollectible = customCallback.params[1]
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_PLAYER_GULPED_TRINKET_ADDED and
        (callbackCollectible == nil or callbackCollectible == trinketId)
    end)

    tableUtils.ForEach(PlayerGulpedTrinketAddedCallbacks, function (_, customCallback)
        customCallback.funct(customCallback.mod, player, trinketId)
    end)
end