# Pickups

## Overview

| Return Value                                                                  | Function                                                                                                                                     |
| ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| integer                                                                       | [GetCoinValue](pickups.md#getcoinvalue)([`CoinSubType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html) coinSubType)        |
| [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)\[] | [GetRedHearts](pickups.md#getredhearts)()                                                                                                    |
| boolean                                                                       | [IsChest](pickups.md#ischest)([`EntityPickup` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)pickup)                           |
| boolean                                                                       | [IsRedHeart](pickups.md#isredheart-entitypickup-pickup)([`EntityPickup` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)pickup) |

## Functions

### GetCoinValue()

`integer GetCoinValue(`[`CoinSubType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CoinSubType.html) `coinSubType)`

Helper function to get the corresponding coin amount from a `CoinSubType`. Returns 1 for modded sub-types.

### GetRedHearts()

[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`[] GetRedHearts()`

Helper function to get all of the red heart pickup entities in the room.

### IsChest()

`boolean IsChest(`[`EntityPickup` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`pickup)`

Helper function to test if the provided pickup matches one of the various chest variants.

### IsRedHeart()

`boolean IsRedHeart(`[`EntityPickup` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)`pickup)`

Helper function to test if the provided pickup matches one of the various red heart sub types.
