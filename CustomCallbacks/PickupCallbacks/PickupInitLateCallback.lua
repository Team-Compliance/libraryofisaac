--##POST_PICKUP_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PICKUP_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "pickupsFired_PICKUP_INIT_LATE_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "PICKUP_INIT_LATE_CALLBACK_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param pickup EntityPickup
local function OnPickupUpdate(_, pickup)
    local ptrHash = GetPtrHash(pickup)
    local ptrHashStr = tostring(ptrHash)

    local pickupsFired = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupsFired_PICKUP_INIT_LATE_CALLBACK")

    if not pickupsFired[ptrHashStr] then
        pickupsFired[ptrHashStr] = true
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PICKUP_INIT_LATE, pickup)
    end
end
TSIL.__AddInternalCallback(
    "PICKUP_INIT_LATE_CALLBACK_PICKUP_UPDATE",
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    OnPickupUpdate
)