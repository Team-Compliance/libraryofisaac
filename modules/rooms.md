# Rooms

## Overview

| Return Value | Function |
| - | - |
| void | [EmptyRoom](rooms.md#emptyroom)() |
| RoomHistoryData | [GetLatestRoomDescription](rooms.md#getlatestroomdescription)() |
| RoomHistoryData | [GetPreviousRoomDescription](rooms.md#getpreviousroomdescription)() |
| RoomConfig_Room? | [GetRoomData](rooms.md#getroomdata)(`integer?` roomGridIndex) |
| [RoomDescriptor](https://wofsauge.github.io/IsaacDocs/rep/RoomDescriptor.html) | [GetRoomDescriptor](rooms.md#getroomdescriptor)(`integer?` roomGridIndex) |
| [RoomDescriptor](https://wofsauge.github.io/IsaacDocs/rep/RoomDescriptor.html) | [GetRoomDescriptorReadOnly](rooms.md#getroomdescriptorreadonly)() |
| integer | [GetRoomGridIndex](rooms.md#getroomgridindex)() |
| RoomHistoryData\[] | [GetRoomHistory](rooms.md#getroomhistory)() |
| integer | [GetRoomShapeGridWidth](rooms.md#getroomshapegridwidth)([`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) shape) |
| integer | [GetRoomStageID](rooms.md#getroomstageid)(`integer?` roomGridIndex) |
| integer | [GetRoomSubType](rooms.md#getroomsubtype)(`integer?` roomGridIndex) |
| boolean | [InBossRoomOf](rooms.md#inbossroomof)([`BossID`](../custom-enums/bossid.md) bossID) |
| boolean | [IsGridIndexInRoom](rooms.md#isgridindexinroom)(`integer` gridIndex) |
| boolean | [IsGridIndexInRoomShape](rooms.md#isgridindexinroomshape)(`integer` gridIndex, [`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html) roomShape) |
| boolean | [IsLeavingRoom](rooms.md#isleavingroom)() |
| void | [UpdateRoom](rooms.md#updateroom)() |

## Functions

### EmptyRoom()

`void EmptyRoom()`

Helper function to remove all naturally spawning entities and grid entities from a room. Notably, this will not remove players, tears, familiars, lasers, knives, projectiles, blacklisted NPCs such as Dark Esau, charmed NPCs, friendly NPCs, persistent NPCs, most effects, doors, and walls. 

### GetLatestRoomDescription()

`RoomHistoryData GetLatestRoomDescription()`

Helper function to get information about the most recent room that is stored in the room history array. 
This is useful in the `POST_ENTITY_REMOVE` callback; see the `isLeavingRoom` function. 
Note that this function can return undefined in the case where it is called on the first room of the run. 

### GetPreviousRoomDescription()

`RoomHistoryData GetPreviousRoomDescription()`

Helper function to get information about the room that was previously visited. 
In the special case of only one room having been visited thus far (i.e. the starting room of the run), the starting room will be returned. 

### GetRoomData()

`RoomConfig_Room? GetRoomData(integer? roomGridIndex)`

Helper function to get the room data for the provided room. 

### GetRoomDescriptor()

[`RoomDescriptor`](https://wofsauge.github.io/IsaacDocs/rep/RoomDescriptor.html)` GetRoomDescriptor(integer? roomGridIndex)`

Helper function to get the descriptor for a room. 

### GetRoomDescriptorReadOnly()

[`RoomDescriptor`](https://wofsauge.github.io/IsaacDocs/rep/RoomDescriptor.html)` GetRoomDescriptorReadOnly()`

Alias for the `Level.GetCurrentRoomDesc` method. Use this to make it more clear what type of `RoomDescriptor` object that you are retrieving. 

### GetRoomGridIndex()

`integer GetRoomGridIndex()`

Helper function to get the grid index of the current room. 
- If the current room is inside of the grid, this function will return the `SafeGridIndex` from the room descriptor. (The safe grid index is defined as the top-left 1x1 section that the room overlaps with, or the top-right 1x1 section of a `RoomType.SHAPE_LTL` room.) - If the current room is outside of the grid, it will return the index from the `Level.GetCurrentRoomIndex` method (since `SafeGridIndex` is bugged for these cases). 
Use this function instead of the `Level.GetCurrentRoomIndex` method directly because the latter will return the specific 1x1 quadrant that the player entered the room at. For most situations, using the safe grid index is more reliable than this. 
Data structures that store data per room should use the room's `ListIndex` instead of `SafeGridIndex`, since the former is unique across different dimensions. 

### GetRoomHistory()

`RoomHistoryData[] GetRoomHistory()`

@class RoomHistoryData @field Stage LevelStage @field StageType StageType @field RoomType RoomType @field StageID StageID @field Dimension Dimension @field RoomVariant integer @field RoomSubType integer @field RoomName string @field RoomGridIndex integer @field RoomListIndex integer @field RoomVisitedCount integer Helper function to get information about all of the rooms that a player has visited thus far on this run. 

### GetRoomShapeGridWidth()

`integer GetRoomShapeGridWidth(`[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` shape)`

Helper function to get the width of the grid in a given room shape. 

### GetRoomStageID()

`integer GetRoomStageID(integer? roomGridIndex)`

Helper function to get the stage ID for a room from the XML/STB data. The room stage ID will correspond to the first number in the filename of the XML/STB file. For example, a Depths room would have a stage ID of 7. 

### GetRoomSubType()

`integer GetRoomSubType(integer? roomGridIndex)`

Helper function to get the sub-type for a room from the XML/STB data. The room sub-type will correspond to different things depending on what XML/STB file it draws from. For example, in the "00.special rooms.stb" file, an Angel Room with a sub-type of 0 will correspond to a normal Angel Room and a sub-type of 1 will correspond to an Angel Room shop for The Stairway. 

### InBossRoomOf()

`boolean InBossRoomOf(`[`BossID`](../custom-enums/bossid.md)` bossID)`

Helper function to check if the current room is a boss room for a particular boss. This will only work for bosses that have dedicated boss rooms in the "00.special rooms.stb" file. 

### IsGridIndexInRoom()

`boolean IsGridIndexInRoom(integer gridIndex)`

Helper function to check if a grid index is inside a room, including walls. Accounts for room shape. 

### IsGridIndexInRoomShape()

`boolean IsGridIndexInRoomShape(integer gridIndex, `[`RoomShape`](https://wofsauge.github.io/IsaacDocs/rep/enums/RoomShape.html)` roomShape)`

Helper function to check if a grid index is valid in a certain room shape. 
Doesn't account for being out of bounds (less than 0 or greater than the grid size). For that use `TSIL.Rooms.IsGridIndexInRoom` 

### IsLeavingRoom()

`boolean IsLeavingRoom()`

Helper function to detect if the game is in the state where the room index has changed to a new room, but the entities from the previous room are currently in the process of despawning. (At this point, the `POST_NEW_ROOM` callback and the `POST_NEW_ROOM_EARLY` callback will not have fired yet, and there will not be an entry in the room history array for the current room.) 
This function is intended to be used in the `POST_ENTITY_REMOVE` callback to detect when an entity is despawning. 

### UpdateRoom()

`void UpdateRoom()`

Helper function to trigger a room update without affecting entity positions or velocities. 

