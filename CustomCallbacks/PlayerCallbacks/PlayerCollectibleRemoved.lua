local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param player EntityPlayer
---@param collectibleId CollectibleType
return function (player, collectibleId)
    local tableUtils = TSIL.Utils.Tables

    local PlayerCollectibleRemovedCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        local callbackCollectible = customCallback.params[1]
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_PLAYER_COLLECTIBLE_REMOVED and
        (callbackCollectible == nil or callbackCollectible == collectibleId)
    end)

    tableUtils.ForEach(PlayerCollectibleRemovedCallbacks, function (_, customCallback)
        customCallback.funct(customCallback.mod, player, collectibleId)
    end)
end