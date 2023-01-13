--##POST_KNIFE_INIT_LATE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_KNIFE_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "knifesInRoom_KINFE_INIT_LATE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "KNIFE_INIT_LATE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param knife EntityKnife
local function OnKnifeUpdate(_, knife)
    local knifesInRoom = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "knifesInRoom_KINFE_INIT_LATE_CALLBACK")
    local knifePtr = GetPtrHash(knife)

    if not TSIL.Utils.Tables.IsIn(knifesInRoom, knifePtr) then
        knifesInRoom[#knifesInRoom+1] = knifePtr
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_KNIFE_INIT_LATE, knife)
    end
end
TSIL.__AddInternalCallback(
    "KNIFE_INIT_LATE_CALLBACK_ON_KNIFE_UPDATE",
    ModCallbacks.MC_POST_KNIFE_UPDATE,
    OnKnifeUpdate
)