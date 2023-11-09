# Pickups

## Overview

| Return Value | Function |
| - | - |
| integer | [GetCoinValue](pickups.md#getcoinvalue)([`CoinSubType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html) coinSubType) |
| PickupIndex | [GetPickupIndex](pickups.md#getpickupindex)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) pickup) |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetRedHearts](pickups.md#getredhearts)() |
| boolean | [IsChest](pickups.md#ischest)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) pickup) |
| boolean | [IsRedHeart](pickups.md#isredheart)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) pickup) |

## Functions

### GetCoinValue()

`integer GetCoinValue(`[`CoinSubType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html)` coinSubType)`

Helper function to get the corresponding coin amount from a `CoinSubType`. Returns 1 for modded sub-types. 

### GetPickupIndex()

`PickupIndex GetPickupIndex(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` pickup)`

@class PickupIndex : integer @class PickupDescription @field Position Vector @field InitSeed integer Mods often have to track variables relating to a pickups. Finding an index for these kinds of data structures is difficult, since pickups are respawned every time a player re-enters a room, so the `PtrHash` will change. 
Use this function to get a unique index for a pickup to use in these data structures. 
Specifically, `PickupIndex` is a number that represents the spawn order of the pickup on the current run. For example, the first pickup spawned will have an index of 1, the second one will have an index of 2, and so on. 

### GetRedHearts()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetRedHearts()`

Helper function to get all of the red heart pickup entities in the room. 

### IsChest()

`boolean IsChest(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` pickup)`

Helper function to test if the provided pickup matches one of the various chest variants. 

### IsRedHeart()

`boolean IsRedHeart(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` pickup)`

Helper function to test if the provided pickup matches one of the various red heart sub types. 

