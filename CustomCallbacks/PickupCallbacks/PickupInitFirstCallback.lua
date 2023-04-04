--##POST_PICKUP_INIT_FIRST

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PICKUP_INIT_FIRST,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param pickup EntityPickup
local function OnPickupInit(_, pickup)
    local room = Game():GetRoom()
    local roomDesc = TSIL.Rooms.GetRoomDescriptor()

    local roomFrameCount = room:GetFrameCount()
    local visitedCount = roomDesc.VisitedCount

    if roomFrameCount > 0 or visitedCount == 0 then
        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_PICKUP_INIT_FIRST,
            pickup
        )
    end
end
TSIL.__AddInternalCallback(
    "PICKUP_INIT_FIRST_CALLBACK_ON_PICKUP_INIT",
    ModCallbacks.MC_POST_PICKUP_INIT,
    OnPickupInit
)