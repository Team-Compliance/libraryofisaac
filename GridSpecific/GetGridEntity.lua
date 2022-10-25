--- Helper function to get all grid entities with type `GridEntityType.GRID_STAIRS` and the given variant.
---@param crawlSpaceVariant CrawlSpaceVariant? @ Default : -1. Which matches all variants.
---@return GridEntity[]
function TSIL.GridSpecific.GetCrawlSpaces(crawlSpaceVariant)
    if not crawlSpaceVariant then
        ---@diagnostic disable-next-line: cast-local-type
        crawlSpaceVariant = -1
    end

    local crawlSpaces = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_STAIRS)

    if crawlSpaceVariant == -1 then
        return crawlSpaces
    else
        return TSIL.Utils.Tables.Filter(crawlSpaces, function (_, crawlSpace)
            return crawlSpace:GetVariant() == crawlSpaceVariant
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_PIT` and the given variant.
---@param pitVariant PitVariant? @ Default : -1. Which matches all variants.
---@return GridEntityPit[]
function TSIL.GridSpecific.GetPits(pitVariant)
    if not pitVariant then
        ---@diagnostic disable-next-line: cast-local-type
        pitVariant = -1
    end

    local pits = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_PIT)

    if pitVariant == -1 then
        return pits
    else
        local filteredPits = TSIL.Utils.Tables.Filter(pits, function (_, pit)
            return pit:GetVariant() == pitVariant
        end)

        return TSIL.Utils.Tables.Map(filteredPits, function (_, pit)
            return pit:ToPit()
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_POOP` and the given variant.
---@param poopVariant PoopGridEntityVariant? @ Default : -1. Which matches all variants.
---@return GridEntityPoop[]
function TSIL.GridSpecific.GetPoops(poopVariant)
    if not poopVariant then
        ---@diagnostic disable-next-line: cast-local-type
        poopVariant = -1
    end

    local poops = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_POOP)

    if poopVariant == -1 then
        return poops
    else
        local filteredPoops = TSIL.Utils.Tables.Filter(poops, function (_, poop)
            return poop:GetVariant() == poopVariant
        end)

        return TSIL.Utils.Tables.Map(filteredPoops, function (_, poop)
            return poop:ToPoop()
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_PRESSURE_PLATE` and the given variant.
---@param pressurePlateVariant PressurePlateVariant? @ Default : -1. Which matches all variants.
---@return GridEntityPressurePlate[]
function TSIL.GridSpecific.GetPressurePlates(pressurePlateVariant)
    if not pressurePlateVariant then
        ---@diagnostic disable-next-line: cast-local-type
        pressurePlateVariant = -1
    end

    local pressurePlates = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_PRESSURE_PLATE)

    if pressurePlateVariant == -1 then
        return pressurePlates
    else
        local filteredPressurePlates = TSIL.Utils.Tables.Filter(pressurePlates, function (_, pressurePlate)
            return pressurePlate:GetVariant() == pressurePlateVariant
        end)

        return TSIL.Utils.Tables.Map(filteredPressurePlates, function (_, pressurePlate)
            return pressurePlate:ToPressurePlate()
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_ROCK` and the given variant.
---@param rockVariant RockVariant? @ Default : -1. Which matches all variants.
---@return GridEntityRock[]
function TSIL.GridSpecific.GetRocks(rockVariant)
    if not rockVariant then
        ---@diagnostic disable-next-line: cast-local-type
        rockVariant = -1
    end

    local rocks = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_ROCK)

    if rockVariant == -1 then
        return rocks
    else
        local filteredRocks = TSIL.Utils.Tables.Filter(rocks, function (_, rock)
            return rock:GetVariant() == rockVariant
        end)

        return TSIL.Utils.Tables.Map(filteredRocks, function (_, rock)
            return rock:ToRock()
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_SPIKES` and the given variant.
---@param spikesVariant integer? @ Default : -1. Which matches all variants.
---@return GridEntitySpikes[]
function TSIL.GridSpecific.GetSpikes(spikesVariant)
    if not spikesVariant then
        spikesVariant = -1
    end

    local spikes = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_SPIKES)

    if spikesVariant == -1 then
        return spikes
    else
        local filteredSpikes = TSIL.Utils.Tables.Filter(spikes, function (_, spike)
            return spike:GetVariant() == spikesVariant
        end)

        return TSIL.Utils.Tables.Map(filteredSpikes, function (_, spike)
            return spike:ToSpikes()
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_TNT` and the given variant.
---@param TNTVariant integer? @ Default : -1. Which matches all variants.
---@return GridEntityTNT[]
function TSIL.GridSpecific.GetTNTs(TNTVariant)
    if not TNTVariant then
        TNTVariant = -1
    end

    local TNTs = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_TNT)

    if TNTVariant == -1 then
        return TNTs
    else
        local filteredTNTs = TSIL.Utils.Tables.Filter(TNTs, function (_, TNT)
            return TNT:GetVariant() == TNTVariant
        end)

        return TSIL.Utils.Tables.Map(filteredTNTs, function (_, TNT)
            return TNT:ToTNT()
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_TELEPORTER` and the given variant.
---@param teleporterVariant integer? @ Default : -1. Which matches all variants.
---@return GridEntity[]
function TSIL.GridSpecific.GetTeleporters(teleporterVariant)
    if not teleporterVariant then
        teleporterVariant = -1
    end

    local teleporters = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_TELEPORTER)

    if teleporterVariant == -1 then
        return teleporters
    else
        return TSIL.Utils.Tables.Filter(teleporters, function (_, teleporter)
            return teleporter:GetVariant() == teleporterVariant
        end)
    end
end


--- Helper function to get all grid entities with type `GridEntityType.GRID_TRAPDOOR` and the given variant.
---@param trapdoorVariant TrapdoorVariant? @ Default : -1. Which matches all variants.
---@return GridEntity[]
function TSIL.GridSpecific.GetTrapdoors(trapdoorVariant)
    if not trapdoorVariant then
        ---@diagnostic disable-next-line: cast-local-type
        trapdoorVariant = -1
    end

    local trapdoors = TSIL.GridEntities.GetGridEntities(false, GridEntityType.GRID_TRAPDOOR)

    if trapdoorVariant == -1 then
        return trapdoors
    else
        return TSIL.Utils.Tables.Filter(trapdoors, function (_, trapdoor)
            return trapdoor:GetVariant() == trapdoorVariant
        end)
    end
end