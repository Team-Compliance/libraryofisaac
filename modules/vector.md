# Vector

## Overview

| Return Value | Function |
| - | - |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) | [CopyVector](vector.md#copyvector)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) vector) |
| boolean | [VectorEquals](vector.md#vectorequals)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v1, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v2) |
| boolean | [VectorFuzzyEquals](vector.md#vectorfuzzyequals)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v1, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v2, `number?` epsilon =  0.001 ) |
| boolean | [VectorHasLength](vector.md#vectorhaslength)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v, `number?` epsilon =  0.001 ) |

## Functions

### CopyVector()

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` CopyVector(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` vector)`

Helper function to copy a `Vector` Isaac API class. 

### VectorEquals()

`boolean VectorEquals(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v1, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v2)`

Helper function to check if two vectors are exactly equal. 

### VectorFuzzyEquals()

`boolean VectorFuzzyEquals(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v1, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v2, number? epsilon =  0.001 )`

Helper function to see if two vectors are equal within the given tolerance `epsilon`. 

### VectorHasLength()

`boolean VectorHasLength(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v, number? epsilon =  0.001 )`

Helper function to see if a vector has a length greater than zero within the given tolerance `epsilon`. 

