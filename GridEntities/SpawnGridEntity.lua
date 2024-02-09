--- Helper function to spawn a grid entity.
---
--- Use this instead of `Isaac.GridSpawn` as it handles:
--- - Walls and pits collision
--- - Removing existing grid entities
--- - Allows you to use the grid index or position
---@param gridEntityType GridEntityType
---@param gridEntityVariant integer
---@param gridIndexOrPosition Vector | integer
---@param force boolean? @Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntity?
function TSIL.GridEntities.SpawnGridEntity(gridEntityType, gridEntityVariant, gridIndexOrPosition, force)
    if force == nil then
        force = true
    end

    local room = Game():GetRoom()
    local position = gridIndexOrPosition

    if type(gridIndexOrPosition) == "number" then
        position = room:GetGridPosition(gridIndexOrPosition)
    end

    ---@diagnostic disable-next-line: unknown-cast-variable
    ---@cast position Vector
    local existingGridEntity = room:GetGridEntityFromPos(position)

    if existingGridEntity then
        -- If force is set to false and there is already a grid entity, skip spawning it.
        if not force then
            return
        else
            TSIL.GridEntities.RemoveGridEntity(existingGridEntity, true)
        end
    end

    local gridEntity = Isaac.GridSpawn(gridEntityType, gridEntityVariant, position, true)

    if not gridEntity then
        return
    end

    if gridEntityType == GridEntityType.GRID_PIT then
        local pit = gridEntity:ToPit()

        if pit then
            pit:UpdateCollision()
        end
    elseif gridEntityType == GridEntityType.GRID_WALL then
        gridEntity.CollisionClass = GridCollisionClass.COLLISION_WALL
    end

    return gridEntity
end


--- Helper function to spawn a void portal.
---
--- This is more complicated than just spawning a trapdoor with the appropriate variant, as
--- it won't have the correct graphics and it won't lead to The Void.
---@param gridIndexOrPosition Vector | integer
---@param force boolean? @Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntity?
function TSIL.GridEntities.SpawnVoidPortal(gridIndexOrPosition, force)
    if force == nil then
        force = true
    end

    local voidPortal = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_TRAPDOOR,
        TSIL.Enums.TrapdoorVariant.VOID_PORTAL,
        gridIndexOrPosition,
        force
    )

    if not voidPortal then
        return
    end

    --So it takes us to The Void
    voidPortal.VarData = 1

    local sprite = voidPortal:GetSprite()
    sprite:Load("gfx/grid/voidtrapdoor.anm2", true)

    return voidPortal
end


--- Helper function to spawn a giant poop.
--- 
--- Will return true if the poop has successfully spawned.
---@param topLeftGridIndexOrPosition Vector | integer @Where the top left corner of the poop will be placed.
---@param force boolean? @Default : true. Set this to true if you want to replace existing grid entities in the same tiles.
---@return boolean
function TSIL.GridEntities.SpawnGigaPoop(topLeftGridIndexOrPosition, force)
    local room = Game():GetRoom()
    local topLeftGridIndex = topLeftGridIndexOrPosition

    if type(topLeftGridIndexOrPosition) ~= "number" then
        ---@cast topLeftGridIndexOrPosition Vector
        topLeftGridIndex = room:GetClampedGridIndex(topLeftGridIndexOrPosition)
    end

    local gridWidth = TSIL.Rooms.GetRoomShapeGridWidth(room:GetRoomShape())

    local topRightGridIndex = topLeftGridIndex + 1
    local bottomLeftGridIndex = topLeftGridIndex + gridWidth
    local bottomRightGridIndex = bottomLeftGridIndex + 1

    local topLeftPoopGridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_POOP,
        TSIL.Enums.PoopGridEntityVariant.GIGA_TOP_LEFT,
        topLeftGridIndex,
        force
    )

    local topRightPoopGridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_POOP,
        TSIL.Enums.PoopGridEntityVariant.GIGA_TOP_RIGHT,
        topRightGridIndex,
        force
    )

    local bottomLeftPoopGridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_POOP,
        TSIL.Enums.PoopGridEntityVariant.GIGA_BOTTOM_LEFT,
        bottomLeftGridIndex,
        force
    )

    local bottomRightPoopGridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_POOP,
        TSIL.Enums.PoopGridEntityVariant.GIGA_BOTTOM_RIGHT,
        bottomRightGridIndex,
        force
    )

    return topLeftPoopGridEntity ~= nil and topRightPoopGridEntity ~= nil and
    bottomLeftPoopGridEntity ~= nil and bottomRightPoopGridEntity ~= nil
end