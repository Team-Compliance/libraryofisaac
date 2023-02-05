# GridEntities

## Overview

| Return Value | Function |
| - | - |
| {type : GridEntityType, variant : integer} | [ConvertXMLGridEntityType](gridentities.md#convertxmlgridentitytype)()[`GridEntityXMLType`](../custom-enums/gridentityxmltype.md) gridEntityXMLType, `integer` gridEntityXMLVariant) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)\[] | [GetCollidingEntitiesWithGridEntity](gridentities.md#getcollidingentitieswithgridentity)()[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) gridEntity) |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)\[] | [GetGridEntities](gridentities.md#getgridentities)()[`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html) ...) |
| table<integer, [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)> | [GetGridEntitiesMap](gridentities.md#getgridentitiesmap)()[`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html) ...) |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)\[] | [GetSurroundingGridEntities](gridentities.md#getsurroundinggridentities)()[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) gridIndex) |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) | [GetTopLeftWall](gridentities.md#gettopleftwall)()) |
| integer | [GetTopLeftWallGridIndex](gridentities.md#gettopleftwallgridindex)()) |
| boolean | [IsGridEntityBreakableByExplosion](gridentities.md#isgridentitybreakablebyexplosion)()[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) gridEntity) |
| boolean | [IsGridEntityBroken](gridentities.md#isgridentitybroken)()[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html) gridEntity) |
| void | [RemoveGridEntities](gridentities.md#removegridentities)()[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[]` gridEntities, `boolean` updateRoom) |
| void | [RemoveGridEntity](gridentities.md#removegridentity)()[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` | integer` gridEntityOrGridIndex, `boolean` updateRoom) |
| boolean | [SpawnGigaPoop](gridentities.md#spawngigapoop)()[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` | integer` topLeftGridIndexOrPosition, `boolean?` force) |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)? | [SpawnGridEntity](gridentities.md#spawngridentity)()[`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html) gridEntityType, `integer` gridEntityVariant, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` | integer` gridIndexOrPosition, `boolean?` force) |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)? | [SpawnVoidPortal](gridentities.md#spawnvoidportal)()[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` | integer` gridIndexOrPosition, `boolean?` force) |

## Functions

### ConvertXMLGridEntityType()

`{type : GridEntityType, variant : integer} ConvertXMLGridEntityType(`[`GridEntityXMLType`](../custom-enums/gridentityxmltype.md)` gridEntityXMLType, integer gridEntityXMLVariant)`

Helper function to convert the grid entity type found in a room XML file to the corresponding grid entity type and variant normally used by the game. For example, a rock is represented as 1000.0 in a room XML file, but `GridEntityType.GRID_ROCK` is equal to 2. 

### GetCollidingEntitiesWithGridEntity()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] GetCollidingEntitiesWithGridEntity(`[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` gridEntity)`

Returns all the entities that are colliding with a given grid entity. 
Note that this function won't work in the `POST_NEW_ROOM` callback, since entities don't have collision yet. 

### GetGridEntities()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[] GetGridEntities(`[`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html)` ...)`

Returns a list with all grid entities in the room. 

### GetGridEntitiesMap()

`table<integer, `[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`> GetGridEntitiesMap(`[`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html)` ...)`

Returns a map with all grid entities in the room indexed by their grid index. 

### GetSurroundingGridEntities()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[] GetSurroundingGridEntities(`[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` gridIndex)`

Helper function to get all grid entities around a grid index, not including itself. 

### GetTopLeftWall()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` GetTopLeftWall()`

Helper function to get the top left wall grid entity. 

### GetTopLeftWallGridIndex()

`integer GetTopLeftWallGridIndex()`

Helper function to get the grid index of the top left wall. 

### IsGridEntityBreakableByExplosion()

`boolean IsGridEntityBreakableByExplosion(`[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` gridEntity)`

Helper function to check if a GridEntity is able to be broken with an explosion. 

### IsGridEntityBroken()

`boolean IsGridEntityBroken(`[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` gridEntity)`

Helper function to see if the given GridEntity is in its respective broken state. 
Note that `GridEntityType.GRID_LOCK` will turn to being broken before the actual collision is turned off. 

### RemoveGridEntities()

`void RemoveGridEntities(`[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[] gridEntities, boolean updateRoom)`

Helper function to remove all grid entities from a given list. 

### RemoveGridEntity()

`void RemoveGridEntity(`[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)` | integer gridEntityOrGridIndex, boolean updateRoom)`

Helper function to remove a grid entity by providing the GridEntity or the grid index. 
If removing a Devil or Angel Statue it'll also remove the associated effect. 

### SpawnGigaPoop()

`boolean SpawnGigaPoop(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` | integer topLeftGridIndexOrPosition, boolean? force)`

Helper function to spawn a giant poop. 
Will return true if the poop has successfully spawned. 

### SpawnGridEntity()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`? SpawnGridEntity(`[`GridEntityType`](https://wofsauge.github.io/IsaacDocs/rep/enums/GridEntityType.html)` gridEntityType, integer gridEntityVariant, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` | integer gridIndexOrPosition, boolean? force)`

Helper function to spawn a grid entity. 
Use this instead of `Isaac.GridSpawn` as it handles: - Walls and pits collision - Removing existing grid entities - Allows you to use the grid index 

### SpawnVoidPortal()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`? SpawnVoidPortal(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` | integer gridIndexOrPosition, boolean? force)`

Helper function to spawn a void portal. 
This is more complicated than just spawning a trapdoor with the appropriate variant, as it won't have the correct graphics and it won't lead to The Void. 

