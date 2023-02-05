# GridIndexes

## Overview

| Return Value | Function |
| - | - |
| integer\[] | [GetAllGridIndexes](gridindexes.md#getallgridindexes)(`boolean?` onlyInRoom) |
| integer\[] | [GetGridIndexesBetween](gridindexes.md#getgridindexesbetween)(`integer` gridIndex1, `integer` gridIndex2, [`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) roomShape) |

## Functions

### GetAllGridIndexes()

`integer[] GetAllGridIndexes(boolean? onlyInRoom)`

Helper function to get every legal grid index for the current room. If `onlyInRoom` is set to true it will only return those that are actually in the room, accounting for L shaped and small rooms. 

### GetGridIndexesBetween()

`integer[] GetGridIndexesBetween(integer gridIndex1, integer gridIndex2, `[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` roomShape)`

Helper function to get all the grid indexes between two others. 
Note that the two grid indexes need to be in the same column or row. 

