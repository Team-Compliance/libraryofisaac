TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_BOMB_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    function (functionParams, optionalParams)
        ---@type EntityBomb
        local bomb = functionParams[1]

        local targetVariant = optionalParams[1]
        local targetSubtype = optionalParams[2]

        return (TSIL.__IsDefaultParam(targetVariant) or bomb.Variant == targetVariant) and
        (TSIL.__IsDefaultParam(targetSubtype) or bomb.SubType == targetSubtype)
    end
)


---@param bomb EntityBomb
local function OnBombUpdate(_, bomb)
    if bomb.FrameCount == 1 then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_BOMB_INIT_LATE, bomb)
    end
end
TSIL.__AddInternalVanillaCallback(
    "BOMB_EXPLODED_CALLBACK_POST_BOMB_UPDATE",
    ModCallbacks.MC_POST_BOMB_UPDATE,
    OnBombUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)