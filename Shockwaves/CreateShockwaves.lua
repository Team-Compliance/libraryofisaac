--##use Shockwaves/ShockwaveBehaviour.lua

---Creates a new shockwave with the given params.
---
---Returns the spawned shockwave. If it can't spawn it, returns nil.
---@param source Entity
---@param position Vector
---@param customShockwaveParams CustomShockwaveParams
---@return Entity?
function TSIL.ShockWaves.CreateShockwave(source, position, customShockwaveParams)
    --Check if the position is in a wall or even outside the room
    local room = Game():GetRoom()
    local gridIndex = room:GetClampedGridIndex(position)
    local gridEntity = room:GetGridEntity(gridIndex)

    local isOutside = gridIndex < 0 or gridIndex > room:GetGridSize()
    local isInForbiddenGrid = gridEntity and (
        gridEntity:GetType() == GridEntityType.GRID_WALL or
        gridEntity:GetType() == GridEntityType.GRID_DOOR or
        gridEntity:GetType() == GridEntityType.GRID_ROCKB or
        gridEntity:GetType() == GridEntityType.GRID_PILLAR)
    local cantDestroyRocks = not customShockwaveParams.DestroyGrid and room:GetGridCollision(gridIndex) ~= GridCollisionClass.COLLISION_NONE
    local cantGoOverPits = not customShockwaveParams.GoOverPits and gridEntity and gridEntity:GetType() == GridEntityType.GRID_PIT

    if isOutside or isInForbiddenGrid or cantDestroyRocks or cantGoOverPits then
        return
    end

    --Spawn shockwave
    local shockwave = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.ROCK_EXPLOSION, 0, position, Vector.Zero, source)
    shockwave.Size = shockwave.Size * customShockwaveParams.Size
    shockwave.Parent = source
    local sprite = shockwave:GetSprite()
    sprite.Scale = Vector(customShockwaveParams.Size, customShockwaveParams.Size)
    sprite.Color = customShockwaveParams.Color
    sprite:ReplaceSpritesheet(0, customShockwaveParams.SpriteSheet)
    sprite:LoadGraphics()

    if customShockwaveParams.SoundMode ~= TSIL.Enums.ShockwaveSoundMode.NO_SOUND then
        SFXManager():Play(SoundEffect.SOUND_ROCK_CRUMBLE, 0.5, 2, false, 1)
    end

    local saveManager = TSIL.SaveManager

    local customShockwaves = saveManager.GetPersistentVariable(TSIL.__MOD, "TSIL_CUSTOM_SHOCKWAVES")

    if not customShockwaves then
        saveManager.AddPersistentVariable(TSIL.__MOD, "TSIL_CUSTOM_SHOCKWAVES", {}, TSIL.Enums.VariablePersistenceMode.REMOVE_ROOM)
        customShockwaves = saveManager.GetPersistentVariable(TSIL.__MOD, "TSIL_CUSTOM_SHOCKWAVES")
    end

    customShockwaves[GetPtrHash(shockwave)] = {
        CustomShockwaveParams = customShockwaveParams,
        CurrentDuration = customShockwaveParams.Duration,
        HitEntities = {}
    }

    return shockwave
end


