---Helper function to spawn a battery.
---@param batterySubtype BatterySubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnBattery(batterySubtype, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_LIL_BATTERY,
        batterySubtype,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a bomb pickup.
---@param bombSubtype BombSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnBombPickup(bombSubtype, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_BOMB,
        bombSubtype,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a card.
---@param cardType Card
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnCard(cardType, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_TAROTCARD,
        cardType,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a coin.
---@param coinSubtype CoinSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnCoin(coinSubtype, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_COIN,
        coinSubtype,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a heart.
---@param heartSubtype HeartSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnHeart(heartSubtype, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_HEART,
        heartSubtype,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a key.
---@param keySubtype KeySubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnKey(keySubtype, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_KEY,
        keySubtype,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a pill.
---@param pillColor PillColor
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnPill(pillColor, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_PILL,
        pillColor,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a sack.
---@param sackSubtype SackSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnSack(sackSubtype, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_GRAB_BAG,
        sackSubtype,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end


---Helper function to spawn a trinket.
---@param trinketType TrinketType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnTrinket(trinketType, position, velocity, spawner, seedOrRNG)
    return TSIL.EntitySpecific.SpawnPickup(
        PickupVariant.PICKUP_TRINKET,
        trinketType,
        position,
        velocity,
        spawner,
        seedOrRNG
    )
end