# Familiars

## Overview

| Return Value                                                                      | Function                                                                                                                                                                                                                                                                                                                                                                                                         |
| --------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| void                                                                              | [CheckFamiliar](familiars.md#checkfamiliar)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player, [`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)collectibleType, `integer` targetCount, [`FamiliarVariant` ](https://wofsauge.github.io/IsaacDocs/rep/enums/FamiliarVariant.html)familiarVariant, `integer` familiarSubtype?)          |
| void                                                                              | [CheckFamiliarFromCollectibles](familiars.md#checkfamiliarfromcollectibles)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player, [`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)collectibleType, [`FamiliarVariant` ](https://wofsauge.github.io/IsaacDocs/rep/enums/FamiliarVariant.html)familiarVariant, `integer` familiarSubtype?) |
| [EntityFamiliar](https://wofsauge.github.io/IsaacDocs/rep/EntityFamiliar.html)\[] | [GetPlayerFamiliars](familiars.md#getplayerfamiliars)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player)                                                                                                                                                                                                                                                                       |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)?                   | [GetSirenHelper](familiars.md#getsirenhelper)([`EntityFamiliar` ](https://wofsauge.github.io/IsaacDocs/rep/EntityFamiliar.html)familiar)                                                                                                                                                                                                                                                                         |
| boolean                                                                           | [IsFamiliarStolenBySiren](familiars.md#isfamiliarstolenbysiren)([`EntityFamiliar` ](https://wofsauge.github.io/IsaacDocs/rep/EntityFamiliar.html)familiar)                                                                                                                                                                                                                                                       |

## Functions

### CheckFamiliar()

`void CheckFamiliar(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player,` [`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`collectibleType, integer targetCount,` [`FamiliarVariant` ](https://wofsauge.github.io/IsaacDocs/rep/enums/FamiliarVariant.html)`familiarVariant, integer familiarSubtype?)`

Helper function to add and remove familiars based on a target amount that you specify.

This is a convenience wrapper around the [`EntityPlayer.CheckFamiliar`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html#checkfamiliar) method. Use this helper function instead so that you do not have to retrieve the `ItemConfigItem` and so that you do not specify an incorrect RNG object. (The vanilla method does not increment the RNG object)

This function is meant to be called in the `EVALUATE_CACHE` callback (when the cache flag is equal to `CacheFlag.FAMILIARS`).

Note that this function is only meant to be used in special circumstances where the familiar count is completely custom and does not correspond to the amount of collectibles. For the general case, use the [`TSIL.Familiars.CheckFamiliarFromCollectibles`](familiars.md#checkfamiliarfromcollectibles) helper function instead.

Note that this will spawn familiars with a completely random `InitSeed`. When calculating random events for this familiar, you should use a data structure that maps familiar `InitSeed` to RNG objects that are initialized based on the seed from [`EntityPlayer.GetCollectibleRNG`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html#getcollectiblerng).

### CheckFamiliarFromCollectibles()

`void CheckFamiliarFromCollectibles(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player,` [`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`collectibleType,` [`FamiliarVariant` ](https://wofsauge.github.io/IsaacDocs/rep/enums/FamiliarVariant.html)`familiarVariant, integer familiarSubtype?)`

Helper function to add and remove familiars based on the amount of associated collectibles that a player has.

Use this helper function instead of invoking the [`EntityPlayer.CheckFamiliar`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html#checkfamiliar) method directly so that the target count is handled automatically.

This function is meant to be called in the `EVALUATE_CACHE` callback (when the cache flag is equal to `CacheFlag.FAMILIARS`).

Use this function when the amount of familiars should be equal to the amount of associated collectibles that the player has (plus any extras from having used Box of Friends or Monster Manual). If you instead need to have a custom amount of familiars, use the [`TSIL.Familiars.CheckFamiliars`](familiars.md#checkfamiliar) function instead.

Note that this will spawn familiars with a completely random `InitSeed`. When calculating random events for this familiar, you should use a data structure that maps familiar `InitSeed` to RNG objects that are initialized based on the seed from [`EntityPlayer.GetCollectibleRNG`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html#getcollectiblerng).

### GetPlayerFamiliars()

[`EntityFamiliar`](https://wofsauge.github.io/IsaacDocs/rep/EntityFamiliar.html)`[] GetPlayerFamiliars(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player)`

Helper function to get all familiars that belong to a given player.

### GetSirenHelper()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? GetSirenHelper(`[`EntityFamiliar` ](https://wofsauge.github.io/IsaacDocs/rep/EntityFamiliar.html)`familiar)`

Helper function to get the corresponding "Siren Helper" entity for a stolen familiar.

When The Siren boss "steals" your familiars, a hidden "Siren Helper" entity is spawned to control each familiar stolen. (Checking for the presence of this entity seems to be the only way to detect when the Siren steals a familiar.)

### IsFamiliarStolenBySiren()

`boolean IsFamiliarStolenBySiren(`[`EntityFamiliar` ](https://wofsauge.github.io/IsaacDocs/rep/EntityFamiliar.html)`familiar)`

Helper function to check if the given familiar is being controlled by The Siren boss.
