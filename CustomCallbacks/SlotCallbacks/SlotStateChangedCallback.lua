--##POST_SLOT_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_SLOT_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param slot EntitySlot
local function OnSlotUpdate(_, slot)
    local previousState = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        slot,
        "SlotStateLastFrame_SLOT_STATE_CHANGED_CALLBACK"
    )
    local currentState = slot:GetState()
    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        slot,
        "SlotStateLastFrame_SLOT_STATE_CHANGED_CALLBACK",
        currentState
    )

    if previousState == nil or previousState == currentState then
        return
    end

    TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_STATE_CHANGED, slot, previousState, currentState)
end
TSIL.__AddInternalCallback(
    "SlotUpdate_SLOT_STATE_CHANGED_CALLBACK",
    ModCallbacks.MC_POST_SLOT_UPDATE,
    OnSlotUpdate
)