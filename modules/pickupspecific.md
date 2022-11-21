# PickupSpecific

## Overview

| Return Value                                                                  | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ----------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetBatteries](pickupspecific.md#getbatteries)([`BatterySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BatterySubType.html)batterySubtype = -1)                                                                                                                                                                                                                                                                                                                   |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetBombPickups](pickupspecific.md#getbombpickups)([`BombSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BombSubType.html)bombSubtype = -1)                                                                                                                                                                                                                                                                                                                        |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetCards](pickupspecific.md#getcards)([`Card` ](https://wofsauge.github.io/IsaacDocs/rep/enums/Card.html)cardType = -1)                                                                                                                                                                                                                                                                                                                                                     |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetCoins](pickupspecific.md#getcoins)([`CoinSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html)coinSubtype = -1)                                                                                                                                                                                                                                                                                                                                    |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetCollectibles](pickupspecific.md#getcollectibles)([`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)collectibleType = -1)                                                                                                                                                                                                                                                                                                          |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetHearts](pickupspecific.md#gethearts)([`HeartSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/HeartSubType.html)heartSubtype = -1)                                                                                                                                                                                                                                                                                                                               |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetKeys](pickupspecific.md#getkeys)([`KeySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/KeySubType.html)keySubtype = -1)                                                                                                                                                                                                                                                                                                                                         |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetPills](pickupspecific.md#getpills)([`PillColor` ](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)pillColor = -1)                                                                                                                                                                                                                                                                                                                                          |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetSacks](pickupspecific.md#getsacks)([`SackSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/SackSubType.html)sackSubtype = -1)                                                                                                                                                                                                                                                                                                                                    |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetTrinket](pickupspecific.md#gettrinket)([`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)trinketType = -1)                                                                                                                                                                                                                                                                                                                                |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnBattery](pickupspecific.md#spawnbattery)([`BatterySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BatterySubType.html)batterySubtype, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed)) |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnBombPickup](pickupspecific.md#spawnbombpickup)([`BombSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BombSubType.html)bombSubtype, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))    |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnCard](pickupspecific.md#spawncard)([`Card` ](https://wofsauge.github.io/IsaacDocs/rep/enums/Card.html)cardType, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                                 |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnCoin](pickupspecific.md#spawncoin)([`CoinSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html)coinSubtype, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnHeart](pickupspecific.md#spawnheart)([`HeartSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/HeartSubType.html)heartSubtype, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))           |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnKey](pickupspecific.md#spawnkey)([`KeySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/KeySubType.html)keySubtype, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                     |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnPill](pickupspecific.md#spawnpill)([`PillColor` ](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)pillColor, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                      |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnSack](pickupspecific.md#spawnsack)([`SackSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/SackSubType.html)sackSubtype, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)    | [SpawnTrinket](pickupspecific.md#spawntrinket)([`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)trinketType, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, `Entity` spawner = nil, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))          |

## Functions

### GetBatteries()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetBatteries(`[`BatterySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BatterySubType.html)`batterySubtype = -1)`

Helper function to get all the batteries in the room.

### GetBombPickups()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetBombPickups(`[`BombSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BombSubType.html)`bombSubtype = -1)`

Helper function to get all the bomb pickups in the room.

### GetCards()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetCards(`[`Card` ](https://wofsauge.github.io/IsaacDocs/rep/enums/Card.html)`cardType = -1)`

Helper function to get all the cards in the room.

### GetCoins()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetCoins(`[`CoinSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html)`coinSubtype = -1)`

Helper function to get all the coins in the room.

### GetCollectibles()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetCollectibles(`[`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`collectibleType = -1)`

Helper function to get all the collectibles in the room.

### GetHearts()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetHearts(`[`HeartSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/HeartSubType.html)`heartSubtype = -1)`

Helper function to get all the hearts in the room.

### GetKeys()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetKeys(`[`KeySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/KeySubType.html)`keySubtype = -1)`

Helper function to get all the keys in the room.

### GetPills()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetPills(`[`PillColor` ](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)`pillColor = -1)`

Helper function to get all the pills in the room.

### GetSacks()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetSacks(`[`SackSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/SackSubType.html)`sackSubtype = -1)`

Helper function to get all the sacks in the room.

### GetTrinket()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetTrinket(`[`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`trinketType = -1)`

Helper function to get all the trinkets in the room.

### SpawnBattery()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnBattery(`[`BatterySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BatterySubType.html)`batterySubtype,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a battery.

### SpawnBombPickup()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnBombPickup(`[`BombSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/BombSubType.html)`bombSubtype,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a bomb pickup.

### SpawnCard()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnCard(`[`Card` ](https://wofsauge.github.io/IsaacDocs/rep/enums/Card.html)`cardType,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a card.

### SpawnCoin()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnCoin(`[`CoinSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html)`coinSubtype,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a coin.

### SpawnHeart()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnHeart(`[`HeartSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/HeartSubType.html)`heartSubtype,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a heart.

### SpawnKey()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnKey(`[`KeySubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/KeySubType.html)`keySubtype,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a key.

### SpawnPill()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnPill(`[`PillColor` ](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)`pillColor,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a pill.

### SpawnSack()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnSack(`[`SackSubType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/SackSubType.html)`sackSubtype,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a sack.

### SpawnTrinket()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) `SpawnTrinket(`[`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`trinketType,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero, Entity spawner = nil, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [`GetRandomSeed()`](rng.md#getrandomseed)`)`

Helper function to spawn a trinket.
