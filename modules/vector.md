# Vector

## Overview

| Return Value | Function |
| - | - |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) | [CopyVector](vector.md#copyvector)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) vector) |
| void | [GetRandomVector](vector.md#getrandomvector)(`integer | RNG Optional. The seed or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called. Default is `GetRandomSeed`?` seedOrRNG?) |
| boolean | [VectorEquals](vector.md#vectorequals)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v1, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v2) |
| boolean | [VectorFuzzyEquals](vector.md#vectorfuzzyequals)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v1, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v2, `number?` epsilon =  0.001 ) |
| boolean | [VectorHasLength](vector.md#vectorhaslength)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v, `number?` epsilon =  0.001 ) |
| [Direction](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html) | [VectorToDirection](vector.md#vectortodirection)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) vector) |

## Functions

### CopyVector()

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` CopyVector(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` vector)`

Helper function to copy a `Vector` Isaac API class. 

### GetRandomVector()

`void GetRandomVector(integer | RNG Optional. The seed or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called. Default is `GetRandomSeed`? seedOrRNG?)`

Returns a random vector between (-1, -1) and (1, 1). You can get a larger vector by multiplying the returned vector. 
Unlike `RandomVector()`, this function supports seeding. 

### VectorEquals()

`boolean VectorEquals(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v1, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v2)`

Helper function to check if two vectors are exactly equal. 

### VectorFuzzyEquals()

`boolean VectorFuzzyEquals(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v1, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v2, number? epsilon =  0.001 )`

Helper function to see if two vectors are equal within the given tolerance `epsilon`. 

### VectorHasLength()

`boolean VectorHasLength(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v, number? epsilon =  0.001 )`

Helper function to see if a vector has a length greater than zero within the given tolerance `epsilon`. 

### VectorToDirection()

[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html)` VectorToDirection(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` vector)`

Returns a direction corresponding to the direction the provided vector is pointing. 

