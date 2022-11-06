--##POST_GRID_ENTITY_INIT

local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList
local GridInRoom = {}

local function OnNewRoom()
	local tableUtils = TSIL.Utils.Tables

	local GridInitCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
		return CustomCallback.Callback == TSIL.Enums.CustomCallback.POST_GRID_ENTITY_INIT
	end)

	GridInRoom = {}

	local gridEntities = TSIL.GridEntities.GetGridEntities()

	tableUtils.ForEach(gridEntities, function(_, gridEntity)
		GridInRoom[gridEntity:GetGridIndex()] = gridEntity

		--Check if the callback has subscriptions here, so we still add the grid entities to the list
		if not GridInitCallbacks then return end

		local filteredCallbacks = tableUtils.Filter(GridInitCallbacks.Functions, function(_, customCallback)
			local targetGridEntityType = customCallback.OptionalParam[1]
			local targetGridEntityVariant = customCallback.OptionalParam[2]
			return (targetGridEntityType == nil or targetGridEntityType == gridEntity:GetType()) and
			(targetGridEntityVariant == nil or targetGridEntityVariant == gridEntity:GetVariant())
		end)

		tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
			customCallback.Funct(customCallback.Mod, gridEntity, false)
		end)
	end)
end
TSIL.__AddInternalVanillaCallback(
	"GRID_INIT_CALLBACK_NEW_ROOM",
	ModCallbacks.POST_NEW_ROOM,
	OnNewRoom,
	TSIL.Enums.CallbackPriority.MEDIUM
)


local function OnFrameUpdate()
	local tableUtils = TSIL.Utils.Tables

	local room = Game():GetRoom()
	for gridIndex, _ in pairs(GridInRoom) do
		if not room:GetGridEntity(gridIndex) then
			GridInRoom[gridIndex] = nil
		end
	end

	local gridEntities = TSIL.GridEntities.GetGridEntities()

	local GridInitCallbacks = tableUtils.FindFirst(CustomCallbacksList, function (_, CustomCallback)
		return CustomCallback.Callback == TSIL.Enums.CustomCallback.POST_GRID_ENTITY_INIT
	end)

	tableUtils.ForEach(gridEntities, function(_, gridEntity)
		local gridIndex = gridEntity:GetGridIndex()
		local prevGridEntity = GridInRoom[gridIndex]

		if prevGridEntity == nil or
			(prevGridEntity:GetType() == gridEntity:GetType() and
			prevGridEntity:GetType() == gridEntity:GetType()) then
				return
			end

		GridInRoom[gridIndex] = gridEntity

		--Check if the callback has subscriptions here, so we still add the grid entities to the list
		if not GridInitCallbacks then return end

		local filteredCallbacks = tableUtils.Filter(GridInitCallbacks.Functions, function(_, customCallback)
			local targetGridEntityType = customCallback.OptionalParam[1]
			local targetGridEntityVariant = customCallback.OptionalParam[2]
			return (targetGridEntityType == nil or targetGridEntityType == gridEntity:GetType()) and
			(targetGridEntityVariant == nil or targetGridEntityVariant == gridEntity:GetVariant())
		end)

		tableUtils.ForEach(filteredCallbacks, function(_, customCallback)
			customCallback.Funct(customCallback.Mod, gridEntity, true)
		end)
	end)
end
TSIL.__AddInternalVanillaCallback(
	"GRID_INIT_CALLBACK_POST_UPDATE",
	ModCallbacks.POST_UPDATE,
	OnFrameUpdate,
	TSIL.Enums.CallbackPriority.MEDIUM
)