local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param player EntityPlayer
---@param collectibleId CollectibleType
return function (player, collectibleId)
    local tableUtils = TSIL.Utils.Tables

    local PlayerCollectibleRemovedCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_PLAYER_COLLECTIBLE_REMOVED
    end)

    if not PlayerCollectibleRemovedCallbacks then return end

    local filteredCallbacks = tableUtils.Filter(PlayerCollectibleRemovedCallbacks.Functions, function(_, customCallback)
        local callbackCollectible = customCallback.OptionalParam[1]
        return callbackCollectible == nil or callbackCollectible == collectibleId
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.Funct(customCallback.Mod, player, collectibleId)
    end)
end