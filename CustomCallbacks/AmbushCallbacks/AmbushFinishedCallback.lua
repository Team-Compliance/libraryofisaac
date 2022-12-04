TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_AMBUSH_FINISHED,
    TSIL.Enums.CallbackReturnMode.NONE,
    function (functionParams, optionalParams)
        local ambushType = functionParams[1]
        local targetAmbushType = optionalParams[1]

        return TSIL.__IsDefaultParam(targetAmbushType) or ambushType == targetAmbushType
    end
)

local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "ambushDone_AMBUSH_FINISHED_CALLBACK", false, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCustomCallback(
    "AMBUSH_FINISHED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad,
    TSIL.Enums.CallbackPriority.MEDIUM
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
TSIL.__AddInternalVanillaCallback(
    "AMBUSH_FINISHED_CALLBACK_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)