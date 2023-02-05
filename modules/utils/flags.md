# Flags

## Overview

| Return Value | Function |
| - | - |
| integer | [AddFlags](flags.md#addflags)()`integer` flags, `integer` ...) |
| integer | [CountBits](flags.md#countbits)()`integer` mask) |
| boolean | [HasFlags](flags.md#hasflags)()`integer` flags, `integer` ...) |
| integer | [RemoveFlags](flags.md#removeflags)()`integer` flags, `integer` ...) |

## Functions

### AddFlags()

`integer AddFlags(integer flags, integer ...)`

Adds the given flag to another one. 

### CountBits()

`integer CountBits(integer mask)`

Helper function to count all the set bits in a mask 

### HasFlags()

`boolean HasFlags(integer flags, integer ...)`

Checks whether a given flag has all of the other given flags. 

### RemoveFlags()

`integer RemoveFlags(integer flags, integer ...)`

Removes the given flags from another one. 

