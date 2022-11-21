# Debug

## Overview

| Return Value | Function                                          |
| ------------ | ------------------------------------------------- |
| number       | [GetTime](debug.md#gettime)()                     |
| string       | [GetTraceback](debug.md#gettraceback)()           |
| boolean      | [IsLuaDebugEnabled](debug.md#isluadebugenabled)() |
| void         | [Traceback](debug.md#traceback)()                 |

## Functions

### GetTime()

`number GetTime()`

Helper function to get the current time for benchmarking / profiling purposes.

The return value will either be in seconds or milliseconds, depending on if the "--luadebug" flag is turned on or not.

If the "--luadebug" flag is present, then this function will use the `socket.gettime` method, which returns the epoch timestamp in seconds (e.g. "1640320492.5779"). This is preferable over the more conventional `Isaac.GetTime` method, since it has one extra decimal point of precision.

If the "--luadebug" flag is not present, then this function will use the `Isaac.GetTime` method, which returns the number of milliseconds since the computer's operating system was started (e.g. "739454963").

### GetTraceback()

`string GetTraceback()`

Helper function to get a stack trace.

{% hint style="warning" %}
This will only work if the `--luadebug` launch option is enabled.
{% endhint %}

### IsLuaDebugEnabled()

`boolean IsLuaDebugEnabled()`

Players can boot the game with an launch option called "--luadebug", which will enable additional functionality that is considered to be unsafe. For more information about this flag, see the wiki: https://bindingofisaacrebirth.fandom.com/wiki/Launch\_Options.

When this flag is enabled, the global environment will be slightly different. The differences are documented here: https://wofsauge.github.io/IsaacDocs/rep/Globals.html

This function uses the `package` global variable as a proxy to determine if the "--luadebug" flag is enabled or not.

### Traceback()

`void Traceback()`

Helper function to print a stack trace to the "log.txt" file, similar to JavaScript's `console.trace` function.

{% hint style="warning" %}
This will only work if the `--luadebug` launch option is enabled
{% endhint %}
