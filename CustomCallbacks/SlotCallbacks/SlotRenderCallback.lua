--##POST_SLOT_RENDER

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_RENDER,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]

		local targetVariant = optionalParams[1]
		local targetSubType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant) and
		(TSIL.__IsDefaultParam(targetSubType) or slot.SubType == targetSubType)
	end
)

local function OnRender()
	local slots = Isaac.FindByType(EntityType.ENTITY_SLOT)

	for _, slot in ipairs(slots) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_RENDER, slot)
	end
end

TSIL.__AddInternalVanillaCallback(
	"SLOT_RENDER_CALLBACK_POST_RENDER",
	ModCallbacks.MC_POST_RENDER,
	OnRender,
	TSIL.Enums.CallbackPriority.MEDIUM
)