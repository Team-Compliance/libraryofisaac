--##POST_PICKUP_COLLECT
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PICKUP_COLLECT,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "CollectedPickups_PICKUP_COLLECT_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "PICKUP_COLLECT_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param pickup EntityPickup
local function OnPickupRender(_, pickup)
    local pickupSpr = pickup:GetSprite()

    if pickupSpr:GetAnimation() ~= "Collect" then return end

    local pickupPtr = GetPtrHash(pickup)

    local collectedPickups = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "CollectedPickups_PICKUP_COLLECT_CALLBACK")

    if TSIL.Utils.Tables.IsIn(collectedPickups, pickupPtr) then return end

    TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.POST_PICKUP_COLLECT,
        pickup
    )
    collectedPickups[#collectedPickups+1] = pickupPtr
end
TSIL.__AddInternalCallback(
    "PICKUP_COLLECT_CALLBACK_CALLBACK_ON_PICKUP_RENDER",
    ModCallbacks.MC_POST_PICKUP_RENDER,
    OnPickupRender
)