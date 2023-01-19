--##POST_NPC_INIT_LATE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "npcsInRoom_KINFE_INIT_LATE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "NPC_INIT_LATE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param npc EntityNPC
local function OnNpcUpdate(_, npc)
    local npcsInRoom = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "npcsInRoom_KINFE_INIT_LATE_CALLBACK")
    local npcPtr = GetPtrHash(npc)

    if not TSIL.Utils.Tables.IsIn(npcsInRoom, npcPtr) then
        npcsInRoom[#npcsInRoom+1] = npcPtr
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_NPC_INIT_LATE, npc)
    end
end
TSIL.__AddInternalCallback(
    "NPC_INIT_LATE_CALLBACK_ON_NPC_UPDATE",
    ModCallbacks.MC_NPC_UPDATE,
    OnNpcUpdate
)