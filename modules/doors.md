# Doors

## Overview

| Return Value | Function |
| - | - |
| void | [CloseAllDoors](doors.md#closealldoors)(`boolean` playAnim) |
| void | [CloseDoorFast](doors.md#closedoorfast)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| integer | [DoorSlotsToDoorSlotBitMask](doors.md#doorslotstodoorslotbitmask)([`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html) ...) |
| [Direction](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html) | [DoorSlotToDirection](doors.md#doorslottodirection)([`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html) doorSlot) |
| integer | [DoorSlotToDoorSlotFlag](doors.md#doorslottodoorslotflag)([`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html) doorSlot) |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)? | [GetAngelOrDevilRoomDoor](doors.md#getangelordevilroomdoor)() |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)? | [GetAngelRoomDoor](doors.md#getangelroomdoor)() |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)? | [GetBlueWombDoor](doors.md#getbluewombdoor)() |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)? | [GetDevilRoomDoor](doors.md#getdevilroomdoor)() |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) | [GetDoorEnterPosition](doors.md#getdoorenterposition)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)\[] | [GetDoors](doors.md#getdoors)([`RoomType`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomType.html) ...) |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) | [GetDoorSlotEnterPosition](doors.md#getdoorslotenterposition)([`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html) doorSlot) |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) | [GetDoorSlotEnterPositionOffset](doors.md#getdoorslotenterpositionoffset)(`any` doorSlot) |
| [DoorSlot](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)\[] | [GetDoorSlotsForRoomShape](doors.md#getdoorslotsforroomshape)([`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) roomShape) |
| [DoorSlot](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)\[] | [GetDoorSlotsFromDoorSlotBitMask](doors.md#getdoorslotsfromdoorslotbitmask)(`integer` doorSlotBitMask) |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)\[] | [GetDoorsToRoomIndex](doors.md#getdoorstoroomindex)(`integer` ...) |
| [DoorSlot](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)? | [GetRoomShapeDoorSlot](doors.md#getroomshapedoorslot)([`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) roomShape, `integer` x, `integer` y) |
| {x:integer, y:integer}? | [GetRoomShapeDoorSlotCoordinates](doors.md#getroomshapedoorslotcoordinates)([`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) roomShape, [`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html) doorSlot) |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)? | [GetSecretExitDoor](doors.md#getsecretexitdoor)() |
| [DoorSlot](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)\[] | [GetUnusedDoorSlots](doors.md#getunuseddoorslots)() |
| boolean | [HasUnusedDoorSlot](doors.md#hasunuseddoorslot)() |
| boolean | [IsAngelRoomDoor](doors.md#isangelroomdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsBlueWombDoor](doors.md#isbluewombdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsDevilRoomDoor](doors.md#isdevilroomdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsDoorSlotInRoomShape](doors.md#isdoorslotinroomshape)([`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html) doorSlot, [`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) roomShape) |
| boolean | [IsDoorToDownpour](doors.md#isdoortodownpour)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsDoorToMausoleum](doors.md#isdoortomausoleum)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsDoorToMausoleumAscent](doors.md#isdoortomausoleumascent)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsDoorToMines](doors.md#isdoortomines)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsDoorToMomsHeart](doors.md#isdoortomomsheart)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsHiddenSecretDoor](doors.md#ishiddensecretdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsSecretExitDoor](doors.md#issecretexitdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| boolean | [IsSecretRoomDoor](doors.md#issecretroomdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| void | [LockDoor](doors.md#lockdoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| void | [OpenAllDoors](doors.md#openalldoors)(`boolean` playAnim) |
| void | [OpenDoorFast](doors.md#opendoorfast)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| void | [RemoveAllDoorsOfType](doors.md#removealldoorsoftype)([`RoomType`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomType.html) ...) |
| void | [RemoveDoor](doors.md#removedoor)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html) door) |
| void | [RemoveDoors](doors.md#removedoors)([`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`[]` doors) |

## Functions

### CloseAllDoors()

`void CloseAllDoors(boolean playAnim)`

Helper funciton to close all doors in the current room. 

### CloseDoorFast()

`void CloseDoorFast(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to open a door instantly without playing its open animation. 

### DoorSlotsToDoorSlotBitMask()

`integer DoorSlotsToDoorSlotBitMask(`[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)` ...)`

Helper function to convert the provided door slots into a door slot bitmask. 

### DoorSlotToDirection()

[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html)` DoorSlotToDirection(`[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)` doorSlot)`

Helper function to get the direction corresponding to a given door slot. 

### DoorSlotToDoorSlotFlag()

`integer DoorSlotToDoorSlotFlag(`[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)` doorSlot)`

Helper function to get a door slot flag from a door slot. 

### GetAngelOrDevilRoomDoor()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`? GetAngelOrDevilRoomDoor()`

Helper function to get an angel or devil room door in the current room. 
Note that if there are both an angel and devil room door it'll only return the one in the lowest door slot. 

### GetAngelRoomDoor()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`? GetAngelRoomDoor()`

Helper function to get the angel room door in the current room. If there isn't any, returns nil. 

### GetBlueWombDoor()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`? GetBlueWombDoor()`

Helper function to get the door that leads to the blue womb entrance in the current room. 

### GetDevilRoomDoor()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`? GetDevilRoomDoor()`

Helper function to get the devil room door in the current room. If there isn't any, returns nil. 

### GetDoorEnterPosition()

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` GetDoorEnterPosition(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to get the position that a player will enter a room at corresponding to a door. 

### GetDoors()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`[] GetDoors(`[`RoomType`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomType.html)` ...)`

Helper function to return all doors in the current room. 
You can optionally specify one or more room types to return only the doors that match the specified room types. 

### GetDoorSlotEnterPosition()

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` GetDoorSlotEnterPosition(`[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)` doorSlot)`

Helper function to get the position that a player will enter a room at corresponding to a door slot. 

### GetDoorSlotEnterPositionOffset()

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` GetDoorSlotEnterPositionOffset(any doorSlot)`

Helper function to get the offset from a door position that a player will enter a room at. 

### GetDoorSlotsForRoomShape()

[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)`[] GetDoorSlotsForRoomShape(`[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` roomShape)`

Helper function to get all the possible door slots in a room shape. 

### GetDoorSlotsFromDoorSlotBitMask()

[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)`[] GetDoorSlotsFromDoorSlotBitMask(integer doorSlotBitMask)`

Helper function to get the door slots corresponding to a door slot bit mask. 

### GetDoorsToRoomIndex()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`[] GetDoorsToRoomIndex(integer ...)`

Helper function to return all doors in the current room that lead to a given room index. 

### GetRoomShapeDoorSlot()

[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)`? GetRoomShapeDoorSlot(`[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` roomShape, integer x, integer y)`

Helper function to get the corresponding door slot for a given room shape and grid coordinates. 

### GetRoomShapeDoorSlotCoordinates()

`{x:integer, y:integer}? GetRoomShapeDoorSlotCoordinates(`[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` roomShape, `[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)` doorSlot)`

Helper function to get the grid coordinates for a specific room shape and door slot combination. 

### GetSecretExitDoor()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`? GetSecretExitDoor()`

Helper function to get the door that leads to a repentance secret exit in the current room. 

### GetUnusedDoorSlots()

[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)`[] GetUnusedDoorSlots()`

Helper function to get all unused door slots in the current room. 
Useful to spawn custom doors. 

### HasUnusedDoorSlot()

`boolean HasUnusedDoorSlot()`

Helper function to check if the current room has any unused door slots. 

### IsAngelRoomDoor()

`boolean IsAngelRoomDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to an angel deal room. 

### IsBlueWombDoor()

`boolean IsBlueWombDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door is the blue womb entrance door that appears after defeating Mom's Heart/It Lives. 

### IsDevilRoomDoor()

`boolean IsDevilRoomDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to an devil deal room. 

### IsDoorSlotInRoomShape()

`boolean IsDoorSlotInRoomShape(`[`DoorSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorSlot.html)` doorSlot, `[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` roomShape)`

Helper function to check if a given door slot can be present in a given room shape. 

### IsDoorToDownpour()

`boolean IsDoorToDownpour(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to the secret exit to Downpour. 

### IsDoorToMausoleum()

`boolean IsDoorToMausoleum(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to the secret exit to Mausoleum. 

### IsDoorToMausoleumAscent()

`boolean IsDoorToMausoleumAscent(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to the secret exit to the ascent version of Mausoleum, located in Depths 2 and requires The Polaroid or The Negative to open. 

### IsDoorToMines()

`boolean IsDoorToMines(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to the secret exit to Mines. 

### IsDoorToMomsHeart()

`boolean IsDoorToMomsHeart(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door is the door that spawns after defeating Mom in Mausoleum II and requires both knife pieces to open. 

### IsHiddenSecretDoor()

`boolean IsHiddenSecretDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to check if a door is a hole in the wall that appears after bombing the entrance to a secret room but hasn't been revealed yet. 

### IsSecretExitDoor()

`boolean IsSecretExitDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to see if a door leads to any of the secret exit introduced in Repentance, that lead you to the Repentance floors. 

### IsSecretRoomDoor()

`boolean IsSecretRoomDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to check if a door is a hole in the wall that appears after bombing the entrance to a secret room. 
Note that the door still exists even if it hasn't been bombed yet. 

### LockDoor()

`void LockDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to reset an unlocked door back to its locked state. 

### OpenAllDoors()

`void OpenAllDoors(boolean playAnim)`

Helper funciton to open all doors in the current room 

### OpenDoorFast()

`void OpenDoorFast(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to open a door instantly without playing its open animation. 

### RemoveAllDoorsOfType()

`void RemoveAllDoorsOfType(`[`RoomType`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomType.html)` ...)`

Helper function to remove all doors of the given room types. 

### RemoveDoor()

`void RemoveDoor(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)` door)`

Helper function to remove a single door 

### RemoveDoors()

`void RemoveDoors(`[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`[] doors)`

Helper function to remove all the given doors 

