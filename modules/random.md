# Random

## Overview

| Return Value | Function                                                                                                                                                                                                                                      |
| ------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| number       | [GetRandom](random.md#getrandom)(`integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                                                                                   |
| T            | [GetRandomElementFromWeightedList](random.md#getrandomelementfromweightedlist)(`integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG , `{chance : integer, value : T}` ...)                                         |
| T\[]         | [GetRandomElementsFromTable](random.md#getrandomelementsfromtable)(`T[]` toChoose, `integer` numberOfElements = 1, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed)) |
| number       | [GetRandomFloat](random.md#getrandomfloat)(`number` min, `number` max, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed))                                             |
| integer      | [GetRandomInt](random.md#getrandomint)(`integer` min, `integer` max, `integer\|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed), `integer[]` exceptions = {})                  |

## Functions

### GetRandom()

`number GetRandom(integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [GetRandomSeed()](rng.md#getrandomseed)`)`

This returns a random float between 0 and 1. It is inclusive on the low end, but exclusive on the high end. (This is because the [`RNG.RandomFloat`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html#randomfloat) method will never return a value of exactly 1.)

### GetRandomElementFromWeightedList()

`T GetRandomElementFromWeightedList(integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG , {chance : integer, value : T} ...)`

Returns a random value from a weighted list of possibilities. Each choice must be given as a pair of chance and value.

### GetRandomElementsFromTable()

`T[] GetRandomElementsFromTable(T[] toChoose, integer numberOfElements = 1, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [GetRandomSeed()](rng.md#getrandomseed)`)`

Returns n randomly selected elements from a table.

### GetRandomFloat()

`number GetRandomFloat(number min, number max, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [GetRandomSeed()](rng.md#getrandomseed)`)`

Returns a random float between min and max. Inclusive on the low-end, exclusive on the high-end.

### GetRandomInt()

`integer GetRandomInt(integer min, integer max, integer|`[`RNG` ](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`seedOrRNG =` [GetRandomSeed()](rng.md#getrandomseed)`, integer[] exceptions = {})`

Returns a random integer between min and max. It is inclusive on both ends.
