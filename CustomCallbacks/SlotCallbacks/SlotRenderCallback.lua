--##POST_SLOT_RENDER
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_RENDER,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE
)


local function OnRender()
	local slots = Isaac.FindByType(EntityType.ENTITY_SLOT)

	for _, slot in ipairs(slots) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_SLOT_RENDER, slot)
	end
end
TSIL.__AddInternalCallback(
	"SLOT_RENDER_CALLBACK_POST_RENDER",
	ModCallbacks.MC_POST_RENDER,
	OnRender
)