--##use Players/Inventory/PlayerInventory.lua
--##POST_PLAYER_GULPED_TRINKET_ADDED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_ADDED,
	function (functionParams, optionalParams)
		---@type EntityPlayer
		local player = functionParams[1]
		local trinketType = functionParams[2]

		local targetPlayerType = optionalParams[1]
		local targetTrinketType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetPlayerType) or player:GetPlayerType() == targetPlayerType) and
		(TSIL.__IsDefaultParam(targetTrinketType) or trinketType == targetTrinketType)
	end
)