--- Helper function to remove a grid entity by providing the GridEntity or the grid index.
---
--- If removing a Devil or Angel Statue it'll also remove the associated effect.
---@param gridEntityOrGridIndex GridEntity | integer
---@param immediate boolean? @Default: true | Whether or not to use Repentogon's RemoveGridEntityImmediate. Vanilla RemoveGridEntity doesn't update the room, making it impossible to spawn a new grid entity on the same frame.
function TSIL.GridEntities.RemoveGridEntity(gridEntityOrGridIndex, immediate)
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

    if immediate == nil then
        immediate = true
    end

    local gridEntityType = gridEntity:GetType()
    local gridEntityVariant = gridEntity:GetVariant()
    local gridEntityPosition = gridEntity.Position

    if immediate then
        room:RemoveGridEntityImmediate(gridEntity:GetGridIndex(), 0, false)
    else
        room:RemoveGridEntity(gridEntity:GetGridIndex(), 0, false)
    end

    --Remove statue decoration
    if gridEntityType == GridEntityType.GRID_STATUE then
        local effectVariant = EffectVariant.DEVIL

        if gridEntityVariant == TSIL.Enums.StatueVariant.ANGEL then
            effectVariant = EffectVariant.ANGEL
        end

        local effects = TSIL.EntitySpecific.GetEffects(effectVariant)

        table.sort(effects, function (a, b)
            return a.Position:DistanceSquared(gridEntityPosition) <= b.Position:DistanceSquared(gridEntityPosition)
        end)

        effects[1]:Remove()
    end
end


--- Helper function to remove all grid entities from a given list.
---@param gridEntities GridEntity[]
---@param immediate boolean? @Default: true | Whether or not to use Repentogon's RemoveGridEntityImmediate. Vanilla RemoveGridEntity doesn't update the room, making it impossible to spawn a new grid entity on the same frame.
function TSIL.GridEntities.RemoveGridEntities(gridEntities, immediate)
    TSIL.Utils.Tables.ForEach(gridEntities, function (_, gridEntity)
        TSIL.GridEntities.RemoveGridEntity(gridEntity, immediate)
    end)
end