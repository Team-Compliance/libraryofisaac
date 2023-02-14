---Helper function to spawn an NPC.
---
---Note that if you pass a non-NPC `EntityType` to this function, it will cause a run-time error,
---since the `Entity.ToNPC` method will return nil.
---@param entityType EntityType
---@param variant integer
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner? Entity
---@param seedOrRNG? integer | RNG
---@return EntityNPC
function TSIL.EntitySpecific.SpawnNPC(entityType, variant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(entityType, variant, subType, position, velocity, spawner, seedOrRNG):ToNPC()

    if entity == nil then
        error("Failed to spawn a NPC.")
    end

    return entity
end

---Helper function to spawn a bomb.
---@param bombVariant BombVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityBomb
function TSIL.EntitySpecific.SpawnBomb(bombVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_BOMB, bombVariant, subType, position, velocity, spawner, seedOrRNG):ToBomb()

    if entity == nil then
        error("Failed to spawn a bomb.")
    end

    return entity
end

---Helper function to spawn an effect.
---@param effectVariant EffectVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityEffect
function TSIL.EntitySpecific.SpawnEffect(effectVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_EFFECT, effectVariant, subType, position, velocity, spawner, seedOrRNG):ToEffect()

    if entity == nil then
        error("Failed to spawn an effect.")
    end

    return entity
end

---Helper function to spawn a familiar.
---@param familiarVariant FamiliarVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityFamiliar
function TSIL.EntitySpecific.SpawnFamiliar(familiarVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_FAMILIAR, familiarVariant, subType, position, velocity, spawner, seedOrRNG):ToFamiliar()

    if entity == nil then
        error("Failed to spawn a familiar.")
    end

    return entity
end

---Helper function to spawn a knife.
---@param knifeVariant KnifeVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityKnife
function TSIL.EntitySpecific.SpawnKnife(knifeVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_KNIFE, knifeVariant, subType, position, velocity, spawner, seedOrRNG):ToKnife()

    if entity == nil then
        error("Failed to spawn a knife.")
    end

    return entity
end

---Helper function to spawn a laser.
---@param laserVariant LaserVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityLaser
function TSIL.EntitySpecific.SpawnLaser(laserVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_LASER, laserVariant, subType, position, velocity, spawner, seedOrRNG):ToLaser()

    if entity == nil then
        error("Failed to spawn a laser.")
    end

    return entity
end

---Helper function to spawn a pickup.
---@param pickupVariant PickupVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.EntitySpecific.SpawnPickup(pickupVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_PICKUP, pickupVariant, subType, position, velocity, spawner, seedOrRNG):ToPickup()

    if entity == nil then
        error("Failed to spawn a pickup.")
    end

    return entity
end

---Helper function to spawn a projectile.
---@param projectileVariant ProjectileVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityProjectile
function TSIL.EntitySpecific.SpawnProjectile(projectileVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_PROJECTILE, projectileVariant, subType, position, velocity, spawner, seedOrRNG):ToProjectile()

    if entity == nil then
        error("Failed to spawn a projectile.")
    end

    return entity
end

---Helper function to spawn a slot.
---@param slotVariant SlotVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return Entity
function TSIL.EntitySpecific.SpawnSlot(slotVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    return TSIL.Entities.Spawn(EntityType.ENTITY_SLOT, slotVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a tear.
---@param tearVariant TearVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityTear
function TSIL.EntitySpecific.SpawnTear(tearVariant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    local entity = TSIL.Entities.Spawn(EntityType.ENTITY_TEAR, tearVariant, subType, position, velocity, spawner, seedOrRNG):ToTear()

    if entity == nil then
        error("Failed to spawn a tear.")
    end

    return entity
end