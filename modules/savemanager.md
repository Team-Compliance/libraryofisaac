# SaveManager

## Overview

| Return Value | Function                                                                                                                                                                                             |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| void         | [AddPersistentVariable](savemanager.md#addpersistentvariable)(`table` mod, `string` variableName, `any` value, [VariablePersistenceMode](../custom-enums/variablepersistentmode.md) persistenceMode) |
| any          | [GetPersistentVariable](savemanager.md#getpersistentvariable)(`table` mod, `string` variableName)                                                                                                    |
| void         | [RemovePersistentVariable](savemanager.md#removepersistentvariable)(`table` mod, `string` variableName)                                                                                              |
| void         | [ResetPersistentVariable](savemanager.md#resetpersistentvariable)(`table` mod, `string` variableName)                                                                                                |
| void         | [SetPersistentVariable](savemanager.md#setpersistentvariable)(`table` mod, `string` variableName, `any` newValue, `boolean` overrideType = false)                                                    |

## Functions

### AddPersistentVariable()

`void AddPersistentVariable(table mod, string variableName, any value,` [`VariablePersistenceMode`](../custom-enums/variablepersistentmode.md) `persistenceMode)`

Adds a variable to the save manager.

{% hint style="warning" %}
The variable name must be unique within your mod.
{% endhint %}

### GetPersistentVariable()

`any GetPersistentVariable(table mod, string variableName)`

Gets a variable from the save manager.

### RemovePersistentVariable()

`void RemovePersistentVariable(table mod, string variableName)`

Removes a variable from the save manager.

### ResetPersistentVariable()

`void ResetPersistentVariable(table mod, string variableName)`

Resets a variable to its default value in the save manager.

### SetPersistentVariable()

`void SetPersistentVariable(table mod, string variableName, any newValue, boolean overrideType = false)`

Sets a variable from the save manager. If the new value's type doesn't correspond to whatever type the default value's type is this function will error. Set `overrideType` to true, to skip this check.
