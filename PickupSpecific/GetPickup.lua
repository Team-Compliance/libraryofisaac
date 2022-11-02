---Helper function to get all the batteries in the room.
---@param batterySubtype BatterySubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetBatteries(batterySubtype)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_LIL_BATTERY, batterySubtype)
end


---Helper function to get all the bomb pickups in the room.
---@param bombSubtype? BombSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetBombPickups(bombSubtype)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_BOMB, bombSubtype)
end


---Helper function to get all the cards in the room.
---@param cardType? Card
---@return EntityPickup[]
function TSIL.PickupSpecific.GetCards(cardType)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_TAROTCARD, cardType)
end


---Helper function to get all the coins in the room.
---@param coinSubtype? CoinSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetCoins(coinSubtype)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_COIN, coinSubtype)
end


---Helper function to get all the collectibles in the room.
---@param collectibleType? CollectibleType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetCollectibles(collectibleType)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_COLLECTIBLE, collectibleType)
end


---Helper function to get all the hearts in the room.
---@param heartSubtype? HeartSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetHearts(heartSubtype)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_HEART, heartSubtype)
end


---Helper function to get all the keys in the room.
---@param keySubtype? KeySubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetKeys(keySubtype)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_KEY, keySubtype)
end


---Helper function to get all the pills in the room.
---@param pillColor? PillColor
---@return EntityPickup[]
function TSIL.PickupSpecific.GetPills(pillColor)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_PILL, pillColor)
end


---Helper function to get all the sacks in the room.
---@param sackSubtype? SackSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetSacks(sackSubtype)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_GRAB_BAG, sackSubtype)
end


---Helper function to get all the trinkets in the room.
---@param trinketType? TrinketType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetTrinket(trinketType)
    return TSIL.EntitySpecific.GetPickups(PickupVariant.PICKUP_TRINKET, trinketType)
end