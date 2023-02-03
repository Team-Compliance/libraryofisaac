--##POST_ROOM_CLEAR_CHANGED

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_ROOM_CLEAR_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "WasRoomCleared_POST_ROOM_CLEAR_CHANGED_CALLBACK",
        nil,
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "POST_ROOM_CLEAR_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


local function OnUpdate()
    local wasRoomCleared = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "WasRoomCleared_POST_ROOM_CLEAR_CHANGED_CALLBACK")
    local isRoomClear = Game():GetRoom():IsClear()
    TSIL.SaveManager.SetPersistentVariable(
        TSIL.__MOD,
        "WasRoomCleared_POST_ROOM_CLEAR_CHANGED_CALLBACK",
        isRoomClear,
        true
    )

    if isRoomClear ~= wasRoomCleared and wasRoomCleared ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_ROOM_CLEAR_CHANGED, isRoomClear)
    end
end
TSIL.__AddInternalCallback(
    "POST_ROOM_CLEAR_CHANGED_CALLBACK_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)