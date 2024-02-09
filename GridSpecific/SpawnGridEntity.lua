---@generic T : GridEntity
---@param type GridEntityType
---@param variant integer
---@param indexOrPosition integer | Vector
---@param force boolean?
---@param conversion fun(gridEntity: GridEntity) : T?
---@param conversionError string
---@return T?
local function SpawnGridEntityOfTypeAndVariant(type, variant, indexOrPosition, force, conversion, conversionError)
    local gridEntity = TSIL.GridEntities.SpawnGridEntity(
        type,
        variant,
        indexOrPosition,
        force
    )

    if not gridEntity then return end

    local converted = conversion(gridEntity)

    if not converted then
        error(conversionError)
    end

    return converted
end


--- Helper function to spawn a decoration.
---@param decorationVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityDecoration?
function TSIL.GridSpecific.SpawnDecoration(decorationVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_DECORATION,
        decorationVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToDecoration()
        end,
        "Failed to spawn a decoration."
    )
end


--- Helper function to spawn a door.
---@param doorVariant DoorVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityDoor?
function TSIL.GridSpecific.SpawnDoor(doorVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_DOOR,
        doorVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToDoor()
        end,
        "Failed to spawn a door."
    )
end


--- Helper function to spawn a fireplace.
---@param fireVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityFire?
function TSIL.GridSpecific.SpawnFire(fireVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_FIREPLACE,
        fireVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToFire()
        end,
        "Failed to spawn a fireplace."
    )
end


--- Helper function to spawn a gravity grid entity.
---@param gravityVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityGravity?
function TSIL.GridSpecific.SpawnGravity(gravityVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_GRAVITY,
        gravityVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToGravity()
        end,
        "Failed to spawn a gravity grid entity."
    )
end


--- Helper function to spawn a pit.
---@param pitVariant PitVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPit?
function TSIL.GridSpecific.SpawnPit(pitVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_PIT,
        pitVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToPit()
        end,
        "Failed to spawn a pit."
    )
end


--- Helper function to spawn a poop.
---@param poopVariant GridPoopVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPoop?
function TSIL.GridSpecific.SpawnPoop(poopVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_POOP,
        poopVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToPoop()
        end,
        "Failed to spawn a poop."
    )
end


--- Helper function to spawn a pressure plate.
---@param pressurePlateVariant PressurePlateVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPressurePlate?
function TSIL.GridSpecific.SpawnPressurePlate(pressurePlateVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_PRESSURE_PLATE,
        pressurePlateVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToPressurePlate()
        end,
        "Failed to spawn a pressure plate."
    )
end


--- Helper function to spawn a rock.
---@param rockVariant RockVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityRock?
function TSIL.GridSpecific.SpawnRock(rockVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_ROCK,
        rockVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToRock()
        end,
        "Failed to spawn a rock."
    )
end


--- Helper function to spawn spikes.
---@param spikeVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntitySpikes?
function TSIL.GridSpecific.SpawnSpikes(spikeVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_SPIKES,
        spikeVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToSpikes()
        end,
        "Failed to spawn spikes."
    )
end


--- Helper function to spawn stairs.
---@param stairsVariant StairsVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityStairs?
function TSIL.GridSpecific.SpawnStairs(stairsVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_STAIRS,
        stairsVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToStairs()
        end,
        "Failed to spawn stairs."
    )
end


--- Helper function to spawn a statue.
---@param statueVariant StatueVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityStatue?
function TSIL.GridSpecific.SpawnStatue(statueVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_STATUE,
        statueVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToStatue()
        end,
        "Failed to spawn a statue."
    )
end


--- Helper function to spawn a TNT.
---@param TNTVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityTNT?
function TSIL.GridSpecific.SpawnStatue(TNTVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_TNT,
        TNTVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToTNT()
        end,
        "Failed to spawn a TNT."
    )
end


--- Helper function to spawn a trapdoor.
---@param trapdoorVariant TrapdoorVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityTrapDoor?
function TSIL.GridSpecific.SpawnTrapdoor(trapdoorVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_TRAPDOOR,
        trapdoorVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToTrapDoor()
        end,
        "Failed to spawn a trapdoor."
    )
end


--- Helper function to spawn a wall.
---@param wallVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityWall?
function TSIL.GridSpecific.SpawnTrapdoor(wallVariant, indexOrPosition, force)
    return SpawnGridEntityOfTypeAndVariant(
        GridEntityType.GRID_WALL,
        wallVariant,
        indexOrPosition,
        force,
        function (gridEntity)
            return gridEntity:ToWall()
        end,
        "Failed to spawn a wall."
    )
end