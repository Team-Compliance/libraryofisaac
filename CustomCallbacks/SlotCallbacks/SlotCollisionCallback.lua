--##POST_SLOT_ANIMATION_CHANGED
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
	function (functionParams, optionalParams)
		---@type Entity
		local slot = functionParams[1]
        ---@type EntityPlayer
        local player = functionParams[2]

		local targetVariant = optionalParams[1]
		local targetSubType = optionalParams[2]
        local targetPlayerType = optionalParams[3]

		return (TSIL.__IsDefaultParam(targetVariant) or slot.Variant == targetVariant) and
		(TSIL.__IsDefaultParam(targetSubType) or slot.SubType == targetSubType) and
        (TSIL.__IsDefaultParam(targetPlayerType) or player:GetPlayerType() == targetPlayerType)
	end
)


---@param player EntityPlayer
---@param collider Entity
local function OnPlayerCollision(_, player, collider)
    if collider.Type == EntityType.ENTITY_SLOT then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_SLOT_COLLISION, collider, player)
    end
end
TSIL.__AddInternalVanillaCallback(
    "PRE_SLOT_COLLISION_CALLBACK_PRE_PLAYER_COLLISION",
    ModCallbacks.MC_PRE_PLAYER_COLLISION,
    OnPlayerCollision,
    TSIL.Enums.CallbackPriority.MEDIUM
)