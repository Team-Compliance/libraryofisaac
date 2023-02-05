# SaveManager

## Overview

| Return Value | Function |
| - | - |
| void | [AddPersistentVariable](savemanager.md#addpersistentvariable)(`table` mod, `string` variableName, `any` value, [`VariablePersistenceMode`](../custom-enums/variablepersistencemode.md) persistenceMode, `boolean?` ignoreGlowingHourglass? =  false, `fun(: )?` conditionalSave?) |
| any | [GetPersistentVariable](savemanager.md#getpersistentvariable)(`table` mod, `string` variableName) |
| void | [RemovePersistentVariable](savemanager.md#removepersistentvariable)(`table` mod, `string` variableName) |
| void | [RemoveVariablesForFeatureKey](savemanager.md#removevariablesforfeaturekey)(`ModPersistentData` modPersistentData, `"run" | "level" | "room"` saveDataKey) |
| void | [ResetPersistentVariable](savemanager.md#resetpersistentvariable)(`table` mod, `string` variableName) |
| void | [RestoreDefaultForFeatureKey](savemanager.md#restoredefaultforfeaturekey)(`ModPersistentData` modPersistentData, `"run" | "level" | "room"` saveDataKey) |
| void | [RestoreDefaultsForAllFeaturesKey](savemanager.md#restoredefaultsforallfeatureskey)(`"run" | "level" | "room"` saveKey) |
| void | [SetPersistentVariable](savemanager.md#setpersistentvariable)(`table` mod, `string` variableName, `any` newValue, `boolean?` overrideType? =  false) |

## Functions

### AddPersistentVariable()

`void AddPersistentVariable(table mod, string variableName, any value, `[`VariablePersistenceMode`](../custom-enums/variablepersistencemode.md)` persistenceMode, boolean? ignoreGlowingHourglass? =  false, fun(: )? conditionalSave?)`

Adds a variable to the save manager. The variable name must be unique within your mod. 

### GetPersistentVariable()

`any GetPersistentVariable(table mod, string variableName)`

Gets a variable from the save manager. 

### RemovePersistentVariable()

`void RemovePersistentVariable(table mod, string variableName)`

Removes a variable from the save manager. 

### RemoveVariablesForFeatureKey()

`void RemoveVariablesForFeatureKey(ModPersistentData modPersistentData, "run" | "level" | "room" saveDataKey)`



### ResetPersistentVariable()

`void ResetPersistentVariable(table mod, string variableName)`

Resets a variable to its default value in the save manager. 

### RestoreDefaultForFeatureKey()

`void RestoreDefaultForFeatureKey(ModPersistentData modPersistentData, "run" | "level" | "room" saveDataKey)`



### RestoreDefaultsForAllFeaturesKey()

`void RestoreDefaultsForAllFeaturesKey("run" | "level" | "room" saveKey)`



### SetPersistentVariable()

`void SetPersistentVariable(table mod, string variableName, any newValue, boolean? overrideType? =  false)`

Sets a variable from the save manager. 

