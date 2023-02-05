--- Helper function to get a map containing the positions of every entity in the current room.
---@param entities Entity[]? @Optional. If provided, will only get the positions of the given entities, instead of calling `Isaac.GetRoomEntities`.
---@return table<EntityPtr, Vector>
function TSIL.Entities.GetEntityPositions(entities)
    if entities == nil then
        entities = TSIL.Entities.GetEntities()
    end

    local entityPositions = {}

    TSIL.Utils.Tables.ForEach(entities, function (_, entity)
        local ptr = EntityPtr(entity)
        entityPositions[ptr] = entity.Position
    end)

    return entityPositions
end


--- Helper function to get a map containing the velocities of every entity in the current room.
---@param entities Entity[]? @Optional. If provided, will only get the velocities of the given entities, instead of calling `Isaac.GetRoomEntities`.
---@return table<EntityPtr, Vector>
function TSIL.Entities.GetEntityVelocities(entities)
    if entities == nil then
        entities = TSIL.Entities.GetEntities()
    end

    local entityPositions = {}

    TSIL.Utils.Tables.ForEach(entities, function (_, entity)
        local ptr = EntityPtr(entity)
        entityPositions[ptr] = entity.Velocity
    end)

    return entityPositions
end


--- Helper function to set the positions of all the entities in the room.
--- 
--- Useful for rewinding entity positions.
---@param positions table<EntityPtr, Vector>
---@param entities Entity[]? @Optional If provided, will only set the positions of the given entities, instead of calling `Isaac.GetRoomEntities`.
function TSIL.Entities.SetEntityPositions(positions, entities)
    if entities == nil then
        entities = TSIL.Entities.GetEntities()
    end

    TSIL.Utils.Tables.ForEach(entities, function (_, entity)
        local ptr = EntityPtr(entity)
        local position = positions[ptr]

        if position then
            entity.Position = position
        end
    end)
end


--- Helper function to set the velocities of all the entities in the room.
--- 
--- Useful for rewinding entity velocities.
---@param velocities table<EntityPtr, Vector>
---@param entities Entity[]? @Optional If provided, will only set the velocities of the given entities, instead of calling `Isaac.GetRoomEntities`.
function TSIL.Entities.SetEntityVelocities(velocities, entities)
    if entities == nil then
        entities = TSIL.Entities.GetEntities()
    end

    TSIL.Utils.Tables.ForEach(entities, function (_, entity)
        local ptr = EntityPtr(entity)
        local velocity = velocities[ptr]

        if velocity then
            entity.Velocity = velocity
        end
    end)
end