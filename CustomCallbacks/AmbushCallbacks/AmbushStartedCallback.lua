--##POST_AMBUSH_STARTED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_AMBUSH_STARTED,
    TSIL.Enums.CallbackReturnMode.NONE,
    function (functionParams, optionalParams)
        local ambushType = functionParams[1]
        local targetAmbushType = optionalParams[1]

        return TSIL.__IsDefaultParam(targetAmbushType) or ambushType == targetAmbushType
    end
)

local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "ambushActive_AMBUSH_STARTED_CALLBACK", false, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCustomCallback(
    "AMBUSH_STARTED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad,
    TSIL.Enums.CallbackPriority.MEDIUM
)


local function OnUpdate()
    local wasAmbushActive = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "ambushActive_AMBUSH_STARTED_CALLBACK")

    if wasAmbushActive then return end

    local room = Game():GetRoom()
    local ambushActive = room:IsAmbushActive()
    if not ambushActive then
        return
    end

    TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "ambushActive_AMBUSH_STARTED_CALLBACK", true)

    local ambushType = TSIL.Ambush.GetAmbushType()
    if ambushType ~= nil then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_AMBUSH_STARTED, ambushType)
    end
end
TSIL.__AddInternalVanillaCallback(
    "AMBUSH_STARTED_CALLBACK_ON_UPDATE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate,
    TSIL.Enums.CallbackPriority.MEDIUM
)