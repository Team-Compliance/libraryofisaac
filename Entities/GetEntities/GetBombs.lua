--- Helper function to get all of the bombs in the room. (Specifically, this refers to the `EntityBomb` class, not bomb pickups.)
--- @param bombVariant BombVariant|integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
--- @return EntityBomb[]
function TSIL.Entities.GetBombs(bombVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_BOMB, bombVariant, subType)

	local bombs = {}

	for _, v in pairs(entities) do
		local bomb = v:ToBomb()
		if bomb then
			table.insert(bombs, bomb)
		end
	end

	return bombs
end