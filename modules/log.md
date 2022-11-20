# Log

## Overview

| Return Value | Function                                                                                  |
| ------------ | ----------------------------------------------------------------------------------------- |
| string?      | [GetParentFunctionDescription](log.md#getparentfunctiondescription)(`integer` levels = 3) |
| void         | [Log](log.md#log)(`string` message)                                                       |

## Functions

### GetParentFunctionDescription()

`string? GetParentFunctionDescription(integer levels = 3)`

Helper function to get the name and the line number of the current calling function.

{% hint style="info" %}
For this function to work properly, the "--luadebug" flag must be enabled. Otherwise, it will always return undefined.
{% endhint %}

### Log()

`void Log(string message)`

Helper function to avoid typing out [`Isaac.DebugString()`](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#debugstring).

{% hint style="info" %}
If you have the "--luadebug" launch flag turned on, then this function will also prepend the function name and the line number before the string.
{% endhint %}
