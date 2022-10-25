--- Helper function to spawn a door.
---@param doorVariant DoorVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityDoor?
function TSIL.GridSpecific.SpawnDoor(doorVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.DOOR,
        doorVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local door = gridEntity:ToDoor()
    if not door then
        error("Failed to spawn a door.")
    end

    return door
end


--- Helper function to spawn a pit.
---@param pitVariant PitVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPit?
function TSIL.GridSpecific.SpawnPit(pitVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_PIT,
        pitVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local pit = gridEntity:ToPit()
    if not pit then
        error("Failed to spawn a pit.")
    end

    return pit
end


--- Helper function to spawn a poop.
---@param poopVariant PoopGridEntityVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPoop?
function TSIL.GridSpecific.SpawnPoop(poopVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_POOP,
        poopVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local poop = gridEntity:ToPoop()
    if not poop then
        error("Failed to spawn a poop.")
    end

    return poop
end


--- Helper function to spawn a pressure plate.
---@param pressurePlateVariant PressurePlateVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPressurePlate?
function TSIL.GridSpecific.SpawnPressurePlate(pressurePlateVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_PRESSURE_PLATE,
        pressurePlateVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local pressurePlate = gridEntity:ToPressurePlate()
    if not pressurePlate then
        error("Failed to spawn a pressure plate.")
    end

    return pressurePlate
end


--- Helper function to spawn a rock.
---@param rockVariant RockVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityRock?
function TSIL.GridSpecific.SpawnRock(rockVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_ROCK,
        rockVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local rock = gridEntity:ToRock()
    if not rock then
        error("Failed to spawn a rock.")
    end

    return rock
end


--- Helper function to spawn a spike.
---@param spikeVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntitySpikes?
function TSIL.GridSpecific.SpawnSpikes(spikeVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_SPIKES,
        spikeVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local spike = gridEntity:ToSpikes()
    if not spike then
        error("Failed to spawn a spike.")
    end

    return spike
end


--- Helper function to spawn TNT.
---@param TNTVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityTNT?
function TSIL.GridSpecific.SpawnTNT(TNTVariant, indexOrPosition, force)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        GridEntityType.GRID_TNT,
        TNTVariant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local tnt = gridEntity:ToTNT()
    if not tnt then
        error("Failed to spawn TNT.")
    end

    return tnt
end
