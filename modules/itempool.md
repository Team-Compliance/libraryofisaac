# ItemPool

## Overview

| Return Value | Function                                                                                                                                                                                                                           |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| boolean      | IsCollectibleInItemPool([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType, [`ItemPoolType`](https://wofsauge.github.io/IsaacDocs/rep/enums/ItemPoolType.html) itemPoolType) |

## Functions

### IsCollectibleInItemPool()

`boolean IsCollectibleInItemPool(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) `collectibleType,` [`ItemPoolType`](https://wofsauge.github.io/IsaacDocs/rep/enums/ItemPoolType.html) `itemPoolType)`

Helper function to see if the given collectible is still present in the given item pool.

If the collectible is non-offensive, any Tainted Losts will be temporarily changed to Isaac and then changed back. (This is because Tainted Lost is not able to retrieve non-offensive collectibles from item pools).

{% hint style="info" %}
Under the hood, this function works by using the [`ItemPool.AddRoomBlackList`](https://wofsauge.github.io/IsaacDocs/rep/ItemPool.html#addroomblacklist) method to blacklist every collectible except for the one provided.
{% endhint %}
