--- Helper function to get all of the tears in the room.
--- @param tearVariant TearVariant|integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
--- @return EntityTear[]
function TSIL.Entities.GetTears(tearVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_TEAR, tearVariant, subType)
	local tears = {}

	for _, v in pairs(entities) do
		local tear = v:ToTear()
		if tear then
			table.insert(tears, tear)
		end
	end

	return tears
end