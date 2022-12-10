--##POST_SACRIFICE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_SACRIFICE,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "numSacrifices_POST_SACRIFICE_CALLBACK", 0, TSIL.Enums.VariablePersistenceMode.RESET_LEVEL)
end
TSIL.__AddInternalCallback(
    "POST_SACRIFICE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param entity Entity
---@param damageFlags integer
local function OnPlayerDamage(_, entity, _, damageFlags)
    local player = entity:ToPlayer()

    local room = Game():GetRoom()
    local roomType = room:GetType()

    local isSpikeDamage = TSIL.Utils.Flags.HasFlags(damageFlags, DamageFlag.DAMAGE_SPIKES)

    if roomType == RoomType.ROOM_SACRIFICE and isSpikeDamage then
        local numSacrifices = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "numSacrifices_POST_SACRIFICE_CALLBACK")
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "numSacrifices_POST_SACRIFICE_CALLBACK", numSacrifices + 1)

        local skipDamage = TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SACRIFICE, player, numSacrifices)
        return skipDamage
    end
end
TSIL.__AddInternalCallback(
    "POST_SACRIFICE_CALLBACK_ON_ENTITY_DAMAGE_PLAYER",
    ModCallbacks.MC_ENTITY_TAKE_DMG,
    OnPlayerDamage,
    CallbackPriority.DEFAULT,
    EntityType.ENTITY_PLAYER
)