# CustomCallback

## Overview

| Name                                                                                               | Function Args                                                                                                                                                                                      | Optional Args                                                                                                                                                                                                             |
| -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [POST\_SLOT\_INIT](customcallback.md#post\_slot\_init)                                             | [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                                                                                                                                     | [SlotVariant](../custom-enums/slotvariant.md)                                                                                                                                                                             |
| [POST\_SLOT\_UPDATE](customcallback.md#post\_slot\_update)                                         | [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                                                                                                                                     | [SlotVariant](../custom-enums/slotvariant.md)                                                                                                                                                                             |
| [POST\_SLOT\_PRIZE](customcallback.md#post\_slot\_prize)                                           | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a>,<br>boolean</p>                                                                                                       | [SlotVariant](../custom-enums/slotvariant.md)                                                                                                                                                                             |
| [PRE\_SLOT\_COLLISION](customcallback.md#pre\_slot\_collision)                                     | wip                                                                                                                                                                                                | wip                                                                                                                                                                                                                       |
| [POST\_PLAYER\_COLLECTIBLE\_ADDED](customcallback.md#post\_player\_collectible\_added)             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html">CollectibleType</a></p> | [CollectibleType](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)                                                                                                                                    |
| [POST\_PLAYER\_COLLECTIBLE\_REMOVED](customcallback.md#post\_player\_collectible\_added-1)         | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html">CollectibleType</a></p> | [CollectibleType](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)                                                                                                                                    |
| [POST\_PLAYER\_GULPED\_TRINKET\_ADDED](customcallback.md#post\_player\_gulped\_trinet\_added)      | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html">TrinketType</a></p>         | [TrinketType](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)                                                                                                                                            |
| [POST\_PLAYER\_GULPED\_TRINKET\_REMOVED](customcallback.md#post\_player\_gulped\_trinket\_removed) | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html">TrinketType</a></p>         | [TrinketType](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)                                                                                                                                            |
| [POST\_GRID\_ENTITY\_INIT](customcallback.md#post\_grid\_entity\_init)                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html">GridEntity</a>,<br>boolean</p>                                                                                               | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer</p>                                                                                                        |
| [POST\_GRID\_ENTITY\_UPDATE](customcallback.md#post\_grid\_entity\_update)                         | [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)                                                                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer</p>                                                                                                        |
| POST\_GRID\_COLLISSION                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html">GridEntity</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a></p>                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,<br>integer</p> |

## Callbacks

### POST\_SLOT\_INIT

Called on the the first frame the slot is available.

| Function Args                                                           | Optional Args                                                 |
| ----------------------------------------------------------------------- | ------------------------------------------------------------- |
| slot [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`` | slotVariant [`SlotVariant`](../custom-enums/slotvariant.md)`` |

### POST\_SLOT\_UPDATE

Called every frame for each slot. (30 fps)

| Function Args                                                           | Optional Args                                                 |
| ----------------------------------------------------------------------- | ------------------------------------------------------------- |
| slot [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`` | slotVariant [`SlotVariant`](../custom-enums/slotvariant.md)`` |

### POST\_SLOT\_PRIZE

Called when the `Prize` or the `Disappear` event is triggered on a slot sprite. Note that the pickups might not spawn until the next frame.

| Function Args                                                           | Optional Args                                                 |
| ----------------------------------------------------------------------- | ------------------------------------------------------------- |
| slot [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`` | slotVariant [`SlotVariant`](../custom-enums/slotvariant.md)`` |
| isDisappear `boolean`                                                   |                                                               |

### PRE\_SLOT\_COLLISION

WIP

| Function Args | Optional Args |
| ------------- | ------------- |
|               |               |

### POST\_PLAYER\_COLLECTIBLE\_ADDED

Called after a collectible gets added to a player's inventory.

| Function Args                                                                                              | Optional Args                                                                                              |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)``                      | collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`` |
| collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`` |                                                                                                            |

### POST\_PLAYER\_COLLECTIBLE\_REMOVED

Called after a collectible gets removed from a player's inventory.

| Function Args                                                                                              | Optional Args                                                                                              |
| ---------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)``                      | collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`` |
| collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`` |                                                                                                            |

### POST\_PLAYER\_GULPED\_TRINKET\_ADDED

Called after a gulped trinket gets added to a player's inventory.

| Function Args                                                                                  | Optional Args                                                                                  |
| ---------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)``          | trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`` |
| trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`` |                                                                                                |

### POST\_PLAYER\_GULPED\_TRINKET\_REMOVED

Called after a gulped trinket gets removed from a player's inventory.

| Function Args                                                                                  | Optional Args                                                                                  |
| ---------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)``          | trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`` |
| trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`` |                                                                                                |

### POST\_GRID\_ENTITY\_INIT

Called from the `MC_POST_NEW_ROOM` callback for every grid entity in the room, or from the `MC_POST_UPDATE` callback whenever a new grid entity is created.

| Function Args                                                                         | Optional Args                                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| gridEntity [`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`` | gridEntityType [`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html)`` |
| wasCreated `boolean`                                                                  | gridEntityVariant `integer`                                                                             |

### POST\_GRID\_ENTITY\_UPDATE

Called every frame for each grid entity. (30 fps)

| Function Args                                                                         | Optional Args                                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| gridEntity [`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`` | gridEntityType [`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html)`` |
|                                                                                       | gridEntityVariant `integer`                                                                             |

### POST\_GRID\_COLLISSION

Called every frame, for every entity that is colliding with a grid entity.

| Function Args                                                                         | Optional Args                                                                                           |
| ------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------- |
| gridEntity [`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`` | gridEntityType [`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html)`` |
| entity [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)``             | gridEntityVariant `integer`                                                                             |
|                                                                                       | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)``             |
|                                                                                       | entityVariant `integer`                                                                                 |

