---Helper function to get all of the entities in the room or all of the entities tht match a specific entity type / variant / sub-type.
---Due to bugs with `Isaac.FindInRadius`, this function uses `Isaac.GetRoomEntities`, which is more expensive but is also more robust.
---(If a matching entity type is provided, then `Isaac.FindByType` will be used instead.)
---@param entityType integer? Optional. If specified, will only get the entities that match the type. Default is -1, which matches every type.
---@param variant integer? Optional. If specified, will only get the entities that match the variant. Default is -1, which matches every variant.
---@param subType integer? Optional. If specified, will only get the entities that match the sub-type. Default is -1, which matches every sub-type.
---@param ignoreFriendly boolean? Optional. If set to true, it will exclude friendly NPCs from being returned. Default is false. Will only be taken into account if the `entityType` is specified.
---@return Entity[]
function TSIL.Utils.Functions.GetEntities(entityType, variant, subType, ignoreFriendly)
    entityType = entityType or -1
    variant = variant or -1
    subType = subType or -1

    if ignoreFriendly == nil then
        ignoreFriendly = false
    end

    if entityType == -1 then
        return Isaac.GetRoomEntities()
    end

---@diagnostic disable-next-line: param-type-mismatch
    return Isaac.FindByType(entityType, variant, subType, ignoreFriendly)
end

---Helper function to get all of the NPCs in the room.
---@param entityType integer? Optional. Default is -1, which matches all types.
---@param variant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@param ignoreFriendly boolean? Optional. If set to true, it will exclude friendly NPCs from being returned. Default is false. Will only be taken into account if the `entityType` is specified.
---@return EntityNPC[]
function TSIL.Utils.Functions.GetNPCs(entityType, variant, subType, ignoreFriendly)
    local entities = TSIL.Utils.Functions.GetNPCs(entityType, variant, subType, ignoreFriendly)
    local npcs = {}

    for _, v in pairs(entities) do
        local npc = v:ToNPC()
        if npc then
            table.insert(npcs, npc)
        end
    end

    return npcs
end

---Helper function to get all of the bombs in the room. (Specifically, this refers to the `EntityBomb` class, not bomb pickups.)
---@param bombVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityBomb[]
function TSIL.Utils.Functions.GetBombs(bombVariant, subType)
    bombVariant = bombVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_BOMB, bombVariant, subType)
    local bombs = {}

    for _, v in pairs(entities) do
        local bomb = v:ToBomb()
        if bomb then
            table.insert(bombs, bomb)
        end
    end

    return bombs
end

---Helper function to get all of the effects in the room.
---@param effectVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityEffect[]
function TSIL.Utils.Functions.GetEffects(effectVariant, subType)
    effectVariant = effectVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_EFFECT, effectVariant, subType)
    local effects = {}

    for _, v in pairs(entities) do
        local effect = v:ToEffect()
        if effect then
            table.insert(effects, effect)
        end
    end

    return effects
end

---Helper function to get all of the familiars in the room.
---@param familiarVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityFamiliar[]
function TSIL.Utils.Functions.GetFamiliars(familiarVariant, subType)
    familiarVariant = familiarVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_EFFECT, familiarVariant, subType)
    local familiars = {}

    for _, v in pairs(entities) do
        local familiar = v:ToFamiliar()
        if familiar then
            table.insert(familiars, familiar)
        end
    end

    return familiars
end

---Helper function to get all of the knives in the room.
---@param knifeVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityKnife[]
function TSIL.Utils.Functions.GetKnives(knifeVariant, subType)
    knifeVariant = knifeVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_KNIFE, knifeVariant, subType)
    local knives = {}

    for _, v in pairs(entities) do
        local knife = v:ToKnife()
        if knife then
            table.insert(knives, knife)
        end
    end

    return knives
end

---Helper function to get all of the lasers in the room.
---@param laserVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityLaser[]
function TSIL.Utils.Functions.GetLasers(laserVariant, subType)
    laserVariant = laserVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_LASER, laserVariant, subType)
    local lasers = {}

    for _, v in pairs(entities) do
        local laser = v:ToLaser()
        if laser then
            table.insert(lasers, laser)
        end
    end

    return lasers
end

---Helper function to get all of the pickups in the room.
---@param pickupVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityPickup[]
function TSIL.Utils.Functions.GetPickups(pickupVariant, subType)
    pickupVariant = pickupVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_PICKUP, pickupVariant, subType)
    local pickups = {}

    for _, v in pairs(entities) do
        local pickup = v:ToPickup()
        if pickup then
            table.insert(pickups, pickup)
        end
    end

    return pickups
end

---Helper function to get all of the projectiles in the room.
---@param projectileVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityProjectile[]
function TSIL.Utils.Functions.GetProjectiles(projectileVariant, subType)
    projectileVariant = projectileVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_PROJECTILE, projectileVariant, subType)
    local projectiles = {}

    for _, v in pairs(entities) do
        local projectile = v:ToProjectile()
        if projectile then
            table.insert(projectiles, projectile)
        end
    end

    return projectiles
end

---Helper function to get all of the tears in the room.
---@param tearVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityTear[]
function TSIL.Utils.Functions.GetTears(tearVariant, subType)
    tearVariant = tearVariant or -1
    subType = subType or -1
    
    local entities = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_TEAR, tearVariant, subType)
    local tears = {}

    for _, v in pairs(entities) do
        local tear = v:ToTear()
        if tear then
            table.insert(tears, tear)
        end
    end

    return tears
end

---Helper function to get all of the slots in the room.
---@param slotVariant integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return Entity[]
function TSIL.Utils.Functions.GetSlots(slotVariant, subType)
    slotVariant = slotVariant or -1
    subType = subType or -1
    local slots = TSIL.Utils.Functions.GetEntities(EntityType.ENTITY_SLOT, slotVariant, subType)
    return slots 
end