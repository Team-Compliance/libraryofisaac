--##POST_AMBUSH_FINISHED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_AMBUSH_FINISHED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)

local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "ambushDone_AMBUSH_FINISHED_CALLBACK", false, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "AMBUSH_FINISHED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


local function OnUpdate()
    local wasAmbushDone = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "ambushDone_AMBUSH_FINISHED_CALLBACK")

    if wasAmbushDone then return end

    local room = Game():GetRoom()
    local ambushDone = room:IsAmbushDone()
    if not ambushDone then
        return
    end

    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "ambushDone_AMBUSH_FINISHED_CALLBACK", true)

    local ambushType = TSIL.Ambush.GetAmbushType();
    if ambushType ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_AMBUSH_FINISHED, ambushType)
    end
end
TSIL.__AddInternalCallback(
    "AMBUSH_FINISHED_CALLBACK_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)