# IsaacAPIClass

## Overview

| Return Value | Function |
| - | - |
| string? | [GetIsaacAPIClassName](isaacapiclass.md#getisaacapiclassname)(`unknown` object) |
| boolean | [IsBitSet128](isaacapiclass.md#isbitset128)(`unknown` variable) |
| boolean | [IsColor](isaacapiclass.md#iscolor)(`unknown` variable) |
| boolean | [IsKColor](isaacapiclass.md#iskcolor)(`unknown` variable) |
| boolean | [IsKnife](isaacapiclass.md#isknife)(`unknown` variable) |
| boolean | [IsLaser](isaacapiclass.md#islaser)(`unknown` variable) |
| boolean | [IsNPC](isaacapiclass.md#isnpc)(`unknown` variable) |
| boolean | [IsPickup](isaacapiclass.md#ispickup)(`unknown` variable) |
| boolean | [IsPit](isaacapiclass.md#ispit)(`unknown` variable) |
| boolean | [IsPlayer](isaacapiclass.md#isplayer)(`unknown` variable) |
| boolean | [IsPoop](isaacapiclass.md#ispoop)(`unknown` variable) |
| boolean | [IsPressurePlate](isaacapiclass.md#ispressureplate)(`unknown` variable) |
| boolean | [IsProjectile](isaacapiclass.md#isprojectile)(`unknown` variable) |
| boolean | [IsRNG](isaacapiclass.md#isrng)(`unknown` variable) |
| boolean | [IsRock](isaacapiclass.md#isrock)(`unknown` variable) |
| boolean | [IsSpikes](isaacapiclass.md#isspikes)(`unknown` variable) |
| boolean | [IsTear](isaacapiclass.md#istear)(`unknown` variable) |
| boolean | [IsTNT](isaacapiclass.md#istnt)(`unknown` variable) |
| boolean | [IsVector](isaacapiclass.md#isvector)(`unknown` variable) |

## Functions

### GetIsaacAPIClassName()

`string? GetIsaacAPIClassName(unknown object)`

Helper function to get the name of a class from the Isaac API. This is contained within the "__type" metatable key. 
For example, a `Vector` class is has a name of "Vector". 
Returns nil if the object is not of type `userdata` or if the "__type" metatable key does not exist. 
In some cases, Isaac classes can be a read-only. If this is the case, the "__type" field will be prepended with "const ". This function will always strip this prefix, if it exists. For example, the class name returned for "const Vector" will be "Vector". 

### IsBitSet128()

`boolean IsBitSet128(unknown variable)`

Helper function to check if something is an instantiated `BitSet128` object. 

### IsColor()

`boolean IsColor(unknown variable)`

Helper function to check if something is an instantiated `Color` object. 

### IsKColor()

`boolean IsKColor(unknown variable)`

Helper function to detect if a variable is of type `KColor` 

### IsKnife()

`boolean IsKnife(unknown variable)`

Helper function to detect if a variable is of type `EntityKnife` 

### IsLaser()

`boolean IsLaser(unknown variable)`

Helper function to detect if a variable is of type `EntityLaser` 

### IsNPC()

`boolean IsNPC(unknown variable)`

Helper function to detect if a variable is of type `EntityNPC` 

### IsPickup()

`boolean IsPickup(unknown variable)`

Helper function to detect if a variable is of type `EntityPickup` 

### IsPit()

`boolean IsPit(unknown variable)`

Helper function to detect if a variable is of type `GridEntityPit` 

### IsPlayer()

`boolean IsPlayer(unknown variable)`

Helper function to detect if a variable is of type `EntityPlayer` 

### IsPoop()

`boolean IsPoop(unknown variable)`

Helper function to detect if a variable is of type `GridEntityPoop` 

### IsPressurePlate()

`boolean IsPressurePlate(unknown variable)`

Helper function to detect if a variable is of type `GridEntityPressurePlate` 

### IsProjectile()

`boolean IsProjectile(unknown variable)`

Helper function to detect if a variable is of type `EntityProjectile` 

### IsRNG()

`boolean IsRNG(unknown variable)`

Helper function to detect if a variable is of type `RNG` 

### IsRock()

`boolean IsRock(unknown variable)`

Helper function to detect if a variable is of type `GridEntityRock` 

### IsSpikes()

`boolean IsSpikes(unknown variable)`

Helper function to detect if a variable is of type `GridEntitySpikes` 

### IsTear()

`boolean IsTear(unknown variable)`

Helper function to detect if a variable is of type `EntityTear` 

### IsTNT()

`boolean IsTNT(unknown variable)`

Helper function to detect if a variable is of type `GridEntityTNT` 

### IsVector()

`boolean IsVector(unknown variable)`

Helper function to detect if a variable is of type `Vector` 

