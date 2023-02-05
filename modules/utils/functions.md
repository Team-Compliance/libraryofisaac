# Functions

## Overview

| Return Value | Function |
| - | - |
| void | [RunInFrames](functions.md#runinframes)(`function` funct, `integer` frames, `any` ...) |
| void | [RunNextLevel](functions.md#runnextlevel)(`function` funct, `any` ...) |
| void | [RunNextRoom](functions.md#runnextroom)(`function` funct, `any` ...) |

## Functions

### RunInFrames()

`void RunInFrames(function funct, integer frames, any ...)`

Runs a function in a given number of frames. 

### RunNextLevel()

`void RunNextLevel(function funct, any ...)`

Runs a given function on the next `POST_NEW_LEVEL` callback. 

### RunNextRoom()

`void RunNextRoom(function funct, any ...)`

Runs a given function on the next `POST_NEW_ROOM` callback. 

