--##POST_HOLY_MANTLE_REMOVED
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_HOLY_MANTLE_REMOVED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "holyMantlesMap_HOLY_MANTLE_REMOVED_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCallback(
    "HOLY_MANTLE_REMOVED_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function OnPEffectUpdate(_, player)
    local holyMantlesMap = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "holyMantlesMap_HOLY_MANTLE_REMOVED_CALLBACK")

    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local playerIndexStr = tostring(playerIndex)

    local playerEffects = player:GetEffects()
    local currentNumHolyMantles = playerEffects:GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_HOLY_MANTLE)

    local prevNumHolyMantles = holyMantlesMap[playerIndexStr]

    if prevNumHolyMantles == nil then
        prevNumHolyMantles = currentNumHolyMantles
    end

    if prevNumHolyMantles > currentNumHolyMantles then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_HOLY_MANTLE_REMOVED, player, prevNumHolyMantles, currentNumHolyMantles)
    end

    holyMantlesMap[playerIndexStr] = currentNumHolyMantles
end
TSIL.__AddInternalCallback(
    "HOLY_MANTLE_REMOVED_CALLBACK_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    OnPEffectUpdate
)