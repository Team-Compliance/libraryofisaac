--- Helper function to remove a grid entity by providing the GridEntity or the grid index.
---
--- If removing a Devil or Angel Statue it'll also remove the associated effect.
--- @param gridEntityOrGridIndex GridEntity | integer
--- @param updateRoom boolean Whether or not to update the room after the grid entity is removed. If not, you won't be able to place another one until next frame. However doing so is expensive, so set this to false if you need to run this multiple times.
function TSIL.GridEntities.RemoveGridEntity(gridEntityOrGridIndex, updateRoom)
    local room = Game():GetRoom()

    ---@type GridEntity
    local gridEntity

    if type(gridEntityOrGridIndex) == "number" then
        gridEntity = room:GetGridEntity(gridEntityOrGridIndex)

        if not gridEntity then
            error("Couldn't find a grid entity at the given grid index: " .. gridEntityOrGridIndex)
        end
    else
        ---@cast gridEntityOrGridIndex GridEntity
        gridEntity = gridEntityOrGridIndex
    end

    local gridEntityType = gridEntity:GetType()
    local gridEntityVariant = gridEntity:GetVariant()
    local gridEntityPosition = gridEntity.Position

    room:RemoveGridEntity(gridEntity:GetGridIndex(), 0, false)

    if updateRoom then
        TSIL.Rooms.UpdateRoom()
    end

    --Remove statue decoration
    if gridEntityType == GridEntityType.GRID_STATUE then
        local effectVariant = EffectVariant.DEVIL

        if gridEntityVariant == TSIL.Enums.StatueVariant.ANGEL then
            effectVariant = EffectVariant.ANGEL
        end

        local effects = TSIL.Entities.GetEffects(effectVariant)

        table.sort(effects, function (a, b)
            return a.Position:DistanceSquared(gridEntityPosition) <= b.Position:DistanceSquared(gridEntityPosition)
        end)

        effects[1]:Remove()
    end
end


--- Helper function to remove all grid entities from a given list.
--- @param gridEntities GridEntity[]
--- @param updateRoom boolean Whether or not to update the room after the grid entity is removed. If not, you won't be able to place another one until next frame. However doing so is expensive, so set this to false if you need to run this multiple times.
function TSIL.GridEntities.RemoveGridEntities(gridEntities, updateRoom)
    TSIL.Utils.Tables.ForEach(gridEntities, function (_, gridEntity)
        TSIL.GridEntities.RemoveGridEntity(gridEntity, false)
    end)

    if updateRoom then
        TSIL.Rooms.UpdateRoom()
    end
end