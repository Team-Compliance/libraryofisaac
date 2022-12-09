--##POST_GRID_ENTITY_UPDATE

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)


local function OnFrameUpdate()
	local gridEntities = TSIL.GridEntities.GetGridEntities()

	for _, gridEntity in ipairs(gridEntities) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE, gridEntity)
	end
end
TSIL.__AddInternalCallback(
	"GRID_UPDATE_CALLBACK_POST_UPDATE",
	ModCallbacks.MC_POST_UPDATE,
	OnFrameUpdate
)