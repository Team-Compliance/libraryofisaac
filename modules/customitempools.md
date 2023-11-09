# CustomItemPools

## Overview

| Return Value | Function |
| - | - |
| void | [AddCollectible](customitempools.md#addcollectible)(`integer` customItemPoolType, `CustomItemPoolCollectible` newItemPoolCollectible, `boolean?` ignoreIfDuplicate?) |
| void | [AddCollectiblesToRegisteredPool](customitempools.md#addcollectiblestoregisteredpool)(`integer` customItemPoolType, `CustomItemPoolCollectible[]` itemPoolCollectibles) |
| void | [AddCollectibleToRegisteredPool](customitempools.md#addcollectibletoregisteredpool)(`integer` customItemPoolType, `CustomItemPoolCollectible` newItemPoolCollectible) |
| void | [GetCollectible](customitempools.md#getcollectible)(`integer` customItemPoolType, `boolean?` decrease? =  true, `integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG? =  `tsil.rng.getrandomseed()` , [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`?` defaultItem? =  collectibletype.collectible_null) |
| CustomItemPoolCollectible\[] | [GetCollectibleEntriesInItemPool](customitempools.md#getcollectibleentriesinitempool)(`integer` customItemPoolType) |
| boolean | [IsCollectibleInCustomPool](customitempools.md#iscollectibleincustompool)(`integer` customItemPoolType, [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType) |
| integer | [RegisterCustomItemPool](customitempools.md#registercustomitempool)(`CustomItemPoolCollectible[]?` collectibles?) |
| boolean | [RemoveCollectible](customitempools.md#removecollectible)(`integer` customItemPoolType, [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType, `number?` decreaseBy?) |

## Functions

### AddCollectible()

`void AddCollectible(integer customItemPoolType, CustomItemPoolCollectible newItemPoolCollectible, boolean? ignoreIfDuplicate?)`

Adds an item to a custom item pool for the current run. 
If the item wasn't in the pool to begin with, it'll create a new entry for the item. If the item was already in the pool, it'll add the weight you passed to the entry already in the pool, unless the `ignoreDuplicate` param is set to true. 

### AddCollectiblesToRegisteredPool()

`void AddCollectiblesToRegisteredPool(integer customItemPoolType, CustomItemPoolCollectible[] itemPoolCollectibles)`

Adds a list of collectibles to a registered custom item pool. 
Unlike `TSIL.CustomItemPools.AddCollectible`, this will add the collectible to the registered pool, so when the pool is reset, this new item will be in the pool. 

### AddCollectibleToRegisteredPool()

`void AddCollectibleToRegisteredPool(integer customItemPoolType, CustomItemPoolCollectible newItemPoolCollectible)`

Adds an item to a registered custom item pool. 
Unlike `TSIL.CustomItemPools.AddCollectible`, this will add the collectible to the registered pool, so when the pool is reset, this new item will be in the pool. 

### GetCollectible()

`void GetCollectible(integer customItemPoolType, boolean? decrease? =  true, integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG? =  `tsil.rng.getrandomseed()` , `[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`? defaultItem? =  collectibletype.collectible_null)`

Helper function to get an item from a custom item pool created with `TSIL.CustomItemPools.RegisterCustomItemPool()`. 
Similar to vanilla pools, the item will only get it's weight decreased if the `decrease` argument is set to true. 

### GetCollectibleEntriesInItemPool()

`CustomItemPoolCollectible[] GetCollectibleEntriesInItemPool(integer customItemPoolType)`

Helper function to get a copy of the current item entries for a given pool. 

### IsCollectibleInCustomPool()

`boolean IsCollectibleInCustomPool(integer customItemPoolType, `[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType)`

Helper function to check if a certain collectible is in a custom item pool. 

### RegisterCustomItemPool()

`integer RegisterCustomItemPool(CustomItemPoolCollectible[]? collectibles?)`

@class CustomItemPoolCollectible @field Collectible CollectibleType @field Weight number @field DecreaseBy number @field RemoveOn number Registers a new custom item pool. Use this function once after loading the library to load your item pool. 
This function also returns an automatically assigned ID you need to refer to your item pool. 
For example: `lua local myItemPoolItems = { {Collectible = CollectibleType.COLLECTIBLE_SAD_ONION, Weight = 1, DecreaseBy = 1, RemoveOn = 0.1}, {Collectible = CollectibleType.COLLECTIBLE_BRIMSTONE, Weight = 1, DecreaseBy = 1, RemoveOn = 0.1}, } local MY_ITEM_POOL = TSIL.CustomItemPools.RegisterCustomItemPool(myItemPoolItems) ` 

### RemoveCollectible()

`boolean RemoveCollectible(integer customItemPoolType, `[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType, number? decreaseBy?)`

Helper function to remove an item from the given custom item pool. 
Will return true if the item was in the pool before being removed. 

