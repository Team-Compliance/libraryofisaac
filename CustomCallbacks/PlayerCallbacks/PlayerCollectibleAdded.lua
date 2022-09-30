local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param player EntityPlayer
---@param collectibleId CollectibleType
return function (player, collectibleId)
    local tableUtils = TSIL.Utils.Tables

    local PlayerCollectibleAddedCallbacks = tableUtils.Filter(CustomCallbacksList, function (_, customCallback)
        local callbackCollectible = customCallback.params[1]
        return customCallback.callback == TSIL.Enums.CustomCallback.MC_POST_PLAYER_COLLECTIBLE_ADDED and
        (callbackCollectible == nil or callbackCollectible == collectibleId)
    end)

    tableUtils.ForEach(PlayerCollectibleAddedCallbacks, function (_, customCallback)
        customCallback.funct(customCallback.mod, player, collectibleId)
    end)
end