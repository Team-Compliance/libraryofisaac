local ENTITY_GRID_COLLISION_PER_GRID_COLLISION = {
    [GridCollisionClass.COLLISION_NONE] = {
    },

    [GridCollisionClass.COLLISION_PIT] = {
        [EntityGridCollisionClass.GRIDCOLL_GROUND] = true,
    },

    [GridCollisionClass.COLLISION_OBJECT] = {
        [EntityGridCollisionClass.GRIDCOLL_BULLET] = true,
        [EntityGridCollisionClass.GRIDCOLL_GROUND] = true,
        [EntityGridCollisionClass.GRIDCOLL_NOPITS] = true,
        [EntityGridCollisionClass.GRIDCOLL_PITSONLY] = true,
    },

    [GridCollisionClass.COLLISION_SOLID] = {
        [EntityGridCollisionClass.GRIDCOLL_BULLET] = true,
        [EntityGridCollisionClass.GRIDCOLL_GROUND] = true,
        [EntityGridCollisionClass.GRIDCOLL_NOPITS] = true,
        [EntityGridCollisionClass.GRIDCOLL_PITSONLY] = true,
    },

    [GridCollisionClass.COLLISION_WALL] = {
        [EntityGridCollisionClass.GRIDCOLL_WALLS_X] = true,
        [EntityGridCollisionClass.GRIDCOLL_WALLS_Y] = true,
        [EntityGridCollisionClass.GRIDCOLL_WALLS] = true,
        [EntityGridCollisionClass.GRIDCOLL_BULLET] = true,
        [EntityGridCollisionClass.GRIDCOLL_GROUND] = true,
        [EntityGridCollisionClass.GRIDCOLL_NOPITS] = true,
        [EntityGridCollisionClass.GRIDCOLL_PITSONLY] = true,
    },

    [GridCollisionClass.COLLISION_WALL_EXCEPT_PLAYER] = {
        [EntityGridCollisionClass.GRIDCOLL_WALLS_X] = true,
        [EntityGridCollisionClass.GRIDCOLL_WALLS_Y] = true,
        [EntityGridCollisionClass.GRIDCOLL_WALLS] = true,
        [EntityGridCollisionClass.GRIDCOLL_BULLET] = true,
        [EntityGridCollisionClass.GRIDCOLL_GROUND] = true,
        [EntityGridCollisionClass.GRIDCOLL_NOPITS] = true,
        [EntityGridCollisionClass.GRIDCOLL_PITSONLY] = true,
    }
}

---Helper function to check if an entity can collide with a given grid entity.
---@param entity Entity
---@param gridEntity GridEntity
---@return boolean
function TSIL.Entities.CanCollideWithGridEntity(entity, gridEntity)
    -- Effects don't collide with any grids
    if entity.Type == EntityType.ENTITY_EFFECT then
        return false
    end

    -- Entities that don't collide with any grid entities
    if entity.GridCollisionClass == EntityGridCollisionClass.GRIDCOLL_NONE then
        return false
    end

    -- Grid entities that don't collide with any entities
    if gridEntity.CollisionClass == GridCollisionClass.COLLISION_NONE then
        return false
    end

    -- WALL_EXCEPT_PLAYER acts as nothing for player entities
    if gridEntity.CollisionClass == GridCollisionClass.COLLISION_WALL_EXCEPT_PLAYER
    and entity.Type == EntityType.ENTITY_PLAYER then
        return false
    end

    return ENTITY_GRID_COLLISION_PER_GRID_COLLISION[gridEntity.CollisionClass][entity.GridCollisionClass] == true
end