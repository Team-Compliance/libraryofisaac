--##POST_COLLECTIBLE_INIT_FIRST
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_COLLECTIBLE_INIT_FIRST,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "seenCollectibles_COLLETIBLE_INIT_FIRST_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCallback(
    "COLLECTIBLE_INIT_FIRST_CALLBACK_TSIL_LOADED",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param collectible EntityPickup
local function OnCollectibleInit(_, collectible)
    local seenCollectibles = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "seenCollectibles_COLLETIBLE_INIT_FIRST_CALLBACK")
    local collectibleIndex = TSIL.Collectibles.GetCollectibleIndex(collectible)

    if not TSIL.Utils.Tables.IsIn(seenCollectibles, collectibleIndex) then
        seenCollectibles[#seenCollectibles+1] = collectibleIndex
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_COLLECTIBLE_INIT_FIRST, collectible)
    end
end
TSIL.__AddInternalCallback(
    "COLLECTIBLE_INIT_FIRST_CALLBACK_PICKUP_COLLECTIBLE_INIT",
    ModCallbacks.MC_POST_PICKUP_INIT,
    OnCollectibleInit,
    CallbackPriority.DEFAULT,
    PickupVariant.PICKUP_COLLECTIBLE
)