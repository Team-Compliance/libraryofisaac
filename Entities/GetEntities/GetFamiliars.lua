--- Helper function to get all of the familiars in the room.
--- @param familiarVariant integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
--- @return EntityFamiliar[]
function TSIL.Entities.GetFamiliars(familiarVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_FAMILIAR, familiarVariant, subType)
	local familiars = {}

	for _, v in pairs(entities) do
		local familiar = v:ToFamiliar()
		if familiar then
			table.insert(familiars, familiar)
		end
	end

	return familiars
end