--##POST_SPIKES_UPDATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_SPIKES_UPDATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnSpikesUpdate(_, gridEntity)
    local spikes = gridEntity:ToSpikes()

    if spikes ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SPIKES_UPDATE, spikes)
    end
end
TSIL.__AddInternalCallback(
    "SPIKES_UPDATE_CALLBACK_GRID_ENTITY_UPDATE",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnSpikesUpdate,
    CallbackPriority.DEFAULT
)