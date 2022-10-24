--- Helper function to trigger a room update without affecting entity positions or velocities.
function TSIL.Rooms.UpdateRoom()
    local room = Game():GetRoom()
    local entities = TSIL.Entities.GetEntities()

    local positions = TSIL.Entities.GetEntityPositions(entities)
    local velocities = TSIL.Entities.GetEntityVelocities(entities)

    room:Update()

    TSIL.Entities.SetEntityPositions(positions, entities)
    TSIL.Entities.SetEntityVelocities(velocities, entities)
end