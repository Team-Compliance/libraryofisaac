local function ShockwaveUpdateDamageCooldowns(shockwaveData)
    local updatedHitEntities = {}

    for enemySeed, currentCooldown in pairs(shockwaveData.HitEntities) do
        if currentCooldown > 0 then
            updatedHitEntities[enemySeed] = currentCooldown - 1
        elseif currentCooldown < 0 then
            updatedHitEntities[enemySeed] = currentCooldown
        end
    end

    shockwaveData.HitEntities = updatedHitEntities
end


local function ShockwaveCollideWithEntities(shockwave, shockwaveData, customShockwaveParams)
    local enemiesInRadius = Isaac.FindInRadius(shockwave.Position, 40, EntityPartition.ENEMY | EntityPartition.PLAYER)

    for _, enemy in ipairs(enemiesInRadius) do
        if enemy:IsVulnerableEnemy() or enemy.Type == EntityType.ENTITY_FIREPLACE or enemy:ToPlayer() then
            local shockwaveParentSeed = shockwave.Parent.InitSeed
            local enemySeed = enemy.InitSeed

            if (customShockwaveParams.SelfDamage or shockwaveParentSeed ~= enemySeed) and --Check for self damage
            (customShockwaveParams.DamagePlayers or not enemy:ToPlayer()) and
            (not shockwaveData.HitEntities[enemySeed]) and --Check if we already hit this entity
            (enemy.EntityCollisionClass ~= EntityCollisionClass.ENTCOLL_NONE and --Check if the enemy isnt supposed to collide
            enemy.EntityCollisionClass ~= EntityCollisionClass.ENTCOLL_PLAYERONLY) then --Same
                shockwaveData.HitEntities[enemySeed] = customShockwaveParams.DamageCooldown

                if enemy:ToPlayer() then
                    enemy:TakeDamage(1, DamageFlag.DAMAGE_CRUSH, EntityRef(shockwave), 0)
                else
                    enemy:TakeDamage(customShockwaveParams.Damage, DamageFlag.DAMAGE_CRUSH, EntityRef(shockwave), 0)
                end
            end
        end
    end
end


local function ShockwaveDestroyGrid(shockwave, customShockwaveParams)
    if not customShockwaveParams.DestroyGrid then return end

    local room = Game():GetRoom()

    for gridIndex = 0, room:GetGridSize() do
        local gridEntity = room:GetGridEntity(gridIndex)

        if gridEntity then
            if gridEntity.Position:Distance(shockwave.Position) <= 40 then
                local gridEntityType = gridEntity:GetType()

                if gridEntityType == GridEntityType.GRID_ROCK_BOMB or gridEntityType == GridEntityType.GRID_TNT then
                    gridEntity:Destroy(false)
                else
                    room:DestroyGrid(gridIndex, true)
                end
            end
        end
    end
end


local function ShockwaveUpdateAnimation(shockwave, shockwaveData, customShockwaveParams)
    local shockwaveSprite = shockwave:GetSprite()

    if shockwaveData.CurrentDuration <= 0 then
        shockwaveSprite:SetLastFrame()
        return
    end

    shockwaveData.CurrentDuration = shockwaveData.CurrentDuration - 1
    local currentFrame = shockwaveSprite:GetFrame()

    if currentFrame < 6 then return end

    if shockwaveData.CurrentDuration > (10 + currentFrame) then
        shockwaveSprite:Play("Break", true)
        shockwaveSprite:SetLayerFrame(0, 3)

        if customShockwaveParams.SoundMode == TSIL.Enums.ShockwaveSoundMode.LOOP and
        shockwaveSprite.Duration % 2 == 0 then
            SFXManager():Play(SoundEffect.SOUND_ROCK_CRUMBLE, 0.5, 1, false, 1)
        end
    elseif shockwaveData.CurrentDuration < (16 - currentFrame) then
        local frameDifference = 16 - currentFrame - shockwaveData.CurrentDuration
        shockwaveSprite:SetLayerFrame(0, currentFrame + frameDifference)
    end
end


local function OnShockwaveUpdate(_, shockwave)
    local saveManager = TSIL.SaveManager

    local customShockwaves = saveManager.GetPersistentVariable(TSIL.__MOD, "TSIL_CUSTOM_SHOCKWAVES")

    if not customShockwaves then return end

    local shockwaveData = customShockwaves[GetPtrHash(shockwave)]

    if not shockwaveData then return end

    local customShockwaveParams = shockwaveData.CustomShockwaveParams

    --If it doesnt have custom shockwave params, its not our shockwave
    if not customShockwaveParams then return end

    ShockwaveUpdateDamageCooldowns(shockwaveData)

    ShockwaveCollideWithEntities(shockwave, shockwaveData, customShockwaveParams)

    ShockwaveDestroyGrid(shockwave, customShockwaveParams)

    ShockwaveUpdateAnimation(shockwave, shockwaveData, customShockwaveParams)

    if shockwaveData.CurrentDuration == 5 then
        customShockwaves[GetPtrHash(shockwave)] = nil
    end
end
TSIL.__AddInternalCallback(
    "CUSTOM_SHOCKWAVES_POST_EFFECT_UPDATE",
    ModCallbacks.MC_POST_EFFECT_UPDATE,
    OnShockwaveUpdate,
    CallbackPriority.DEFAULT,
    EffectVariant.ROCK_EXPLOSION
)