---Creates a shockwave ring with the given properties.
---
---Returns the spawned shockwaves. If multiple rings are set to spawn, returns only
---the shockwaves spawned in the first ring.
---@param source Entity
---@param center Vector
---@param radius number
---@param customShockwaveParams CustomShockwaveParams
---@param direction Vector? @ Default: Vector(0, -1)
---@param angleWidth number? @ Default: 360
---@param spacing number? @ Default: 35 * customShockwaveParams.Size
---@param numRings integer? @ Default: 1
---@param ringSpacing number? @ Default: 35 * customShockwaveParams.Size
---@param ringDelay integer? @ Default: 5
---@return Entity[]
function TSIL.ShockWaves.CreateShockwaveRing(source, center, radius, customShockwaveParams, direction, angleWidth, spacing, numRings, ringSpacing, ringDelay)
    local shockwaves = {}

    --Default values
    if direction == nil then direction = Vector(0, -1) end
    direction:Normalized()
    if angleWidth == nil then angleWidth = 360 end
    angleWidth = math.min(angleWidth, 360)
    if spacing == nil then spacing = 35 * customShockwaveParams.Size end
    if numRings == nil then numRings = 1 end
    numRings = math.max(1, numRings)
    if ringSpacing == nil then ringSpacing = spacing end
    if ringDelay == nil then ringDelay = 5 end

    --Other set up
    local totalPerimeter = math.pi * 2 * radius
    local widthPerimeter = angleWidth * totalPerimeter / 360

    local numShockwaves = math.max(1, math.floor(widthPerimeter / spacing + 0.5))

    local angleOffset = angleWidth/numShockwaves
    local currentDirection = direction:Rotated(-angleWidth/2)

    local room = Game():GetRoom()

    for _ = 0, numShockwaves, 1 do
        local spawningOffset = currentDirection * radius

        local mode = 0
        if customShockwaveParams.GoOverPits then
            mode = 3
        end

        ---@diagnostic disable-next-line: param-type-mismatch
        if room:CheckLine(center, center + spawningOffset, mode, 1000, false, customShockwaveParams.DestroyGrid) then
            local shockwave = TSIL.ShockWaves.CreateShockwave(source, center + spawningOffset, customShockwaveParams)

            if shockwave then
                shockwaves[#shockwaves+1] = shockwave
            end
        end
        currentDirection = currentDirection:Rotated(angleOffset)
    end

    numRings = numRings - 1

    if numRings > 0 and #shockwaves > 0 then
        TSIL.Utils.Functions.RunInFrames(TSIL.ShockWaves.CreateShockwaveRing, ringDelay,
            source,
            center,
            radius + ringSpacing,
            customShockwaveParams,
            direction,
            angleWidth,
            spacing,
            numRings
        )
    end

    return shockwaves
end


---Creates a shockwave line with the given properties.
---
---Returns only the first shockwave spawned.
---@param source Entity
---@param center Vector
---@param direction Vector
---@param customShockwaveParams CustomShockwaveParams
---@param spacing number? @ Default: 35 * customShockwaveParams.Size
---@param delay integer? @ Default: 1
---@param numShockwaves integer? @ Default: -1 | Which makes the line travel until it hits an obstacle it can't break
---@return Entity?
function TSIL.ShockWaves.CreateShockwaveLine(source, center, direction, customShockwaveParams, spacing, delay, numShockwaves)
    direction:Normalize()
    if spacing == nil then spacing = 35 * customShockwaveParams.Size end
    if delay == nil then delay = 5 end
    if numShockwaves == nil then numShockwaves = -1 end

    local shockwave = TSIL.ShockWaves.CreateShockwave(source, center + direction * spacing, customShockwaveParams)

    if shockwave and numShockwaves ~= 0 then
        TSIL.Utils.Functions.RunInFramesTemporary(TSIL.ShockWaves.CreateShockwaveLine, delay,
            source,
            center + direction * spacing,
            direction,
            customShockwaveParams,
            spacing,
            delay,
            numShockwaves - 1
        )
    end

    return shockwave
end


---Creates a shockwave line with the given properties. Each shockwave is spawned with a random offset.
---
---Returns only the first shockwave spawned.
---@param source Entity
---@param center Vector
---@param direction Vector
---@param customShockwaveParams CustomShockwaveParams
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@param randomOffset integer? @ Default: 60
---@param spacing number? @ Default: 35 * customShockwaveParams.Size
---@param delay integer? @ Default: 1
---@param numShockwaves integer? @ Default: -1 | Which makes the line travel until it hits an obstacle it can't break
---@return Entity?
function TSIL.ShockWaves.CreateShockwaveRandomLine(source, center, direction, customShockwaveParams, seedOrRNG, randomOffset, spacing, delay, numShockwaves)
    direction:Normalize()
    if spacing == nil then spacing = 35 * customShockwaveParams.Size end
    if delay == nil then delay = 5 end
    if numShockwaves == nil then numShockwaves = -1 end
    if randomOffset == nil then randomOffset = 60 end

    local shockwave = TSIL.ShockWaves.CreateShockwave(source, center + direction * spacing, customShockwaveParams)

    if shockwave and numShockwaves ~= 0 then
        local rng

        if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
            ---@cast seedOrRNG RNG
            rng = seedOrRNG
        else
            ---@cast seedOrRNG number | nil
            rng = TSIL.RNG.NewRNG(seedOrRNG)
        end

        local randomAngle = TSIL.Random.GetRandomInt(randomOffset - (randomOffset/2), randomOffset + (randomOffset/2), rng)
        local randomDirection = direction:Rotated(randomAngle)
        TSIL.Utils.Functions.RunInFramesTemporary(TSIL.ShockWaves.CreateShockwaveRandomLine, delay,
            source,
            center + randomDirection * spacing,
            direction,
            customShockwaveParams,
            rng,
            randomOffset,
            spacing,
            delay,
            numShockwaves - 1
        )
    end

    return shockwave
end