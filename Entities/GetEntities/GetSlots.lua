--- Helper function to get all of the slots in the room.
--- @param slotVariant SlotVariant|integer? Optional. Default is -1, which matches all variants.
--- @param subType integer? Optional. Default is -1, which matches all sub-types.
--- @return Entity[]
--- @within TSIL.Entities
function TSIL.Entities.GetSlots(slotVariant, subType)
	local slots = TSIL.Entities.GetEntities(EntityType.ENTITY_SLOT, slotVariant, subType)
	return slots
end