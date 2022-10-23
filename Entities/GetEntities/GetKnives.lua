--- Helper function to get all of the knives in the room.
--- @param knifeVariant KnifeVariant|integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
function TSIL.Entities.GetKnives(knifeVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_KNIFE, knifeVariant, subType)
	local knives = {}

	for _, v in pairs(entities) do
		local knife = v:ToKnife()
		if knife then
			table.insert(knives, knife)
		end
	end

	return knives
end