# Random

## Overview

| Return Value | Function |
| - | - |
| number | [GetRandom](random.md#getrandom)(`integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG =  `tsil.rng.getrandomseed()` ) |
| T | [GetRandomElementFromWeightedList](random.md#getrandomelementfromweightedlist)(`integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) seedOrRNG, `{chance : number, value : T}[]` possibles) |
| T\[] | [GetRandomElementsFromTable](random.md#getrandomelementsfromtable)(`T[]` toChoose, `integer?` numberOfElements? =  1, `integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG =  `tsil.rng.getrandomseed()` ) |
| number | [GetRandomFloat](random.md#getrandomfloat)(`number The lower bound for the random number (inclusive).` min, `number The upper bound for the random number (exclusive)` max, `integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG =  `tsil.rng.getrandomseed()` ) |
| integer | [GetRandomInt](random.md#getrandomint)(`integer The lower bound for the random number (inclusive).` min, `integer The upper bound for the random number (inclusive)` max, `number | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG =  `tsil.rng.getrandomseed()` , `integer Optional. An array of elements that will be skipped over when getting the random integer. For example, a min of 1, a max of 4, and an exceptions array of `[2]` woudl cause the function to return either 1, 3, or 4. Default is an empty array.` exceptions) |

## Functions

### GetRandom()

`number GetRandom(integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG =  `tsil.rng.getrandomseed()` )`

This returns a random float between 0 and 1. It is inclusive on the low end, but exclusive on the high end. (This is because the `RNG.RandomFloat` method will never return a value of exactly 1.) 

### GetRandomElementFromWeightedList()

`T GetRandomElementFromWeightedList(integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)` seedOrRNG, {chance : number, value : T}[] possibles)`

Returns a random value from a weighted list of possibilities. Each choice must be given as a pair of chance and value. 
`{chance = x, value = y}` 

### GetRandomElementsFromTable()

`T[] GetRandomElementsFromTable(T[] toChoose, integer? numberOfElements? =  1, integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG =  `tsil.rng.getrandomseed()` )`

Returns n randomly selected elements from a table. 

### GetRandomFloat()

`number GetRandomFloat(number The lower bound for the random number (inclusive). min, number The upper bound for the random number (exclusive) max, integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG =  `tsil.rng.getrandomseed()` )`

This returns a random float between min and max. 

### GetRandomInt()

`integer GetRandomInt(integer The lower bound for the random number (inclusive). min, integer The upper bound for the random number (inclusive) max, number | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG =  `tsil.rng.getrandomseed()` , integer Optional. An array of elements that will be skipped over when getting the random integer. For example, a min of 1, a max of 4, and an exceptions array of `[2]` woudl cause the function to return either 1, 3, or 4. Default is an empty array. exceptions)`

This returns a random integer between min and max. It is inclusive on both ends. Note that this function will run the `Next` method on the `RNG` object before returning the random number. 

