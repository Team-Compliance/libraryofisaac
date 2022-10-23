--- Helper function to get all of the NPCs in the room.
--- @param entityType EntityType|integer? Optional. Default is -1, which matches all types.
--- @param variant integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
--- @param ignoreFriendly boolean? Optional. If set to true, it will exclude friendly NPCs from being returned. Default is false. Will only be taken into account if the `entityType` is specified.
--- @return EntityNPC[]
function TSIL.Entities.GetNPCs(entityType, variant, subType, ignoreFriendly)
	local entities = TSIL.Entities.GetEntities(entityType, variant, subType, ignoreFriendly)

	local npcs = {}

	for _, v in pairs(entities) do
		local npc = v:ToNPC()
		if npc then
			table.insert(npcs, npc)
		end
	end

	return npcs
end