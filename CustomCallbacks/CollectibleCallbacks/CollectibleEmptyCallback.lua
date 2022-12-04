TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_COLLECTIBLE_EMPTY,
    TSIL.Enums.CallbackReturnMode.NONE,
    function (functionParams, optionalParams)
        ---@type CollectibleType
        local oldCollectibleType = functionParams[2]

        local targetCollectibleType = optionalParams[1]

        return TSIL.__IsDefaultParam(targetCollectibleType) or oldCollectibleType == targetCollectibleType
    end
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "collectibleTypeMap_COLLETIBLE_EMPTY_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCustomCallback(
    "COLLECTIBLE_EMPTY_CALLBACK_TSIL_LOADED",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad,
    TSIL.Enums.CallbackPriority.MEDIUM
)


---@param collectible EntityPickup
local function OnCollectibleUpdate(_, collectible)
    local collectibleTypeMap = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "collectibleTypeMap_COLLETIBLE_EMPTY_CALLBACK")
    local ptrHash = GetPtrHash(collectible)

    local oldCollectibleType = collectibleTypeMap[tostring(ptrHash)]

    if oldCollectibleType == nil then
        oldCollectibleType = collectible.SubType
    end

    collectibleTypeMap[tostring(ptrHash)] = collectible.SubType

    if oldCollectibleType ~= collectible.SubType and
    collectible.SubType == CollectibleType.COLLECTIBLE_NULL then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_COLLECTIBLE_EMPTY, collectible, oldCollectibleType)
    end
end
TSIL.__AddInternalVanillaCallback(
    "COLLECTIBLE_EMPTY_CALLBACK_PICKUP_COLLECTIBLE_UPDATE",
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    OnCollectibleUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM,
    PickupVariant.PICKUP_COLLECTIBLE
)