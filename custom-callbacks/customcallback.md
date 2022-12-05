# CustomCallback

## Overview

| Name                                                                                               | Function Args                                                                                                                                                                                                                                                                                      | Optional Args                                                                                                                                                                                                             |
| -------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [POST\_TSIL\_LOAD](customcallback.md#post\_tsil\_load)                                             | -                                                                                                                                                                                                                                                                                                  | -                                                                                                                                                                                                                         |
| [POST\_AMBUSH\_STARTED](customcallback.md#post\_ambush\_started)                                   | [AmbushType](../custom-enums/ambushtype.md)                                                                                                                                                                                                                                                        | [AmbushType](../custom-enums/ambushtype.md)                                                                                                                                                                               |
| [POST\_AMBUSH\_FINISHED](customcallback.md#post\_ambush\_finished)                                 | [AmbushType](../custom-enums/ambushtype.md)                                                                                                                                                                                                                                                        | [AmbushType](../custom-enums/ambushtype.md)                                                                                                                                                                               |
| [POST\_BOMB\_EXPLODED](customcallback.md#post\_bomb\_exploded)                                     | [EntityBomb](https://wofsauge.github.io/IsaacDocs/rep/EntityBomb.html)                                                                                                                                                                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/BombVariant.html">BombVariant</a>,</p><p>integer</p>                                                                                                           |
| [POST\_BOMB\_INIT\_LATE](customcallback.md#post\_bomb\_init\_late)                                 | [EntityBomb](https://wofsauge.github.io/IsaacDocs/rep/EntityBomb.html)                                                                                                                                                                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/BombVariant.html">BombVariant</a>,</p><p>integer</p>                                                                                                           |
| [POST\_COLLECTIBLE\_EMPTY](customcallback.md#post\_collectible\_empty)                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html">EntityPickup</a>,</p><p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html">CollectibleType</a></p>                                                                                              | [CollectibleType](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)                                                                                                                                    |
| [POST\_COLLECTIBLE\_INIT\_FIRST](customcallback.md#post\_collectible\_init\_first)                 | [EntityPickup](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)                                                                                                                                                                                                                         | [CollectibleType](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)                                                                                                                                    |
| [ENTITY\_TAKE\_DMG\_FILTER](customcallback.md#entity\_take\_dmg\_filter)                           | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a>,</p><p>float,</p><p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/DamageFlag.html">DamageFlag</a>,</p><p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityRef.html">EntityRef</a>,</p><p>integer</p> | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [POST\_NPC\_DEATH\_FILTER](customcallback.md#post\_npc\_death\_filter)                             | [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)                                                                                                                                                                                                                               | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [POST\_NPC\_INIT\_FILTER](customcallback.md#post\_npc\_init\_filter)                               | [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)                                                                                                                                                                                                                               | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [POST\_NPC\_RENDER\_FILTER](customcallback.md#post\_npc\_render\_filter)                           | [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)                                                                                                                                                                                                                               | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [POST\_NPC\_UPDATE\_FILTER](customcallback.md#post\_npc\_update\_filter)                           | [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)                                                                                                                                                                                                                               | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [PRE\_NPC\_COLLISION\_FILTER](customcallback.md#pre\_npc\_collision\_filter)                       | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html">EntityNPC</a>,</p><p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a></p>                                                                                                                            | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [PRE\_NPC\_UPDATE\_FILTER](customcallback.md#pre\_npc\_update\_filter)                             | [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)                                                                                                                                                                                                                               | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,</p><p>integer,</p><p>integer</p>                                                                                              |
| [POST\_SLOT\_INIT](customcallback.md#post\_slot\_init)                                             | [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                                                                                                                                                                                                                                     | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| [POST\_SLOT\_UPDATE](customcallback.md#post\_slot\_update)                                         | [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                                                                                                                                                                                                                                     | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| POST\_SLOT\_RENDER                                                                                 | [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                                                                                                                                                                                                                                     | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| [POST\_SLOT\_PRIZE](customcallback.md#post\_slot\_prize)                                           | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a>,<br>boolean</p>                                                                                                                                                                                                       | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| POST\_SLOT\_ANIMATION\_CHANGED                                                                     | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a>,</p><p>string,</p><p>string</p>                                                                                                                                                                                       | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| POST\_SLOT\_DESTROYED                                                                              | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a>,<br>boolean</p>                                                                                                                                                                                                       | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| [PRE\_SLOT\_COLLISION](customcallback.md#pre\_slot\_collision)                                     | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a>,</p><p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a></p>                                                                                                                      | <p><a href="../custom-enums/slotvariant.md">SlotVariant</a>,</p><p>integer</p>                                                                                                                                            |
| [POST\_PLAYER\_COLLECTIBLE\_ADDED](customcallback.md#post\_player\_collectible\_added)             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html">CollectibleType</a></p>                                                                                                 | [CollectibleType](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)                                                                                                                                    |
| [POST\_PLAYER\_COLLECTIBLE\_REMOVED](customcallback.md#post\_player\_collectible\_added-1)         | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html">CollectibleType</a></p>                                                                                                 | [CollectibleType](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)                                                                                                                                    |
| [POST\_PLAYER\_GULPED\_TRINKET\_ADDED](customcallback.md#post\_player\_gulped\_trinet\_added)      | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html">TrinketType</a></p>                                                                                                         | [TrinketType](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)                                                                                                                                            |
| [POST\_PLAYER\_GULPED\_TRINKET\_REMOVED](customcallback.md#post\_player\_gulped\_trinket\_removed) | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html">EntityPlayer</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html">TrinketType</a></p>                                                                                                         | [TrinketType](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)                                                                                                                                            |
| [POST\_GRID\_ENTITY\_INIT](customcallback.md#post\_grid\_entity\_init)                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html">GridEntity</a>,</p><p>boolean</p>                                                                                                                                                                                            | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer</p>                                                                                                        |
| [POST\_GRID\_ENTITY\_UPDATE](customcallback.md#post\_grid\_entity\_update)                         | [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)                                                                                                                                                                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer</p>                                                                                                        |
| POST\_GRID\_ENTITY\_RENDER                                                                         | [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)                                                                                                                                                                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer</p>                                                                                                        |
| POST\_GRID\_COLLISION                                                                              | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html">GridEntity</a>,<br><a href="https://wofsauge.github.io/IsaacDocs/rep/Entity.html">Entity</a></p>                                                                                                                             | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html">GridEntityType</a>,<br>integer<br><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html">EntityType</a>,<br>integer</p> |
| POST\_GAME\_STARTED\_REORDERED                                                                     | boolean                                                                                                                                                                                                                                                                                            | -                                                                                                                                                                                                                         |
| POST\_GAME\_STARTED\_REORDERED\_LAST                                                               | boolean                                                                                                                                                                                                                                                                                            | -                                                                                                                                                                                                                         |
| POST\_NEW\_LEVEL\_REORDERED                                                                        | -                                                                                                                                                                                                                                                                                                  | -                                                                                                                                                                                                                         |
| POST\_NEW\_ROOM\_REORDERED                                                                         | -                                                                                                                                                                                                                                                                                                  | -                                                                                                                                                                                                                         |
| POST\_PEFFECT\_UPDATE\_REORDERED                                                                   | [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)                                                                                                                                                                                                                         | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html">PlayerType</a>,<br>integer</p>                                                                                                                |
| POST\_PLAYER\_RENDER\_REORDERED                                                                    | [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)                                                                                                                                                                                                                         | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html">PlayerType</a>,<br>integer</p>                                                                                                                |
| POST\_PLAYER\_UPDATE\_REORDERED                                                                    | [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)                                                                                                                                                                                                                         | <p><a href="https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html">PlayerType</a>,<br>integer</p>                                                                                                                |
| POST\_NEW\_ROOM\_EARLY                                                                             | -                                                                                                                                                                                                                                                                                                  | -                                                                                                                                                                                                                         |

## Callbacks

### POST\_TSIL\_LOAD

Called every time a TSIL instance is finished loading. Useful to detect if new library instances have been loaded.&#x20;

| Function Args | Optional Args |
| ------------- | ------------- |
| -             | -             |

### POST\_AMBUSH\_STARTED

Called on the the first frame `room:IsAmbushActive()` is true.

| Function Args                                            | Optional Args                                            |
| -------------------------------------------------------- | -------------------------------------------------------- |
| ambushType [`AmbushType`](../custom-enums/ambushtype.md) | ambushType [`AmbushType`](../custom-enums/ambushtype.md) |

### POST\_AMBUSH\_FINISHED

Called on the the first frame `room:IsAmbushActive()` is false.

| Function Args                                            | Optional Args                                            |
| -------------------------------------------------------- | -------------------------------------------------------- |
| ambushType [`AmbushType`](../custom-enums/ambushtype.md) | ambushType [`AmbushType`](../custom-enums/ambushtype.md) |

### POST\_BOMB\_EXPLODED

Called when a bomb starts playing the Explode animation.

{% hint style="info" %}
When bombs explode they play the Explode animation for 1 frame.
{% endhint %}

| Function Args                                                                 | Optional Args                                                                                |
| ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| bomb [`EntityBomb`](https://wofsauge.github.io/IsaacDocs/rep/EntityBomb.html) | bombVariant [`BombVariant`](https://wofsauge.github.io/IsaacDocs/rep/enums/BombVariant.html) |
|                                                                               | bombSubtype `integer`                                                                        |

### POST\_BOMB\_INIT\_LATE

Called from the `POST_BOMB_UPDATE` callback, on the first frame it's available.

| Function Args                                                                 | Optional Args                                                                                |
| ----------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| bomb [`EntityBomb`](https://wofsauge.github.io/IsaacDocs/rep/EntityBomb.html) | bombVariant [`BombVariant`](https://wofsauge.github.io/IsaacDocs/rep/enums/BombVariant.html) |
|                                                                               | bombSubtype `integer`                                                                        |

### POST\_COLLECTIBLE\_EMPTY

Called from the `POST_PICKUP_UPDATE` callback, when a pedestal goes from a non-zero subtype to `CollectibleType.NULL` (i.e. an "empty" pedestal).

| Function Args                                                                                               | Optional Args                                                                                            |
| ----------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| collectible [`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html)                    | collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |
| oldCollectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |                                                                                                          |

### POST\_COLLECTIBLE\_INIT\_FIRST

Called from the `POST_PICKUP_INIT` callback, only on the first time the player sees the respective collectible.

| Function Args                                                                            | Optional Args                                                                                            |
| ---------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| collectible [`EntityPickup`](https://wofsauge.github.io/IsaacDocs/rep/EntityPickup.html) | collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |

### ENTITY\_TAKE\_DMG\_FILTER

Works exactly the same as the vanilla `ENTITY_TAKE_DMG` callback, but let's you filter using variant and subtype.

| Function Args                                                                              | Optional Args                                                                             |
| ------------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------- |
| entity [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                    | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
| amount `float`                                                                             | variant `integer`                                                                         |
| damageFlags [`DamageFlag`](https://wofsauge.github.io/IsaacDocs/rep/enums/DamageFlag.html) | subType `integer`                                                                         |
| source [`EntityRef`](https://wofsauge.github.io/IsaacDocs/rep/EntityRef.html)              |                                                                                           |
| countdownFrames `integer`                                                                  |                                                                                           |

### POST\_NPC\_DEATH\_FILTER

Works exactly the same as the vanilla `POST_NPC_DEATH` callback, but let's you filter using variant and subtype.

| Function Args                                                              | Optional Args                                                                             |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| npc [`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
|                                                                            | variant `integer`                                                                         |
|                                                                            | subType `integer`                                                                         |

### POST\_NPC\_INIT\_FILTER

Works exactly the same as the vanilla `POST_NPC_INIT` callback, but let's you filter using variant and subtype.

| Function Args                                                              | Optional Args                                                                             |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| npc [`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
|                                                                            | variant `integer`                                                                         |
|                                                                            | subType `integer`                                                                         |

### POST\_NPC\_RENDER\_FILTER

Works exactly the same as the vanilla `POST_NPC_RENDER` callback, but let's you filter using variant and subtype.

| Function Args                                                              | Optional Args                                                                             |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| npc [`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
|                                                                            | variant `integer`                                                                         |
|                                                                            | subType `integer`                                                                         |

### POST\_NPC\_UPDATE\_FILTER

Works exactly the same as the vanilla `POST_NPC_UPDATE` callback, but let's you filter using variant and subtype.

| Function Args                                                              | Optional Args                                                                             |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| npc [`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
|                                                                            | variant `integer`                                                                         |
|                                                                            | subType `integer`                                                                         |

### PRE\_NPC\_COLLISION\_FILTER

Works exactly the same as the vanilla `PRE_NPC_COLLISION` callback, but let's you filter using variant and subtype.

| Function Args                                                              | Optional Args                                                                             |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| npc [`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
| collider [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)  | variant `integer`                                                                         |
|                                                                            | subType `integer`                                                                         |

### PRE\_NPC\_UPDATE\_FILTER

Works exactly the same as the vanilla `PRE_NPC_UPDATE` callback, but let's you filter using variant and subtype.

| Function Args                                                              | Optional Args                                                                             |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| npc [`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) |
|                                                                            | variant `integer`                                                                         |
|                                                                            | subType `integer`                                                                         |

### POST\_SLOT\_INIT

Called on the the first frame the slot is available.

| Function Args                                                         | Optional Args                                               |
| --------------------------------------------------------------------- | ----------------------------------------------------------- |
| slot [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) | slotVariant [`SlotVariant`](../custom-enums/slotvariant.md) |

### POST\_SLOT\_UPDATE

Called every frame for each slot. (30 fps)

| Function Args                                                         | Optional Args                                               |
| --------------------------------------------------------------------- | ----------------------------------------------------------- |
| slot [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) | slotVariant [`SlotVariant`](../custom-enums/slotvariant.md) |

### POST\_SLOT\_PRIZE

Called when the `Prize` or the `Disappear` event is triggered on a slot sprite. Note that the pickups might not spawn until the next frame.

| Function Args                                                         | Optional Args                                               |
| --------------------------------------------------------------------- | ----------------------------------------------------------- |
| slot [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) | slotVariant [`SlotVariant`](../custom-enums/slotvariant.md) |
| isDisappear `boolean`                                                 |                                                             |

### PRE\_SLOT\_COLLISION

WIP

| Function Args | Optional Args |
| ------------- | ------------- |
|               |               |

### POST\_PLAYER\_COLLECTIBLE\_ADDED

Called after a collectible gets added to a player's inventory.

| Function Args                                                                                            | Optional Args                                                                                            |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)                      | collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |
| collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |                                                                                                          |

### POST\_PLAYER\_COLLECTIBLE\_REMOVED

Called after a collectible gets removed from a player's inventory.

| Function Args                                                                                            | Optional Args                                                                                            |
| -------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)                      | collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |
| collectibleType [`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) |                                                                                                          |

### POST\_PLAYER\_GULPED\_TRINKET\_ADDED

Called after a gulped trinket gets added to a player's inventory.

| Function Args                                                                                | Optional Args                                                                                |
| -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)          | trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) |
| trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) |                                                                                              |

### POST\_PLAYER\_GULPED\_TRINKET\_REMOVED

Called after a gulped trinket gets removed from a player's inventory.

| Function Args                                                                                | Optional Args                                                                                |
| -------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------- |
| player [`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)          | trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) |
| trinketType [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) |                                                                                              |

### POST\_GRID\_ENTITY\_INIT

Called from the `MC_POST_NEW_ROOM` callback for every grid entity in the room, or from the `MC_POST_UPDATE` callback whenever a new grid entity is created.

| Function Args                                                                       | Optional Args                                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| gridEntity [`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) | gridEntityType [`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html) |
| wasCreated `boolean`                                                                | gridEntityVariant `integer`                                                                           |

### POST\_GRID\_ENTITY\_UPDATE

Called every frame for each grid entity. (30 fps)

| Function Args                                                                       | Optional Args                                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| gridEntity [`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) | gridEntityType [`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html) |
|                                                                                     | gridEntityVariant `integer`                                                                           |

### POST\_GRID\_COLLISSION

Called every frame, for every entity that is colliding with a grid entity.

| Function Args                                                                       | Optional Args                                                                                         |
| ----------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------- |
| gridEntity [`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) | gridEntityType [`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html) |
| entity [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)             | gridEntityVariant `integer`                                                                           |
|                                                                                     | entityType [`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)             |
|                                                                                     | entityVariant `integer`                                                                               |
