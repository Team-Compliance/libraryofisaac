local BOSSES_THAT_REQUIRE_MULTIPLE_SPAWNS = {
    [EntityType.ENTITY_LARRYJR] = true,
    [EntityType.ENTITY_CHUB] = true,
    [EntityType.ENTITY_LOKI] = true,
    [EntityType.ENTITY_GURGLE] = true,
    [EntityType.ENTITY_TURDLET] = true,
}

local DEFAULT_BOSS_MULTI_SEGMENTS = 4

---@param entityType number
---@param variant number
---@param numSegments number?
---@return number
local function getNumBossSegments(entityType, variant, numSegments)
    if numSegments ~= nil then
        return numSegments
    end

    if entityType == EntityType.ENTITY_CHUB then
        return 3
    elseif entityType == EntityType.ENTITY_LOKI then
        if variant == TSIL.Enums.LokiVariant.LOKII then
            return 2
        else
            return 1
        end
    elseif entityType == EntityType.ENTITY_GURGLING then
        return 2
    else
        return DEFAULT_BOSS_MULTI_SEGMENTS
    end
end


---Helper function to spawn a boss.
---
---Use this function instead of `TSIL.Entities.SpawnNPC` since it handles automatically spawning multiple segments
---for multi-segment bosses.
---
---By default, this will spawn Chub (and his variants) with 3 segments, Lokii with 2 copies,
---Gurglings/Turdlings with 2 copies, and other multi-segment bosses with 4 segments. You can
---customize this via the "numSegments" argument.
---@param entityType EntityType
---@param variant integer
---@param subType integer
---@param position Vector 
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG? integer | RNG
---@param numSegments integer?
---@return EntityNPC
function TSIL.Bosses.SpawnBoss(entityType, variant, subType, position, velocity, spawner, seedOrRNG, numSegments)
    velocity = velocity or Vector.Zero

    local seed

    if seedOrRNG ~= nil and TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
        seed = seedOrRNG:Next()
    else
        seed = seedOrRNG
    end

    local boss = TSIL.EntitySpecific.SpawnNPC(entityType, variant, subType, position, velocity, spawner, seed)

    if BOSSES_THAT_REQUIRE_MULTIPLE_SPAWNS[boss.Type] then
        if not numSegments then
            numSegments = getNumBossSegments(entityType, variant, subType)
        end

        local remainingSegments = numSegments - 1

        for _ = 1, remainingSegments do
            TSIL.EntitySpecific.SpawnNPC(entityType, variant, subType, position, velocity, spawner, seed)
        end
    end

    return boss
end

