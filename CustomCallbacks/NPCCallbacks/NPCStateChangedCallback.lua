--##POST_NPC_STATE_CHANGED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_NPC_STATE_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE
)


---@param npc EntityNPC
local function OnNPCUpdate(_, npc)
    local npcStateLastFrame = TSIL.Entities.GetEntityData(
        TSIL.__MOD,
        npc,
        "NPCStateLastFrame_NPC_STATE_CHANGED_CALLBACK"
    )
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

    TSIL.Entities.SetEntityData(
        TSIL.__MOD,
        npc,
        "NPCStateLastFrame_NPC_STATE_CHANGED_CALLBACK",
        npcStateCurrentFrame
    )
end
TSIL.__AddInternalCallback(
    "NPC_STATE_CHANGED_CALLBACK_ON_NPC_UPDATE",
    ModCallbacks.MC_NPC_UPDATE,
    OnNPCUpdate
)