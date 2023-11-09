# Pause

## Overview

| Return Value | Function |
| - | - |
| boolean | [IsPaused](pause.md#ispaused)() |
| void | [Pause](pause.md#pause)() |
| void | [Unpause](pause.md#unpause)() |

## Functions

### IsPaused()

`boolean IsPaused()`

Helper function to check if the game is being paused by the library 

### Pause()

`void Pause()`

Helper function to pause the game similarly to how the game does when showing a giant book or an achievement. 
Internally it's done by using the pause item on every frame and keeping track of every tear and projectile's states. 

### Unpause()

`void Unpause()`

Unpauses the game if it was previously paused by `TSIL.Pause.Pause()`. 
Because of limitations with the Pause item, this will remove all projectiles. 

