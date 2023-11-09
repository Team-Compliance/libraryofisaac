# Functions

## Overview

| Return Value | Function |
| - | - |
| void | [RunInFrames](functions.md#runinframes)(`function` funct, `integer` frames, `any` ...) |
| void | [RunInFramesTemporary](functions.md#runinframestemporary)(`function` funct, `integer` frames, `any` ...) |
| void | [RunNextCallback](functions.md#runnextcallback)(`table` mod, [`ModCallbacks`](https://wofsauge.github.io/IsaacDocs/rep/enums/ModCallbacks.html)` | `[`CustomCallback`](../custom-enums/customcallback.md) callback, `function` funct, `any?` optionalParam) |
| void | [RunNextLevel](functions.md#runnextlevel)(`function` funct, `any` ...) |
| void | [RunNextRoom](functions.md#runnextroom)(`function` funct, `any` ...) |

## Functions

### RunInFrames()

`void RunInFrames(function funct, integer frames, any ...)`

Runs a function in a given number of frames. 

### RunInFramesTemporary()

`void RunInFramesTemporary(function funct, integer frames, any ...)`

Runs a function in a given number of frames. 
Unlike `TSIL.Utils.Functions.RunInFrames` this will not persist when moving to a different room. 

### RunNextCallback()

`void RunNextCallback(table mod, `[`ModCallbacks`](https://wofsauge.github.io/IsaacDocs/rep/enums/ModCallbacks.html)` | `[`CustomCallback`](../custom-enums/customcallback.md)` callback, function funct, any? optionalParam)`

Runs a function the next time a callback is triggered. After it gets called once, it is removed 

### RunNextLevel()

`void RunNextLevel(function funct, any ...)`

Runs a given function on the next `POST_NEW_LEVEL` callback. 

### RunNextRoom()

`void RunNextRoom(function funct, any ...)`

Runs a given function on the next `POST_NEW_ROOM` callback. 

