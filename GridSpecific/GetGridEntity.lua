---@generic T : GridEntity
---@param type GridEntityType
---@param variant integer?
---@param conversion fun(gridEntity: GridEntity) : T
---@return T[]
local function GetAllGridEntitiesOfTypeAndVariant(type, variant, conversion)
    local gridEntities = TSIL.GridEntities.GetGridEntities(type)
    local convertedGridEntities = {}

    for _, gridEntity in ipairs(gridEntities) do
        if (not variant or variant == -1) or variant == gridEntity:GetVariant() then
            convertedGridEntities[#convertedGridEntities+1] = conversion(gridEntity)
        end
    end

    return convertedGridEntities
end


--- Helper function to get all the grid entities with type `GridEntityType.GRID_DECORATION` and the given variant.
---@param decorationVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityDecoration[]
function TSIL.GridSpecific.GetDecorations(decorationVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_DECORATION,
        decorationVariant,
        function (gridEntity)
            return gridEntity:ToDecoration()
        end
    )
end


--- Helper function to get all the grid entities with type `GridEntityType.GRID_FIREPLACE` and the given variant.
---
--- Keep in mind that fires are actually entities with on top of an invisible grid entity.
---@param fireVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityFire[]
function TSIL.GridSpecific.GetFires(fireVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_FIREPLACE,
        fireVariant,
        function (gridEntity)
            return gridEntity:ToFire()
        end
    )
end


--- Helper function to get all the grid entities with type `GridEntityType.GRID_GRAVITY` and the given variant.
---@param gravityVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityGravity[]
function TSIL.GridSpecific.GetGravities(gravityVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_GRAVITY,
        gravityVariant,
        function (gridEntity)
            return gridEntity:ToGravity()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_PIT` and the given variant.
---@param pitVariant PitVariant? @Default: -1. Which matches all variants.
---@return GridEntityPit[]
function TSIL.GridSpecific.GetPits(pitVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_PIT,
        pitVariant,
        function (gridEntity)
            return gridEntity:ToPit()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_POOP` and the given variant.
---@param poopVariant GridPoopVariant? @Default: -1. Which matches all variants.
---@return GridEntityPoop[]
function TSIL.GridSpecific.GetPoops(poopVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_POOP,
        poopVariant,
        function (gridEntity)
            return gridEntity:ToPoop()
        end
    )
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_PRESSURE_PLATE` and the given variant.
---@param pressurePlateVariant PressurePlateVariant? @Default: -1. Which matches all variants.
---@return GridEntityPressurePlate[]
function TSIL.GridSpecific.GetPressurePlates(pressurePlateVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_PRESSURE_PLATE,
        pressurePlateVariant,
        function (gridEntity)
            return gridEntity:ToPressurePlate()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_ROCK` and the given variant.
---@param rockVariant RockVariant? @Default: -1. Which matches all variants.
---@return GridEntityPoop[]
function TSIL.GridSpecific.GetRocks(rockVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_ROCK,
        rockVariant,
        function (gridEntity)
            return gridEntity:ToRock()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_SPIKES` and the given variant.
---@param spikeVariant integer? @Default: -1. Which matches all variants.
---@return GridEntitySpikes[]
function TSIL.GridSpecific.GetSpikes(spikeVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_SPIKES,
        spikeVariant,
        function (gridEntity)
            return gridEntity:ToRock()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_STAIRS` and the given variant.
---@param stairsVariant StairsVariant? @Default: -1. Which matches all variants.
---@return GridEntityStairs[]
function TSIL.GridSpecific.GetStairs(stairsVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_STAIRS,
        stairsVariant,
        function (gridEntity)
            return gridEntity:ToStairs()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_STATUE` and the given variant.
---@param statueVariant StatueVariant? @Default: -1. Which matches all variants.
---@return GridEntityStatue[]
function TSIL.GridSpecific.GetStatues(statueVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_STATUE,
        statueVariant,
        function (gridEntity)
            return gridEntity:ToStatue()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_TNT` and the given variant.
---@param TNTVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityTNT[]
function TSIL.GridSpecific.GetTNTs(TNTVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_TNT,
        TNTVariant,
        function (gridEntity)
            return gridEntity:ToTNT()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_TRAPDOOR` and the given variant.
---@param trapdoorVariant TrapdoorVariant? @Default: -1. Which matches all variants.
---@return GridEntityTrapDoor[]
function TSIL.GridSpecific.GetTrapdoors(trapdoorVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_TRAPDOOR,
        trapdoorVariant,
        function (gridEntity)
            return gridEntity:ToTrapDoor()
        end
    )
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_WALL` and the given variant.
---@param wallVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityWall[]
function TSIL.GridSpecific.GetWalls(wallVariant)
    return GetAllGridEntitiesOfTypeAndVariant(
        GridEntityType.GRID_WALL,
        wallVariant,
        function (gridEntity)
            return gridEntity:ToWall()
        end
    )
end