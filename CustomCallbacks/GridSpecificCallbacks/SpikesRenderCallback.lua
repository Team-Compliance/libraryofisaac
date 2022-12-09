--##POST_SPIKES_RENDER
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_SPIKES_RENDER,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT
)


---@param gridEntity GridEntity
local function OnSpikesRender(_, gridEntity)
    local spikes = gridEntity:ToSpikes()

    if spikes ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SPIKES_RENDER, spikes)
    end
end
TSIL.__AddInternalCallback(
    "SPIKES_RENDER_CALLBACK_GRID_ENTITY_RENDER",
    TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
    OnSpikesRender,
    CallbackPriority.DEFAULT
)