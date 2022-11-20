# Entities

## Overview

| Return Value                                                                                                                                | Function                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| ------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| table<[EntityPtr](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html), [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)> | [GetEntityPositions](entities.md#getentitypositions)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]` entities = [GetEntities()](entities.md#getentities))                                                                                                                                                                                                                                                                                                                      |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)\[]                                                                           | [GetEntities](entities.md#getentities)([`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)`\|integer` entityType = -1, `integer` variant = -1, `integer` subtype = -1, `boolean` ignoreFriendly = false)                                                                                                                                                                                                                                                                 |
| table<[EntityPtr](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html), [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)> | [GetEntityVelocities](entities.md#getentityvelocities)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]` entities = [GetEntities()](entities.md#getentities))                                                                                                                                                                                                                                                                                                                    |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)?                                                                     | [IsCollidingWithGrid](entities.md#iscollidingwithgrid)([`Entity` ](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)entity)                                                                                                                                                                                                                                                                                                                                                                     |
| void                                                                                                                                        | [SetEntityPositions](entities.md#setentitypositions)(`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`,` [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`>` positions, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]` entities = [GetEntities()](entities.md#getentities))                                                                                                                                                     |
| void                                                                                                                                        | [SetEntityVelocities](entities.md#setentityvelocities)(`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`,` [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`>` velocities, [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[]` entities = [GetEntities()](entities.md#getentities))                                                                                                                                                  |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)                                                                              | [Spawn](entities.md#spawn)([`EntityType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)entityType, `integer` variant, `integer` subType, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)position, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)velocity = Vector.Zero, [`Entity` ](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)spawner = nil, `integer\|`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG) |

## Functions

### GetEntityPositions()

`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`,` [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> GetEntityPositions(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] entities =` [`GetEntities()`](entities.md#getentities)`)`

Helper function to get a map containing the positions of every entity in the current room.

If you provide a list of entities, will only get the positions of the given entities, instead of calling `` [`Isaac.GetRoomEntities`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#getroomentities).

### GetEntities()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] GetEntities(`[`EntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)`|integer entityType = -1, integer variant = -1, integer subtype = -1, boolean ignoreFriendly = false)`

Helper function to get all of the entities in the room or all of the entities that match a specific entity type / variant / sub-type. Due to bugs with [`Isaac.FindInRadius`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#findinradius), this function uses [`Isaac.GetRoomEntities`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#getroomentities), which is more expensive but is also more robust. (If a matching entity type is provided, then [`Isaac.FindByType`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#findbytype) will be used instead.)

### GetEntityVelocities()

`table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`,` [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> GetEntityVelocities(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] entities =` [`GetEntities()`](entities.md#getentities)`)`

Helper function to get a map containing the velocities of every entity in the current room.

If you provide a list of entities, will only get the velocities of the given entities, instead of calling `` [`Isaac.GetRoomEntities`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#getroomentities).

### IsCollidingWithGrid()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`? IsCollidingWithGrid(`[`Entity` ](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`entity)`

Checks if an entity is colliding with a grid entity. If it does, returns the grid entity it's colliding with, else returns nil.

### SetEntityPositions()

`void SetEntityPositions(table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`,` [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> positions,` [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] entities =` [`GetEntities()`](entities.md#getentities)`)`

Helper function to set the positions of all the entities in the room. Useful for rewinding entity positions.

### SetEntityVelocities()

`void SetEntityVelocities(table<`[`EntityPtr`](https://wofsauge.github.io/IsaacDocs/rep/EntityPtr.html)`,` [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`> velocities,` [`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] entities =` [`GetEntities()`](entities.md#getentities)`)`

Helper function to set the velocities of all the entities in the room. Useful for rewinding entity velocities.

### Spawn()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) `Spawn(`[`EntityType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/EntityType.html)`entityType, integer variant, integer subType,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`position,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`velocity = Vector.Zero,` [`Entity` ](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`spawner = nil, integer|`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG)`

Helper function to spawn an entity. Use this instead of the [`Isaac.Spawn`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#spawn) method if you do not `` need to specify the velocity or spawner.

If `seedOrRNR` is not set, the function will use [`Isaac.Spawn`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#spawn), otherwise it'll use [`Game.Spawn`](https://wofsauge.github.io/IsaacDocs/rep/Game.html#spawn).
