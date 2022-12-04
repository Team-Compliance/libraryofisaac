--##use CustomCallbacks/ReorderedCallbacks/PlayerReorderedLogic.lua
--##POST_PEFFECT_UPDATE_REORDERED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    TSIL.Enums.CallbackReturnMode.NONE,
    function (functionParams, optionalParams)
        ---@type EntityPlayer
        local player = functionParams[1]

        local targetPlayerType = optionalParams[1]
        local targetPlayerVariant = optionalParams[2]

        return (TSIL.__IsDefaultParam(targetPlayerType) or player:GetPlayerType() == targetPlayerType) or
        (TSIL.__IsDefaultParam(targetPlayerVariant) or player.Variant == targetPlayerVariant)
    end
)