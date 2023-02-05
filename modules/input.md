# Input

## Overview

| Return Value | Function |
| - | - |
| [ButtonAction](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)\[] | [GetMoveActions](input.md#getmoveactions)() |
| [Keyboard](https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html)? | [GetPressedModifier](input.md#getpressedmodifier)() |
| [ButtonAction](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)\[] | [GetShootActions](input.md#getshootactions)() |
| boolean | [IsActionPressedOnAnyInput](input.md#isactionpressedonanyinput)([`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html) action) |
| boolean | [IsActionTriggeredOnAnyInput](input.md#isactiontriggeredonanyinput)([`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html) action) |
| boolean | [IsKeyboardPressed](input.md#iskeyboardpressed)([`Keyboard`](https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html) ...) |
| boolean | [IsMoveAction](input.md#ismoveaction)([`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html) buttonAction) |
| boolean | [IsMoveActionPressedOnAnyInput](input.md#ismoveactionpressedonanyinput)() |
| boolean | [IsMoveActionTriggeredOnAnyInput](input.md#ismoveactiontriggeredonanyinput)() |
| boolean | [IsShootAction](input.md#isshootaction)([`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html) buttonAction) |
| boolean | [IsShootActionPressedOnAnyInput](input.md#isshootactionpressedonanyinput)() |
| boolean | [IsShootActionTriggeredOnAnyInput](input.md#isshootactiontriggeredonanyinput)() |
| string | [KeyboardToString](input.md#keyboardtostring)([`Keyboard`](https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html) key, `boolean` shiftPressed) |

## Functions

### GetMoveActions()

[`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)`[] GetMoveActions()`

Helper function to get all the values of the `ButtonAction` enum that correspond to movement. 

### GetPressedModifier()

[`Keyboard`](https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html)`? GetPressedModifier()`

Helper function to get the modifier key that is being pressed in the keyboard 
A modifier key is defined as shift, control, alt, or Windows. 

### GetShootActions()

[`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)`[] GetShootActions()`

Helper function to get all the values of the `ButtonAction` enum that correspond to shooting. 

### IsActionPressedOnAnyInput()

`boolean IsActionPressedOnAnyInput(`[`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)` action)`

Helper function to check if a given Button Action is being pressed in any controller. 

### IsActionTriggeredOnAnyInput()

`boolean IsActionTriggeredOnAnyInput(`[`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)` action)`

Helper function to check if a given Button Action is being triggered in any controller. 

### IsKeyboardPressed()

`boolean IsKeyboardPressed(`[`Keyboard`](https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html)` ...)`

Helper function to see if any of the given keys are being pressed in the keyboard. 

### IsMoveAction()

`boolean IsMoveAction(`[`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)` buttonAction)`

Helper function to check if a given Button Action corresponds to movement. 

### IsMoveActionPressedOnAnyInput()

`boolean IsMoveActionPressedOnAnyInput()`

Helper function to check if a move action is being pressed in any controller. 

### IsMoveActionTriggeredOnAnyInput()

`boolean IsMoveActionTriggeredOnAnyInput()`

Helper function to check if a move action is being triggered in any controller. 

### IsShootAction()

`boolean IsShootAction(`[`ButtonAction`](https://wofsauge.github.io/IsaacDocs/rep/enums/ButtonAction.html)` buttonAction)`

Helper function to check if a given Button Action corresponds to shooting. 

### IsShootActionPressedOnAnyInput()

`boolean IsShootActionPressedOnAnyInput()`

Helper function to check if a shoot action is being pressed in any controller. 

### IsShootActionTriggeredOnAnyInput()

`boolean IsShootActionTriggeredOnAnyInput()`

Helper function to check if a shoot action is being triggered in any controller. 

### KeyboardToString()

`string KeyboardToString(`[`Keyboard`](https://wofsauge.github.io/IsaacDocs/rep/enums/Keyboard.html)` key, boolean shiftPressed)`

Helper function to get the string that would be typed if someone pressed the corresponding key. 

