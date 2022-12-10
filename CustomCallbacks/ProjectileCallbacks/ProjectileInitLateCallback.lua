--##POST_PROJECTILE_INIT_LATE
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_PROJECTILE_INIT_LATE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


---@param projectile EntityProjectile
local function OnProjectileUpdate(_, projectile)
    if projectile.FrameCount == 0 then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_PROJECTILE_INIT_LATE, projectile)
    end
end
TSIL.__AddInternalCallback(
    "PROJECTILE_INIT_LATE_CALLBACK_ON_PROJECTILE_UPDATE",
    ModCallbacks.MC_POST_PROJECTILE_UPDATE,
    OnProjectileUpdate
)