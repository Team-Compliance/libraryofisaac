--##POST_DICE_ROOM_ACTIVATED

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_DICE_ROOM_ACTIVATED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.NONE,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "DiceRoomActivated_DICE_ROOM_ACTIVATED_CALLBACK",
        false,
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "DICE_ROOM_ACTIVATED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param effect EntityEffect
local function OnDiceFloorUpdate(_, effect)
    if effect.FrameCount == 0 then return end
    if TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "DiceRoomActivated_DICE_ROOM_ACTIVATED_CALLBACK") then return end

    local closestPlayer = TSIL.Players.GetClosestPlayers(effect.Position)[1]

    if closestPlayer == nil then return end

    if TSIL.Effects.IsCloseEnoughToTriggerDiceFloor(closestPlayer, effect) then
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "DiceRoomActivated_DICE_ROOM_ACTIVATED_CALLBACK", true)

        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_DICE_ROOM_ACTIVATED,
            closestPlayer,
            effect.SubType
        )
    end
end
TSIL.__AddInternalCallback(
    "DICE_ROOM_ACTIVATED_CALLBACK_ON_DICE_FLOOR_UPDATE",
    ModCallbacks.MC_POST_EFFECT_UPDATE,
    OnDiceFloorUpdate,
    CallbackPriority.DEFAULT,
    EffectVariant.DICE_FLOOR
)