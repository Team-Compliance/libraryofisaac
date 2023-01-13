--##POST_LASER_INIT_LATE

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_LASER_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "lasersInRoom_KINFE_INIT_LATE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "LASER_INIT_LATE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param laser EntityLaser
local function OnLaserUpdate(_, laser)
    local lasersInRoom = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "lasersInRoom_KINFE_INIT_LATE_CALLBACK")
    local laserPtr = GetPtrHash(laser)

    if not TSIL.Utils.Tables.IsIn(lasersInRoom, laserPtr) then
        lasersInRoom[#lasersInRoom+1] = laserPtr
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_LASER_INIT_LATE, laser)
    end
end
TSIL.__AddInternalCallback(
    "LASER_INIT_LATE_CALLBACK_ON_LASER_UPDATE",
    ModCallbacks.MC_POST_LASER_UPDATE,
    OnLaserUpdate
)