--##POST_NPC_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "npcStatesLastFrame_NPC_STATE_CHANGE_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "NPC_STATE_CHANGED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param npc EntityNPC
local function OnNPCUpdate(_, npc)
    local npcPtr = GetPtrHash(npc)
    local npcPtrStr = tostring(npcPtr)

    local npcStatesLastFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "npcStatesLastFrame_NPC_STATE_CHANGE_CALLBACK")

    local npcStateLastFrame = npcStatesLastFrame[npcPtrStr]
    local npcStateCurrentFrame = npc.State

    if npcStateLastFrame ~= nil and
    npcStateLastFrame ~= npcStateCurrentFrame then
        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_NPC_STATE_CHANGED,
            npc,
            npcStateLastFrame,
            npcStateCurrentFrame
        )
    end

    npcStatesLastFrame[npcPtrStr] = npcStateCurrentFrame
end
TSIL.__AddInternalCallback(
    "NPC_STATE_CHANGED_CALLBACK_ON_NPC_UPDATE",
    ModCallbacks.MC_NPC_UPDATE,
    OnNPCUpdate
)