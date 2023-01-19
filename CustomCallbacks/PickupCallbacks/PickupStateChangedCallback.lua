--##POST_PICKUP_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PICKUP_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "pickupStatesLastFrame_PICKUP_STATE_CHANGE_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "PICKUP_STATE_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param pickup EntityPickup
local function OnPickupUpdate(_, pickup)
    local pickupPtr = GetPtrHash(pickup)
    local pickupPtrStr = tostring(pickupPtr)

    local pickupStatesLastFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "pickupStatesLastFrame_PICKUP_STATE_CHANGE_CALLBACK")

    local pickupStateLastFrame = pickupStatesLastFrame[pickupPtrStr]
    local pickupStateCurrentFrame = pickup.State

    if pickupStateLastFrame ~= nil and
    pickupStateLastFrame ~= pickupStateCurrentFrame then
        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_PICKUP_STATE_CHANGED,
            pickup,
            pickupStateLastFrame,
            pickupStateCurrentFrame
        )
    end

    pickupStatesLastFrame[pickupPtrStr] = pickupStateCurrentFrame
end
TSIL.__AddInternalCallback(
    "PICKUP_STATE_CHANGED_CALLBACK_ON_PICKUP_UPDATE",
    ModCallbacks.MC_POST_PICKUP_UPDATE,
    OnPickupUpdate
)