--##POST_SLOT_UPDATE

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_UPDATE,
	TSIL.Enums.CallbackReturnMode.NONE,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]

		local targetVariant = optionalParams[1]
		local targetSubType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant) and
		(TSIL.__IsDefaultParam(targetSubType) or slot.SubType == targetSubType)
	end
)

local function OnFrameUpdate()
	local slots = Isaac.FindByType(EntityType.ENTITY_SLOT)

	for _, slot in ipairs(slots) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_UPDATE, slot)
	end
end

TSIL.__AddInternalVanillaCallback(
	"SLOT_UPDATE_CALLBACK_POST_UPDATE",
	ModCallbacks.MC_POST_UPDATE,
	OnFrameUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)