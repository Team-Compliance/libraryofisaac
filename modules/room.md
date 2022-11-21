# Room

## Overview

| Return Value | Function                                                                                                                                                              |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| void         | [EmptyRoom](room.md#emptyroom)()                                                                                                                                      |
| integer      | [GetRoomShapeGridWidth](room.md#getroomshapegridwidth)([`RoomShape` ](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)shape)                            |
| boolean      | [IsGridIndexInRoom](room.md#isgridindexinroom)(`integer` gridIndex)                                                                                                   |
| boolean      | [IsGridIndexInRoomShape](room.md#isgridindexinroomshape)(`integer` gridIndex, [`RoomShape` ](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)roomShape) |
| void         | [UpdateRoom](room.md#updateroom)()                                                                                                                                    |

## Functions

### EmptyRoom()

`void EmptyRoom()`

Helper function to remove all naturally spawning entities and grid entities from a room. Notably, this will not remove players, tears, familiars, lasers, knives, projectiles, blacklisted NPCs such as Dark Esau, charmed NPCs, friendly NPCs, persistent NPCs, most effects, doors, and walls.

### GetRoomShapeGridWidth()

`integer GetRoomShapeGridWidth(`[`RoomShape` ](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)`shape)`

Helper function to get the width of the grid in a given room shape.

### IsGridIndexInRoom()

`boolean IsGridIndexInRoom(integer gridIndex)`

Helper function to check if a grid index is inside a room, including walls. Accounts for room shape.

### IsGridIndexInRoomShape()

`boolean IsGridIndexInRoomShape(integer gridIndex,` [`RoomShape` ](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)`roomShape)`

Helper function to check if a grid index is valid in a certain room shape.

Doesn't account for being out of bounds (less than 0 or greater than the grid size). For that use [`IsGridIndexInRoom()`](room.md#isgridindexinroom).

### UpdateRoom()

`void UpdateRoom()`

Helper function to trigger a room update without affecting entity positions or velocities.
