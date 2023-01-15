--##POST_FAMILIAR_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_FAMILIAR_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "familiarsInRoom_FAMILIAR_INIT_LATE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "FAMILIAR_INIT_LATE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param familiar EntityFamiliar
local function OnFamiliarUpdate(_, familiar)
    local familiarsInRoom = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "familiarsInRoom_FAMILIAR_INIT_LATE_CALLBACK")
    local familiarPtr = GetPtrHash(familiar)

    if not TSIL.Utils.Tables.IsIn(familiarsInRoom, familiarPtr) then
        familiarsInRoom[#familiarsInRoom+1] = familiarPtr
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_FAMILIAR_INIT_LATE, familiar)
    end
end
TSIL.__AddInternalCallback(
    "FAMILIAR_INIT_LATE_CALLBACK_ON_FAMILIAR_UPDATE",
    ModCallbacks.MC_FAMILIAR_UPDATE,
    OnFamiliarUpdate
)