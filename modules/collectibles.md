# Collectibles

## Overview

| Return Value | Function |
| - | - |
| boolean | [CollectibleHasFlag](collectibles.md#collectiblehasflag)([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType, [`ItemConfigTag`](../custom-enums/itemconfigtag.md) flag) |
| boolean | [CollectibleSpriteEquals](collectibles.md#collectiblespriteequals)([`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite1, [`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite2) |
| integer | [GetCollectibleDevilCoinPrice](collectibles.md#getcollectibledevilcoinprice)([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType) |
| [PickupPrice](https://wofsauge.github.io/IsaacDocs/rep/enums/PickupPrice.html) | [GetCollectibleDevilHeartPrice](collectibles.md#getcollectibledevilheartprice)([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType, [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| CollectibleIndex | [GetCollectibleIndex](collectibles.md#getcollectibleindex)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible) |
| number | [GetCollectibleMaxCharges](collectibles.md#getcollectiblemaxcharges)([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType) |
| ItemConfig_Item\[] | [GetCollectibles](collectibles.md#getcollectibles)() |
| ItemConfig_Item\[] | [GetCollectiblesByQuality](collectibles.md#getcollectiblesbyquality)(`integer` quality) |
| ItemConfig_Item\[] | [GetCollectiblesWithTag](collectibles.md#getcollectibleswithtag)([`ItemConfigTag`](../custom-enums/itemconfigtag.md) ...) |
| ItemConfig_Item\[] | [GetModdedCollectibles](collectibles.md#getmoddedcollectibles)() |
| ItemConfig_Item\[] | [GetVanillaCollectibles](collectibles.md#getvanillacollectibles)() |
| boolean | [IsBlindCollectible](collectibles.md#isblindcollectible)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible) |
| boolean | [IsGlitchedCollectible](collectibles.md#isglitchedcollectible)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible) |
| boolean | [IsModdedColllectible](collectibles.md#ismoddedcolllectible)([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType) |
| boolean | [IsPassiveCollectible](collectibles.md#ispassivecollectible)([`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleType) |
| void | [SetCollectibleBlind](collectibles.md#setcollectibleblind)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible) |
| void | [SetCollectibleGlitched](collectibles.md#setcollectibleglitched)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible) |
| void | [SetCollectibleSprite](collectibles.md#setcollectiblesprite)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible, `string?` spriteSheet) |
| void | [SetCollectibleSubType](collectibles.md#setcollectiblesubtype)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible, [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) newSubType) |
| boolean | [TryRemoveCollectible](collectibles.md#tryremovecollectible)([`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) collectible) |

## Functions

### CollectibleHasFlag()

`boolean CollectibleHasFlag(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType, `[`ItemConfigTag`](../custom-enums/itemconfigtag.md)` flag)`

Helper function to check if a collectible type has a given flag 

### CollectibleSpriteEquals()

`boolean CollectibleSpriteEquals(`[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite1, `[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite2)`

Helper function to check if two collectible sprites are the same. 

### GetCollectibleDevilCoinPrice()

`integer GetCollectibleDevilCoinPrice(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType)`

Helper function to get the coin cost a collectible would have if it were being offered as a Devil Room Deal. 

### GetCollectibleDevilHeartPrice()

[`PickupPrice`](https://wofsauge.github.io/IsaacDocs/rep/enums/PickupPrice.html)` GetCollectibleDevilHeartPrice(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType, `[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to get the heart cost a collectible would have if it were being offered as a Devil Room Deal. 

### GetCollectibleIndex()

`CollectibleIndex GetCollectibleIndex(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible)`

Mods may have to keep track of data relating to a collectible. Finding an index for these kinds of data structures is difficult, since collectibles are respawned every time a player re-enters a room (like all other pickups), so the `PtrHash` will change. 
Use this function to get a unique index for a collectible to use in these data structures. 
Collectibles are a special case of pickups: they cannot be pushed around. (They actually can be pushed, but usually will stay on the same grid index.) Thus, it is possible to generate a somewhat reliable non-stateful index for collectibles. We use a 4-tuple of the room list index, the grid index of the collectible in the room, the collectible's `SubType`, and the collectible's `InitSeed`. 
Collectibles that are shifted by Tainted Isaac's mechanic will have unique collectible indexes because the `SubType` is different. (The collectible entities share the same `InitSeed` and `PtrHash`.) 
Collectibles that are rolled (with e.g. a D6) will have unique collectible indexes because the `SubType` and `InitSeed` are different. If you want to track collectibles independently of any rerolls, then you can use the `PtrHash` as an index instead. (The `PtrHash` will not persist between rooms, however.) 
Note that: - The grid index is a necessary part of the collectible index because Diplopia and Crooked Penny can cause two or more collectibles with the same `SubType` and `InitSeed` to exist in the same room. - This index will fail in the case where the player uses Diplopia or a successful Crooked Penny seven or more times in the same room, since that will cause two or more collectibles with the same grid index, `SubType`, and `InitSeed` to exist. (More than seven is required in non-1x1 rooms.) - The `SubType` is a necessary part of the collectible index because Tainted Isaac will continuously cause collectibles to morph into new sub-types with the same `InitSeed`. - Using a collectible's position as part of the index is problematic, since players can push a pedestal. (Even using the grid index does not solve this problem, since it is possible in certain cases for collectibles to be spawned at a position that is not aligned with the grid, and the pedestal pushed to an adjacent tile, but this case should be extremely rare.) - Mega Chests spawn two collectibles on the exact same position. However, both of them will have a different `InitSeed`, so this is not a problem for this indexing scheme. - The indexing scheme used is different for collectibles that are inside of a Treasure Room or Boss Room, in order to handle the case of the player seeing the same collectible again in a post-Ascent Treasure Room or Boss Room. A 5-tuple of stage, stage type, grid index, `SubType`, and `InitSeed` is used in this case. (Using the room list index or the room grid index is not suitable for this purpose, since both of these values can change in the post-Ascent rooms.) Even though Treasure Rooms and Boss Rooms are grouped together in this scheme, there probably will not be collectibles with the same grid index, SubType, and InitSeed. 

### GetCollectibleMaxCharges()

`number GetCollectibleMaxCharges(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType)`

Helper function to get the maximum amount of charges that a collectible has. Returns 0 if the provided collectible type was not valid. 

### GetCollectibles()

`ItemConfig_Item[] GetCollectibles()`

Returns a list with all items currently loaded. 
Use only inside a callback or not all modded items may be loaded. 

### GetCollectiblesByQuality()

`ItemConfig_Item[] GetCollectiblesByQuality(integer quality)`

Returns a list of all items of a certain quality. 
Use only inside a callback or not all modded items may be loaded. 

### GetCollectiblesWithTag()

`ItemConfig_Item[] GetCollectiblesWithTag(`[`ItemConfigTag`](../custom-enums/itemconfigtag.md)` ...)`

Returns a list of all items that have all the given tags. 
Use only inside a callback or not all modded items may be loaded. 

### GetModdedCollectibles()

`ItemConfig_Item[] GetModdedCollectibles()`

Returns a list of all modded items currently loaded. 
Use only inside a callback or not all modded items may be loaded. 

### GetVanillaCollectibles()

`ItemConfig_Item[] GetVanillaCollectibles()`

Returns a list of all vanilla items. 

### IsBlindCollectible()

`boolean IsBlindCollectible(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible)`

Returns true if the collectible has a red question mark sprite. 
Note that this function will not work properly in a render callback with the render mode set to `RenderMode.WATER_REFLECT`. 

### IsGlitchedCollectible()

`boolean IsGlitchedCollectible(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible)`

Returns true if the collectible is a glitched item, like because of the effect of TMTRAINER. 

### IsModdedColllectible()

`boolean IsModdedColllectible(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType)`

Returns true if the collectible type corresponds a modded item. 

### IsPassiveCollectible()

`boolean IsPassiveCollectible(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleType)`

Returns true if the collectible is either `ITEM_PASSIVE` or `ITEM_FAMILIAR`. 

### SetCollectibleBlind()

`void SetCollectibleBlind(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible)`

Helper function to set a collectible sprite to a red question mark. 

### SetCollectibleGlitched()

`void SetCollectibleGlitched(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible)`

Helper function to change a collectible into a glitched one. 

### SetCollectibleSprite()

`void SetCollectibleSprite(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible, string? spriteSheet)`

Helper function to change the sprite of a collectible pedestal 

### SetCollectibleSubType()

`void SetCollectibleSubType(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible, `[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` newSubType)`

Helper function to change the collectible in a pedestal. 
If `COLLECTIBLE_NULL` is given as the new subtype, it'll try removing the item, as if the player had already picked it. Check `TSIL.Collectibles.TryRemoveCollectible()` for more information. 

### TryRemoveCollectible()

`boolean TryRemoveCollectible(`[`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)` collectible)`

Empties an item pedestal as if a player had already picked it up. 
If it's a shop item, it removes it completely. 

