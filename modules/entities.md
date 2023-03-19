# Entities

## Overview

| Return Value | Function |
| - | - |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)\[] | [GetEntities](entities.md#getentities)([`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)` | integer?` entityType =  -1 , `integer?` variant =  -1 , `integer?` subType =  -1 , `boolean?` ignoreFriendly =  false ) |
| any | [GetEntityData](entities.md#getentitydata)(`table` mod, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity, `string` field) |
| table<[EntityPtr](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html), [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)> | [GetEntityPositions](entities.md#getentitypositions)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]?` entities) |
| table<[EntityPtr](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html), [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)> | [GetEntityVelocities](entities.md#getentityvelocities)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]?` entities) |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)? | [IsCollidingWithGrid](entities.md#iscollidingwithgrid)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity) |
| void | [SetEntityData](entities.md#setentitydata)(`table` mod, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity, `string` field, `any` value) |
| void | [SetEntityPositions](entities.md#setentitypositions)(`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`>` positions, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]?` entities) |
| void | [SetEntityVelocities](entities.md#setentityvelocities)(`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`>` velocities, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]?` entities) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) | [Spawn](entities.md#spawn)([`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html) entityType, `integer` variant, `integer` subType, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) position, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`?` velocity, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`?` spawner, `integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG) |

## Functions

### GetEntities()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] GetEntities(`[`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)` | integer? entityType =  -1 , integer? variant =  -1 , integer? subType =  -1 , boolean? ignoreFriendly =  false )`

Helper function to get all of the entities in the room or all of the entities tht match a specific entity type / variant / sub-type. Due to bugs with `Isaac.FindInRadius`, this function uses `Isaac.GetRoomEntities`, which is more expensive but is also more robust. (If a matching entity type is provided, then `Isaac.FindByType` will be used instead.) 

### GetEntityData()

`any GetEntityData(table mod, `[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity, string field)`

Gets some arbitrary data for an entity. Use this instead of `Entity:GetData()` since that is global and allows for other mods to edit your data. 
This is also better than manually keeping track of the data manually with the save manager since the PtrHash can be reused after the entity is removed and this keeps track of it manually. 
Use only for non persistent entities like effects. 

### GetEntityPositions()

`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> GetEntityPositions(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]? entities)`

Helper function to get a map containing the positions of every entity in the current room. 

### GetEntityVelocities()

`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> GetEntityVelocities(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]? entities)`

Helper function to get a map containing the velocities of every entity in the current room. 

### IsCollidingWithGrid()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`? IsCollidingWithGrid(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity)`

Checks if an entity is colliding with a grid entity. If it does, returns the grid entity it's colliding with, else returns nil. 

### SetEntityData()

`void SetEntityData(table mod, `[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity, string field, any value)`

Sets some arbitrary data for an entity. Use this instead of `Entity:GetData()` since that is global and allows for other mods to edit your data. 
This is also better than manually keeping track of the data manually with the save manager since the PtrHash can be reused after the entity is removed and this keeps track of it manually. 
Use only for non persistent entities like effects. 

### SetEntityPositions()

`void SetEntityPositions(table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> positions, `[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]? entities)`

Helper function to set the positions of all the entities in the room. 
Useful for rewinding entity positions. 

### SetEntityVelocities()

`void SetEntityVelocities(table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> velocities, `[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]? entities)`

Helper function to set the velocities of all the entities in the room. 
Useful for rewinding entity velocities. 

### Spawn()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` Spawn(`[`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)` entityType, integer variant, integer subType, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` position, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`? velocity, `[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? spawner, integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG)`

Helper function to spawn an entity. Use this instead of the `Isaac.Spawn` method if you do not need to specify the velocity or spawner. 

