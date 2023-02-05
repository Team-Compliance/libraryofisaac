--- Helper function to get all of the bombs in the room. (Specifically, this refers to the `EntityBomb` class, not bomb pickups.)
---@param bombVariant BombVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityBomb[]
function TSIL.EntitySpecific.GetBombs(bombVariant, subType)
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


--- Helper function to get all of the effects in the room.
---@param effectVariant EffectVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityEffect[]
function TSIL.EntitySpecific.GetEffects(effectVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_EFFECT, effectVariant, subType)

	local effects = {}

	for _, v in pairs(entities) do
		local effect = v:ToEffect()
		if effect then
			table.insert(effects, effect)
		end
	end

	return effects
end


--- Helper function to get all of the familiars in the room.
---@param familiarVariant FamiliarVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityFamiliar[]
function TSIL.EntitySpecific.GetFamiliars(familiarVariant, subType)
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


--- Helper function to get all of the knives in the room.
---@param knifeVariant KnifeVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
function TSIL.EntitySpecific.GetKnives(knifeVariant, subType)
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


--- Helper function to get all of the lasers in the room.
---@param laserVariant LaserVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityLaser[]
function TSIL.EntitySpecific.GetLasers(laserVariant, subType)
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


--- Helper function to get all of the NPCs in the room.
---@param entityType EntityType|integer? @Default: -1 | Default is -1, which matches all types.
---@param variant integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@param ignoreFriendly boolean? @Default: false | If set to true, it will exclude friendly NPCs from being returned. Default is false. Will only be taken into account if the `entityType` is specified.
---@return EntityNPC[]
function TSIL.EntitySpecific.GetNPCs(entityType, variant, subType, ignoreFriendly)
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


--- Helper function to get all of the pickups in the room.
---@param pickupVariant PickupVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityPickup[]
function TSIL.EntitySpecific.GetPickups(pickupVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_PICKUP, pickupVariant, subType)
	local pickups = {}

	for _, v in pairs(entities) do
		local pickup = v:ToPickup()
		if pickup then
			table.insert(pickups, pickup)
		end
	end

	return pickups
end


--- Helper function to get all of the projectiles in the room.
---@param projectileVariant ProjectileVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityProjectile[]
function TSIL.EntitySpecific.GetProjectiles(projectileVariant, subType)
	local entities = TSIL.Entities.GetEntities(EntityType.ENTITY_PROJECTILE, projectileVariant, subType)
	local projectiles = {}

	for _, v in pairs(entities) do
		local projectile = v:ToProjectile()
		if projectile then
			table.insert(projectiles, projectile)
		end
	end

	return projectiles
end


--- Helper function to get all of the slots in the room.
---@param slotVariant SlotVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return Entity[]
function TSIL.EntitySpecific.GetSlots(slotVariant, subType)
	local slots = TSIL.Entities.GetEntities(EntityType.ENTITY_SLOT, slotVariant, subType)
	return slots
end


--- Helper function to get all of the tears in the room.
---@param tearVariant TearVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityTear[]
function TSIL.EntitySpecific.GetTears(tearVariant, subType)
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