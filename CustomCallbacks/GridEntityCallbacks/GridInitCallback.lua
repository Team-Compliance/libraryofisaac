--##POST_GRID_ENTITY_INIT

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_INIT,
	TSIL.Enums.CallbackReturnMode.NONE,
	TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT
)

---@type table<integer, integer>
local GridInRoom = {}

local function OnNewRoom()
	GridInRoom = {}

	local gridEntities = TSIL.GridEntities.GetGridEntities()

	for _, gridEntity in ipairs(gridEntities) do
		GridInRoom[gridEntity:GetGridIndex()] = GetPtrHash(gridEntity)

		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_ENTITY_INIT, gridEntity, false)
	end
end
TSIL.__AddInternalCallback(
	"GRID_INIT_CALLBACK_NEW_ROOM",
	ModCallbacks.MC_POST_NEW_ROOM,
	OnNewRoom
)


local function OnFrameUpdate()
	local room = Game():GetRoom()
	for gridIndex, _ in pairs(GridInRoom) do
		if not room:GetGridEntity(gridIndex) then
			GridInRoom[gridIndex] = nil
		end
	end
end
TSIL.__AddInternalCallback(
	"GRID_INIT_CALLBACK_POST_UPDATE",
	ModCallbacks.MC_POST_UPDATE,
	OnFrameUpdate
)


---@param gridEntity GridEntity
local function OnGridEntityUpdate(_, gridEntity)
	local gridIndex = gridEntity:GetGridIndex()
	local gridEntityHash = GetPtrHash(gridEntity)
	local prevGridEntity = GridInRoom[gridIndex]

	if not prevGridEntity or gridEntityHash ~= prevGridEntity then
		TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_GRID_ENTITY_INIT, gridEntity, true)
	end

	GridInRoom[gridIndex] = gridEntityHash
end
TSIL.__AddInternalCallback(
	"GRID_INIT_CALLBACK_GRID_ENTITY_UPDATE",
	TSIL.Enums.CustomCallback.POST_GRID_ENTITY_UPDATE,
	OnGridEntityUpdate
)