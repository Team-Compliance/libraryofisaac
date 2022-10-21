--- Helper function to get all of the lasers in the room.
--- @param laserVariant LaserVariant|integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
--- @return EntityLaser[]
--- @within TSIL.Entities
function TSIL.Entities.GetLasers(laserVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_LASER, laserVariant, subType)
	local lasers = {}

	for _, v in pairs(entities) do
		local laser = v:ToLaser()
		if laser then
			table.insert(lasers, laser)
		end
	end

	return lasers
end