--##use Players/Inventory/PlayerInventory.lua
--##POST_PLAYER_COLLECTIBLE_ADDED

TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_ADDED,
	function (functionParams, optionalParams)
		---@type EntityPlayer
		local player = functionParams[1]
		local collectibleType = functionParams[2]

		local targetPlayerType = optionalParams[1]
		local targetCollectibleType = optionalParams[2]

		return (TSIL.__IsDefaultParam(targetPlayerType) or player:GetPlayerType() == targetPlayerType) and
		(TSIL.__IsDefaultParam(targetCollectibleType) or collectibleType == targetCollectibleType)
	end
)