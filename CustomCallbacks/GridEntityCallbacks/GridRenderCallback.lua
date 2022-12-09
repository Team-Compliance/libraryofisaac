--##POST_GRID_ENTITY_RENDER

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)


local function OnRender()
	local gridEntities = TSIL.GridEntities.GetGridEntities()

	for _, gridEntity in ipairs(gridEntities) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_ENTITY_RENDER, gridEntity)
	end
end
TSIL.__AddInternalCallback(
	"GRID_RENDER_CALLBACK_POST_RENDER",
	ModCallbacks.MC_POST_RENDER,
	OnRender
)