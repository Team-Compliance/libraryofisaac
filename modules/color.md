# Color

## Overview

| Return Value | Function |
| - | - |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html) | [CopyColor](color.md#copycolor)([`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) color) |
| [KColor](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) | [CopyKColor](color.md#copykcolor)([`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) kColor) |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html) | [GetRandomColor](color.md#getrandomcolor)(`integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG? =  `tsil.rng.getrandomseed()` , `number?` alpha =  1 ) |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html) | [HexToColor](color.md#hextocolor)(`string` hex, `number` alpha) |
| [KColor](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) | [HexToKColor](color.md#hextokcolor)(`string` hex, `number` alpha) |

## Functions

### CopyColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html)` CopyColor(`[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html)` color)`

Copies a color. 

### CopyKColor()

[`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html)` CopyKColor(`[`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html)` kColor)`

Helper function to copy a `KColor` Isaac API class. 

### GetRandomColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html)` GetRandomColor(integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG? =  `tsil.rng.getrandomseed()` , number? alpha =  1 )`

Helper function to get a random color. 
Only randomizes the R, G and B fields. 

### HexToColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html)` HexToColor(string hex, number alpha)`

Converts a hex string like "#33aa33" to a Color object. 

### HexToKColor()

[`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html)` HexToKColor(string hex, number alpha)`

Converts a hex string like "#33aa33" to a KColor object. 

