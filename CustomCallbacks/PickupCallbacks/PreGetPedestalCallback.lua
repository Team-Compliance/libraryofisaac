--##PRE_GET_PEDESTAL

TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.PRE_GET_PEDESTAL,
    TSIL.Enums.CallbackReturnMode.SKIP_NEXT,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.ENTITY_SUBTYPE
)


---@param collectible EntityPickup
---@param collider Entity
local function PreCollectibleCollision(_, collectible, collider)
    if collectible.SubType == CollectibleType.COLLECTIBLE_NULL then return end

    local player = collider:ToPlayer()
    if player == nil then return end

    local numCoins = player:GetNumCoins()
    if collectible.Price > numCoins then return end

    if collectible.Wait > 0 or player.ItemHoldCooldown > 0 then return end

    if player:IsHoldingItem() then return end

    return TSIL.__TriggerCustomCallback(
        TSIL.Enums.CustomCallback.PRE_GET_PEDESTAL,
        player,
        collectible
    )
end
TSIL.__AddInternalCallback(
    "PRE_GET_PEDESTAL_CALLBACK_ON_PICKUP_COLLISION",
    ModCallbacks.MC_PRE_PICKUP_COLLISION,
    PreCollectibleCollision,
    CallbackPriority.DEFAULT,
    PickupVariant.PICKUP_COLLECTIBLE
)