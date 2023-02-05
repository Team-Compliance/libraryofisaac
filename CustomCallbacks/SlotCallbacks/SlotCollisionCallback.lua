--##POST_SLOT_ANIMATION_CHANGED
TSIL.__RegisterCustomCallback(
	TSIL.Enums.CustomCallback.POST_SLOT_ANIMATION_CHANGED,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT
)


---@param player EntityPlayer
---@param collider Entity
local function OnPlayerCollision(_, player, collider)
    if collider.Type == EntityType.ENTITY_SLOT then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_SLOT_COLLISION, collider, player)
    end
end
TSIL.__AddInternalCallback(
    "PRE_SLOT_COLLISION_CALLBACK_PRE_PLAYER_COLLISION",
    ModCallbacks.MC_PRE_PLAYER_COLLISION,
    OnPlayerCollision
)