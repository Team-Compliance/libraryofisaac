# Math

## Overview

| Return Value | Function                                                                                                                                                                                                                                                                                                                             |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| number       | [Clamp](math.md#clamp)(`number` a, `number` min, `number` max)                                                                                                                                                                                                                                                                       |
| boolean      | [IsCircleIntersectingWithRectangle](math.md#iscircleintersectingwithrectangle)([`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)RectPos, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)RectSize, [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)CirclePos, `number` CircleSize) |
| number       | [Lerp](math.md#lerp)(`number` a, `number` b, `number` t)                                                                                                                                                                                                                                                                             |
| number       | [Round](math.md#round)(`number` n, `integer` decimalPlaces = 0)                                                                                                                                                                                                                                                                      |

## Functions

### Clamp()

`number Clamp(number a, number min, number max)`

Helper function to clamp a number into a range.

### IsCircleIntersectingWithRectangle()

`boolean IsCircleIntersectingWithRectangle(`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`RectPos,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`RectSize,` [`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`CirclePos, number CircleSize)`

Returns whether a given rectangle is intersecting a given circle. `RectPos` and `CirclePos` both refer to the center of the shapes.

### Lerp()

`number Lerp(number a, number b, number t)`

Helper function to lineally interpolate between two numbers.

### Round()

`number Round(number n, integer decimalPlaces = 0)`

Rounds a number to the closest number of decimal places given.

Defaults to rounding to the nearest integer.
