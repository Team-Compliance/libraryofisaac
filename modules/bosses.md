# Bosses

## Overview

| Return Value | Function |
| - | - |
| [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)\[] | [GetBosses](bosses.md#getbosses)([`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)`?` entityType =  -1 , `integer?` variant =  -1 , `integer?` subType =  -1 , `boolean?` ignoreFriendly =  false) |
| boolean | [IsSin](bosses.md#issin)([`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) npc) |
| [EntityNPC](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html) | [SpawnBoss](bosses.md#spawnboss)([`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) entityType, `integer` variant, `integer` subType, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) position, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`?` velocity, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`?` spawner, `integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG?, `integer?` numSegments) |

## Functions

### GetBosses()

[`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)`[] GetBosses(`[`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)`? entityType =  -1 , integer? variant =  -1 , integer? subType =  -1 , boolean? ignoreFriendly =  false)`

Helper function to get all of the bosses in the room. 

### IsSin()

`boolean IsSin(`[`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)` npc)`

Helper function to check if the provided NPC is a Sin miniboss, such as Sloth or Lust. 

### SpawnBoss()

[`EntityNPC`](https://wofsauge.github.io/IsaacDocs/rep/EntityNPC.html)` SpawnBoss(`[`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)` entityType, integer variant, integer subType, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` position, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`? velocity, `[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? spawner, integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG?, integer? numSegments)`

Helper function to spawn a boss. 
Use this function instead of `TSIL.Entities.SpawnNPC` since it handles automatically spawning multiple segments for multi-segment bosses. 
By default, this will spawn Chub (and his variants) with 3 segments, Lokii with 2 copies, Gurglings/Turdlings with 2 copies, and other multi-segment bosses with 4 segments. You can customize this via the "numSegments" argument. 

