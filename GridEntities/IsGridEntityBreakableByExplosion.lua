local GridEntityTypeBreakableByExplosion = {
    [GridEntityType.GRID_ROCK] = true,
    [GridEntityType.GRID_ROCKT] = true,
    [GridEntityType.GRID_ROCK_BOMB] = true,
    [GridEntityType.GRID_ROCK_ALT] = true,
    [GridEntityType.GRID_SPIDERWEB] = true,
    [GridEntityType.GRID_TNT] = true,
    [GridEntityType.GRID_POOP] = true,
    [GridEntityType.GRID_ROCK_SS] = true,
    [GridEntityType.GRID_ROCK_SPIKED] = true,
    [GridEntityType.GRID_ROCK_ALT2] = true,
    [GridEntityType.GRID_ROCK_GOLD] = true,
    [GridEntityType.GRID_STATUE] = {
        [TSIL.Enums.StatueVariant.ANGEL] = true
    }
}

--- Helper function to check if a GridEntity is able to be broken with an explosion.
---@param gridEntity GridEntity
---@return boolean
function TSIL.GridEntities.IsGridEntityBreakableByExplosion(gridEntity)
    local gridEntityType = gridEntity:GetType()
    local gridEntityVariant = gridEntity:GetVariant()

    local isBreakable = GridEntityTypeBreakableByExplosion[gridEntityType]

    if type(isBreakable) == "table" then
        return isBreakable[gridEntityVariant] ~= nil
    else
        return isBreakable ~= nil
    end
end