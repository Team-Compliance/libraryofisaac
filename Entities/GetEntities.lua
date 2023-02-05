--- Helper function to get all of the entities in the room or all of the entities tht match a specific entity type / variant / sub-type.
--- Due to bugs with `Isaac.FindInRadius`, this function uses `Isaac.GetRoomEntities`, which is more expensive but is also more robust.
--- (If a matching entity type is provided, then `Isaac.FindByType` will be used instead.)
---@param entityType EntityType|integer? @Default: -1 | If specified, will only get the entities that match the type. Default is -1, which matches every type.
---@param variant integer? @Default: -1 | If specified, will only get the entities that match the variant. Default is -1, which matches every variant.
---@param subType integer? @Default: -1 | If specified, will only get the entities that match the sub-type. Default is -1, which matches every sub-type.
---@param ignoreFriendly boolean? @Default: false | If set to true, it will exclude friendly NPCs from being returned. Will only be taken into account if the `entityType` is specified.
---@return Entity[]
function TSIL.Entities.GetEntities(entityType, variant, subType, ignoreFriendly)
	entityType = entityType or -1
	variant = variant or -1
	subType = subType or -1

	if ignoreFriendly == nil then
		ignoreFriendly = false
	end

	if entityType == -1 then
		return Isaac.GetRoomEntities()
	end

	--- @diagnostic disable-next-line: param-type-mismatch
	return Isaac.FindByType(entityType, variant, subType, ignoreFriendly)
end