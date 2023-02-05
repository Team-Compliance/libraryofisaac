# Direction

## Overview

| Return Value | Function |
| - | - |
| [Direction](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html) | [AngleToDirection](direction.md#angletodirection)()`number` angleDegrees) |
| integer | [DirectionToDegrees](direction.md#directiontodegrees)()[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html) direction) |
| [Vector](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) | [DirectionToVector](direction.md#directiontovector)()[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html) direction) |

## Functions

### AngleToDirection()

[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html)` AngleToDirection(number angleDegrees)`

Helper function to convert a given amount of angle degrees into the corresponding `Direction` enum. 

### DirectionToDegrees()

`integer DirectionToDegrees(`[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html)` direction)`

Helper function to get the corresponding angle degrees from a `Direction` enum. 

### DirectionToVector()

[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` DirectionToVector(`[`Direction`](https://wofsauge.github.io/IsaacDocs/rep/enums/Direction.html)` direction)`

Helper function to get a Vector pointing in a given Direction. 

