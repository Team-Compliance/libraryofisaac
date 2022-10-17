---Helper function to get all of the projectiles in the room.
---@param projectileVariant ProjectileVariant|integer? Optional. Default is -1, which matches all variants.
---@param subType integer? Optional. Default is -1, which matches all sub-types.
---@return EntityProjectile[]
function TSIL.Entities.GetProjectiles(projectileVariant, subType)
    local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_PROJECTILE, projectileVariant, subType)
    local projectiles = {}

    for _, v in pairs(entities) do
        local projectile = v:ToProjectile()
        if projectile then
            table.insert(projectiles, projectile)
        end
    end

    return projectiles
end