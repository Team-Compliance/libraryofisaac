---Helper function to spawn an entity. Use this instead of the `Isaac.Spawn` method if you do not
---need to specify the velocity or spawner.
---@param entityType EntityType
---@param variant integer 
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return Entity
function TSIL.Entities.Spawn(entityType, variant, subType, position, velocity, spawner, seedOrRNG)
    velocity = velocity or Vector.Zero

    if seedOrRNG == nil then
        return Isaac.Spawn(entityType, variant, subType, position, velocity, spawner)
    end

    ---@type integer
    local seed

    if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
        seed = seedOrRNG:Next()
    else
        ---@cast seedOrRNG integer
        seed = seedOrRNG
    end

    return Game():Spawn(entityType, variant, position, velocity, spawner, subType, seed)
end