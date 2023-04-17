local CONTINOUSLY_SPAWNING_EFFECTS = {
    [EffectVariant.WATER_DROPLET] = true,
    [EffectVariant.RAIN_DROP] = true
}

local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "IsGamePaused_PAUSE",
        false,
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "TearProjectileRecords_PAUSE",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
    "ON_TSIL_LOAD_PAUSE",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param records any
---@param tearProjectile EntityTear | EntityProjectile
local function RecordTearProjectile(records, tearProjectile)
    local ptrHash = GetPtrHash(tearProjectile)

    local accel
    if tearProjectile.Type == EntityType.ENTITY_TEAR then
        accel = tearProjectile.FallingAcceleration
    else
        accel = tearProjectile.FallingAccel
    end

    records[ptrHash] = {
        position = tearProjectile.Position,
        height = tearProjectile.Height,
        fallingSpeed = tearProjectile.FallingSpeed,
        positionOffset = tearProjectile.PositionOffset,
        velocity = tearProjectile.Velocity,
        fallingAcceleration = accel
    }
end


local function RecordTearProjectiles()
    local records = {}

    local tears = TSIL.EntitySpecific.GetTears()
    local projectiles = TSIL.EntitySpecific.GetProjectiles()

    for _, tear in ipairs(tears) do
        RecordTearProjectile(records, tear)
    end

    for _, projectile in ipairs(projectiles) do
        RecordTearProjectile(records, projectile)
    end

    TSIL.SaveManager.SetPersistentVariable(
        TSIL.__MOD,
        "TearProjectileRecords_PAUSE",
        records
    )
end


local function DisableInputs()
    for i = 0, Game():GetNumPlayers()-1, 1 do
        local player = Game():GetPlayer(i)

        player.ControlsEnabled = false
    end
end


local function EnableInputs()
    for i = 0, Game():GetNumPlayers()-1, 1 do
        local player = Game():GetPlayer(i)

        player.ControlsEnabled = true
    end
end


local function UsePause()
    local player = Game():GetPlayer(0)

    player:UseActiveItem(
        CollectibleType.COLLECTIBLE_PAUSE,
        UseFlag.USE_NOANIM
    )
end


---@param record any
---@param tearProjectile EntityTear | EntityProjectile
local function RestoreTearProjectile(record, tearProjectile)
    tearProjectile.Position = record.position
    tearProjectile.Velocity = Vector.Zero
    tearProjectile.Height = record.height
    tearProjectile.FallingSpeed = 0
    tearProjectile.PositionOffset = record.positionOffset
end


local function RestoreTearProjectiles()
    local records = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "TearProjectileRecords_PAUSE"
    )

    local tears = TSIL.EntitySpecific.GetTears()
    local projectiles = TSIL.EntitySpecific.GetProjectiles()

    for _, tear in ipairs(tears) do
        local ptrHash = GetPtrHash(tear)
        local record = records[ptrHash]

        if not record then
            RecordTearProjectile(records, tear)
        else
            RestoreTearProjectile(record, tear)
        end
    end

    for _, projectile in ipairs(projectiles) do
        local ptrHash = GetPtrHash(projectile)
        local record = records[ptrHash]

        if not record then
            RecordTearProjectile(records, projectile)
        else
            RestoreTearProjectile(record, projectile)
        end
    end
end


---@param record any
---@param tear EntityTear
local function CompletelyRestoreTear(record, tear)
    tear.Position = record.position
    tear.Velocity = record.velocity
    tear.Height = record.height
    tear.FallingSpeed = record.fallingSpeed
    tear.FallingAcceleration = record.fallingAcceleration
    tear.PositionOffset = record.positionOffset
end


local function CompletelyRestoreTears()
    local records = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "TearProjectileRecords_PAUSE"
    )

    local tears = TSIL.EntitySpecific.GetTears()

    for _, tear in ipairs(tears) do
        local ptrHash = GetPtrHash(tear)
        local record = records[ptrHash]

        CompletelyRestoreTear(record, tear)
    end
end


local function RemoveProjectiles()
    local projectiles = TSIL.EntitySpecific.GetProjectiles()

    for _, projectile in ipairs(projectiles) do
        projectile:Remove()
    end
end


local function StopPlayers()
    for i = 0, Game():GetNumPlayers()-1, 1 do
        local player = Game():GetPlayer(i)

        player.Velocity = Vector.Zero
    end
end


local function OnUpdate()
    if not TSIL.Pause.IsPaused() then return end

    RestoreTearProjectiles()

    UsePause()

    StopPlayers()
end
TSIL.__AddInternalCallback(
    "ON_UPDATE_PAUSE",
    ModCallbacks.MC_POST_UPDATE,
    OnUpdate
)


local shouldUnpause = false

---@param entity Entity
---@param button ButtonAction
local function OnInput(_, entity, _, button)
    if not shouldUnpause then return end

    if entity.Type ~= EntityType.ENTITY_PLAYER then return end
    if button ~= ButtonAction.ACTION_SHOOTRIGHT then return end

    shouldUnpause = false
    return 0.75
end
TSIL.__AddInternalCallback(
    "ON_INPUT_PAUSE",
    ModCallbacks.MC_INPUT_ACTION,
    OnInput,
    CallbackPriority.DEFAULT,
    InputHook.GET_ACTION_VALUE
)


---@param effect EntityEffect
local function OnEffectInit(_, effect)
    --Effects only pause if they are there when the item is used.
    --Since we are using the item every frame, every single spawned effect will be paused too.

    --This can cause lag in some rooms in downpour where water drops spawn continously, for example
    if not CONTINOUSLY_SPAWNING_EFFECTS[effect.Variant] then return end

    if TSIL.Pause.IsPaused() then
        effect:Remove()
    end
end
TSIL.__AddInternalCallback(
    "ON_EFFECT_INIT_PAUSE",
    ModCallbacks.MC_POST_EFFECT_INIT,
    OnEffectInit,
    CallbackPriority.DEFAULT
)


---Helper function to pause the game similarly to how the game does when showing a giant book
---or an achievement.
---
---Internally it's done by using the pause item on every frame and keeping track of every tear
---and projectile's states.
function TSIL.Pause.Pause()
    --The game is already paused, don't do anything
    if TSIL.Pause.IsPaused() then return end

    TSIL.SaveManager.SetPersistentVariable(
        TSIL.__MOD,
        "IsGamePaused_PAUSE",
        true
    )

    RecordTearProjectiles()

    DisableInputs()

    UsePause()

    StopPlayers()
end


---Unpauses the game if it was previously paused by `TSIL.Pause.Pause()`.
---
---Because of limitations with the Pause item, this will remove all projectiles.
function TSIL.Pause.Unpause()
    --The game is already unpaused, don't do anything
    if not TSIL.Pause.IsPaused() then return end

    TSIL.SaveManager.SetPersistentVariable(
        TSIL.__MOD,
        "IsGamePaused_PAUSE",
        false
    )

    EnableInputs()

    CompletelyRestoreTears()

    RemoveProjectiles()

    shouldUnpause = true

    TSIL.SaveManager.ResetPersistentVariable(
        TSIL.__MOD,
        "TearProjectileRecords_PAUSE"
    )
end


---Helper function to check if the game is being paused by the library
---@return boolean
function TSIL.Pause.IsPaused()
    return TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "IsGamePaused_PAUSE"
    )
end