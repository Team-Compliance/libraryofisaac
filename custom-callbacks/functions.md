# Functions

## Overview

| Return value | Function                                                                                                                                                                                                                                                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| void         | [AddVanillaCallback](functions.md#addvanillacallback-mod-callback-funct-priority-optionalparam)(`table` mod, [`ModCallbacks` ](https://wofsauge.github.io/IsaacDocs/rep/enums/ModCallbacks.html)callback, `function` funct, [`CallbackPriority`](../custom-enums/callbackpriority.md)`\|integer` priority, `integer?` optionalParam) |
| void         | [RemoveVanillaCallback](functions.md#removevanillacallback)(`table` mod, [`ModCallbacks`](https://wofsauge.github.io/IsaacDocs/rep/enums/ModCallbacks.html) callback, `function` funct)                                                                                                                                              |
| void         | [AddCustomCallback](functions.md#addcustomcallback)(`table` mod, [`CustomCallback` ](customcallback.md)callback, `function` funct, [`CallbackPriority`](../custom-enums/callbackpriority.md)`\|integer` priority, `integer` ...)                                                                                                     |
| void         | [RemoveCustomCallback](broken-reference)(`table` mod, [`CustomCallback` ](customcallback.md)callback, `function` funct)                                                                                                                                                                                                              |

## Functions

### AddVanillaCallback(mod, callback, funct, priority, optionalParam)

`void AddVanillaCallback(table mod,` [`ModCallbacks` ](https://wofsauge.github.io/IsaacDocs/rep/enums/ModCallbacks.html)`callback, function funct,` [`CallbackPriority`](../custom-enums/callbackpriority.md)`|integer priority, integer? optionalParam)`

Registers a vanilla callback.

Use this instead of [`mod.AddCallback()`](https://wofsauge.github.io/IsaacDocs/rep/ModReference.html#addcallback) so you can use the priority system and to avoidsome compatibility issues.

### RemoveVanillaCallback()

`void RemoveVanillaCallback(table mod,` [`ModCallbacks`](https://wofsauge.github.io/IsaacDocs/rep/enums/ModCallbacks.html) `callback, function funct)`

Unregisters a vanilla callback.

### AddCustomCallback()

`void AddCustomCallback(table mod,` [`CustomCallback` ](customcallback.md)`callback, function funct,` [`CallbackPriority`](../custom-enums/callbackpriority.md)`|integer priority, integer ...)`

Registers a custom callback.

### RemoveCustomCallback()

`void RemoveCustomCallback(table mod,` [`CustomCallback` ](customcallback.md)`callback, function funct)`

Unregisters a custom callback.
