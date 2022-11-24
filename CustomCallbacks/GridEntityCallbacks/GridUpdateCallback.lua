--##POST_GRID_ENTITY_UPDATE

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	function (functionParams, optionalParams)
		---@type GridEntity
		local gridEntity = functionParams[1]

		local targetType = optionalParams[1]
		local targetVariant = optionalParams[1]

		return (TSIL.__IsDefaultParam(targetType) or gridEntity:GetType() == targetType) and
		(TSIL.__IsDefaultParam(targetVariant) or gridEntity:GetVariant() == targetVariant)
	end
)


local function OnFrameUpdate()
	local gridEntities = TSIL.GridEntities.GetGridEntities()

	for _, gridEntity in ipairs(gridEntities) do
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE, gridEntity)
	end
end
TSIL.__AddInternalVanillaCallback(
	"GRID_UPDATE_CALLBACK_POST_UPDATE",
	ModCallbacks.MC_POST_UPDATE,
	OnFrameUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)