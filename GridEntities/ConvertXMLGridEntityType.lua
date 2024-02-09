local GridEntityXMLMap = {
	[TSIL.Enums.GridEntityXMLType.DECORATION] = {GridEntityType.GRID_DECORATION, 0},
	[TSIL.Enums.GridEntityXMLType.ROCK] = {GridEntityType.GRID_ROCK, TSIL.Enums.RockVariant.NORMAL},
	[TSIL.Enums.GridEntityXMLType.ROCK_BOMB] = {GridEntityType.GRID_ROCK_BOMB, 0},
	[TSIL.Enums.GridEntityXMLType.ROCK_ALT] = {GridEntityType.GRID_ROCK_ALT, 0},
	[TSIL.Enums.GridEntityXMLType.ROCK_TINTED] = {GridEntityType.GRID_ROCKT, 0},
	[TSIL.Enums.GridEntityXMLType.ROCK_ALT_2] = {GridEntityType.GRID_ROCK_ALT2, 0},
	[TSIL.Enums.GridEntityXMLType.ROCK_EVENT] = {GridEntityType.GRID_ROCK_ALT2, TSIL.Enums.RockVariant.EVENT},
	[TSIL.Enums.GridEntityXMLType.ROCK_SPIKED] = {GridEntityType.GRID_ROCK_SPIKED, 0},
	[TSIL.Enums.GridEntityXMLType.ROCK_GOLD] = {GridEntityType.GRID_ROCK_GOLD, 0},
	[TSIL.Enums.GridEntityXMLType.TNT] = {GridEntityType.GRID_TNT, 0},
	[TSIL.Enums.GridEntityXMLType.POOP_RED] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.RED},
	[TSIL.Enums.GridEntityXMLType.POOP_RAINBOW] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.RAINBOW},
	[TSIL.Enums.GridEntityXMLType.POOP_CORN] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.CORN},
	[TSIL.Enums.GridEntityXMLType.POOP_GOLDEN] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.GOLDEN},
	[TSIL.Enums.GridEntityXMLType.POOP_BLACK] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.BLACK},
	[TSIL.Enums.GridEntityXMLType.POOP_WHITE] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.WHITE},
	[TSIL.Enums.GridEntityXMLType.POOP] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.NORMAL},
	[TSIL.Enums.GridEntityXMLType.POOP_CHARMING] = {GridEntityType.GRID_POOP, TSIL.Enums.PoopGridEntityVariant.CHARMING},
	[TSIL.Enums.GridEntityXMLType.BLOCK] = {GridEntityType.GRID_ROCKB, 0},
	[TSIL.Enums.GridEntityXMLType.PILLAR] = {GridEntityType.GRID_PILLAR, 0},
	[TSIL.Enums.GridEntityXMLType.SPIKES] = {GridEntityType.GRID_SPIKES, 0},
	[TSIL.Enums.GridEntityXMLType.SPIKES_ON_OFF] = {GridEntityType.GRID_SPIKES_ONOFF, 0},
	[TSIL.Enums.GridEntityXMLType.SPIDER_WEB] = {GridEntityType.GRID_SPIDERWEB, 0},
	[TSIL.Enums.GridEntityXMLType.WALL] = {GridEntityType.GRID_WALL, 0},
	[TSIL.Enums.GridEntityXMLType.PIT] = {GridEntityType.GRID_PIT, TSIL.Enums.PitVariant.NORMAL},
	[TSIL.Enums.GridEntityXMLType.FISSURE_SPAWNER] = {GridEntityType.GRID_PIT, TSIL.Enums.PitVariant.FISSURE_SPAWNER},
	[TSIL.Enums.GridEntityXMLType.PIT_EVENT] = {GridEntityType.GRID_PIT, TSIL.Enums.PitVariant.NORMAL},
	[TSIL.Enums.GridEntityXMLType.LOCK] = {GridEntityType.GRID_LOCK, 0},
	[TSIL.Enums.GridEntityXMLType.PRESSURE_PLATE] = {GridEntityType.GRID_PRESSURE_PLATE, TSIL.Enums.PressurePlateVariant.PRESSURE_PLATE},
	[TSIL.Enums.GridEntityXMLType.STATUE_DEVIL] = {GridEntityType.GRID_STATUE, TSIL.Enums.StatueVariant.DEVIL},
	[TSIL.Enums.GridEntityXMLType.STATUE_ANGEL] = {GridEntityType.GRID_STATUE, TSIL.Enums.StatueVariant.ANGEL},
	[TSIL.Enums.GridEntityXMLType.TELEPORTER] = {GridEntityType.GRID_TELEPORTER, 0},
	[TSIL.Enums.GridEntityXMLType.TRAPDOOR] = {GridEntityType.GRID_TRAPDOOR, 0},
	[TSIL.Enums.GridEntityXMLType.CRAWL_SPACE] = {GridEntityType.GRID_STAIRS, TSIL.Enums.StairsVariant.NORMAL},
	[TSIL.Enums.GridEntityXMLType.GRAVITY] = {GridEntityType.GRID_GRAVITY, 0},
}

--- Helper function to convert the grid entity type found in a room XML file to the corresponding
--- grid entity type and variant normally used by the game. For example, a rock is represented as
--- 1000.0 in a room XML file, but `GridEntityType.GRID_ROCK` is equal to 2.
---@param gridEntityXMLType GridEntityXMLType
---@param gridEntityXMLVariant integer
---@return {type : GridEntityType, variant : integer}
function TSIL.GridEntities.ConvertXMLGridEntityType(gridEntityXMLType, gridEntityXMLVariant)
	local gridEntityVariantPair = GridEntityXMLMap[gridEntityXMLType]

	if not gridEntityVariantPair then
		error("Cannot find corresponding GridEntityType for the XML grid entity type:" .. gridEntityXMLType)
	end

	local gridEntityType = gridEntityVariantPair[1]
	local gridEntityVariant = gridEntityVariantPair[2]

	if gridEntityType == GridEntityType.GRID_SPIKES_ONOFF or
	gridEntityType == GridEntityType.GRID_PRESSURE_PLATE or
	gridEntityType == GridEntityType.GRID_TELEPORTER then
		gridEntityVariant = gridEntityXMLVariant
	end

	return {
		type = gridEntityType,
		variant = gridEntityVariant
	}
end