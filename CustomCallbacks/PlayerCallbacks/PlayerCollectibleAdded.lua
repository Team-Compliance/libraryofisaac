local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param player EntityPlayer
---@param collectibleId CollectibleType
return function (player, collectibleId)
    local tableUtils = TSIL.Utils.Tables

    local PlayerCollectibleAddedCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
        return CustomCallback.Callback == TSIL.Enums.CustomCallback.MC_POST_PLAYER_COLLECTIBLE_ADDED
    end)

    if not PlayerCollectibleAddedCallbacks then return end

    local filteredCallbacks = tableUtils.Filter(PlayerCollectibleAddedCallbacks.Functions, function(_, customCallback)
        local callbackCollectible = customCallback.OptionalParam[1]
        return callbackCollectible == nil or callbackCollectible == collectibleId
    end)

    tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
        customCallback.Funct(customCallback.Mod, player, collectibleId)
    end)
end