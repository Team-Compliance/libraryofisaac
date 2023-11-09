---@type table<PlayerType, ConversionHeartSubType>
local characterHealthConversionMap = {}
local initialized = false

---@param player EntityPlayer
---@param heartSubType ConversionHeartSubType
local function convertRedHeartContainers(player, heartSubType)
	local maxHearts = player:GetMaxHearts()

	if maxHearts <= 0 then
		return
	end

	player:AddMaxHearts(maxHearts * -1, false)

	if heartSubType == TSIL.Enums.ConversionHeartSubType.SOUL then
		player:AddSoulHearts(maxHearts)
	elseif heartSubType == TSIL.Enums.ConversionHeartSubType.BLACK then
		player:AddBlackHearts(maxHearts)
	end
end

---@param player EntityPlayer
local function removeRedHearts(player)
	local hearts = player:GetHearts()
	player:AddHearts(hearts * -1)
end

---@param player EntityPlayer
local function onPEffectUpdate(_, player)
	local playerType = player:GetPlayerType()
	local conversionHeartSubType = characterHealthConversionMap[playerType]

	if conversionHeartSubType then
		convertRedHeartContainers(player, conversionHeartSubType)
		removeRedHearts(player)
	end
end

---@param pickup EntityPickup
---@param collider Entity
local function onHeartCollision(_, pickup, collider)
	if not TSIL.Pickups.IsRedHeart(pickup) then
		return
	end

	local player = collider:ToPlayer()

	if not player then
		return
	end

	local character = player:GetPlayerType()
	local conversionHeartSubType = characterHealthConversionMap[character]

	if conversionHeartSubType then
		return false
	end
end

local function registerCallbacks() end

--- Causes the provided player type to have their health be converted to the provided heart
--- sub-type. This is the same mechanic that certain characters use for converting health, such as
--- Blue Baby having red heart containers being converted into soul hearts.
---@param playerType PlayerType
---@param conversionHeartSubType ConversionHeartSubType
function TSIL.Players.RegisterCharacterHealthConversion(playerType, conversionHeartSubType)
	if not initialized then
		initialized = true
		registerCallbacks()
	end

	characterHealthConversionMap[playerType] = conversionHeartSubType
end

TSIL.__AddInternalCallback(
	"CHARACTER_HEALTH_CONVERSION_PEFFECT_UPDATE_REORDERED",
	TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
	onPEffectUpdate
)

TSIL.__AddInternalCallback(
	"CHARACTER_HEALTH_CONVERSION_PRE_PICKUP_COLLISION",
	ModCallbacks.MC_PRE_PICKUP_COLLISION,
	onHeartCollision,
	PickupVariant.PICKUP_HEART
)
