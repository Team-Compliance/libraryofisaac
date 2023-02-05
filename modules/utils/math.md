# Math

## Overview

| Return Value | Function |
| - | - |
| number | [Clamp](math.md#clamp)(`number` a, `number` min, `number` max) |
| boolean | [IsCircleIntersectingWithRectangle](math.md#iscircleintersectingwithrectangle)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) RectPos, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) RectSize, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) CirclePos, `number` CircleSize) |
| boolean | [IsInRectangle](math.md#isinrectangle)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) pos, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) topLeft, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) topRight, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) bottomRight) |
| number | [Lerp](math.md#lerp)(`number` a, `number` b, `number` t) |
| number | [Round](math.md#round)(`number` n, `integer?` decimalPlaces =  0) |
| number | [ScalarProduct](math.md#scalarproduct)([`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v1, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) v2) |

## Functions

### Clamp()

`number Clamp(number a, number min, number max)`

Helper function to clamp a number into a range. 

### IsCircleIntersectingWithRectangle()

`boolean IsCircleIntersectingWithRectangle(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` RectPos, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` RectSize, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` CirclePos, number CircleSize)`

Returns whether a given rectangle is intersecting a given circle. 

### IsInRectangle()

`boolean IsInRectangle(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` pos, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` topLeft, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` topRight, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` bottomRight)`

Helper function to check if a point is inside a rectangle. 
Also works with rotated rectangles. 

### Lerp()

`number Lerp(number a, number b, number t)`

Helper function to lineally interpolate between two numbers. 

### Round()

`number Round(number n, integer? decimalPlaces =  0)`

Rounds a number to the closest number of decimal places given. 
Defaults to rounding to the nearest integer. 

### ScalarProduct()

`number ScalarProduct(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v1, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` v2)`

Helper function to get the scalar product of 2 vectors. 
The scalar product is defined as `v1.X * v2.X + v1.Y * v2.Y` 

