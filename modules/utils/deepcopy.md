# DeepCopy

## Overview

| Return Value | Function |
| - | - |
| T | [DeepCopy](deepcopy.md#deepcopy)(`T` value, [`SerializationType`](../custom-enums/serializationtype.md) serializationType) |

## Functions

### DeepCopy()

`T DeepCopy(T value, `[`SerializationType`](../custom-enums/serializationtype.md)` serializationType)`

A semi-generic deep cloner. It will recursively copy all of the values so that none of the nested references remain. 
Supports the following object types: 
* Primitives (i.e, strings, numbers, and booleans) * Tables * Dictionaries * BitSet128 objects * Color objects * KColor objects * RNG objects * Vector objects 
It does not support: 
* Dictionaries with values of nil * Other Isaac API classes such as `EntityPtr` 

