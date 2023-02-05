# Log

## Overview

| Return Value | Function |
| - | - |
| string? | [GetParentFunctionDescription](log.md#getparentfunctiondescription)(`number?` levels =  3 ) |
| void | [Log](log.md#log)(`string` message) |

## Functions

### GetParentFunctionDescription()

`string? GetParentFunctionDescription(number? levels =  3 )`

Helper function to get the name and the line number of the current calling function. 
For this function to work properly, the "--luadebug" flag must be enabled. Otherwise, it will always return undefined. 

### Log()

`void Log(string message)`

Helper function to avoid typing out `Isaac.DebugString()`. 
If you have the "--luadebug" launch flag turned on, then this function will also prepend the function name and the line number before the string. 

