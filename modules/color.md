# Color

## Overview

| Return Value                                                   | Function                                                                                                                                                                                 |
| -------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html)   | [CopyColor](color.md#copycolor)([`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) color)                                                                                    |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html)   | [GetRandomColor](color.md#getrandomcolor)(`integer\|`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) seedOrRNG = [GetRandomSeed()](rng.md#getrandomseed), `number` alpha = 1) |
| [Color](https://wofsauge.github.io/IsaacDocs/rep/Color.html)   | [HexToColor](color.md#hextocolor)(`string` hex, `number` alpha)                                                                                                                          |
| [KColor](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) | [HexToKColor](color.md#hextokcolor)(`string` hex, `number` alpha)                                                                                                                        |

## Functions

### CopyColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) `CopyColor(`[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) `color)`

Copies a color

### GetRandomColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) `GetRandomColor(integer|`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) `seedOrRNG =` [GetRandomSeed()](rng.md#getrandomseed)`, number alpha = 1)`

Gets a random color.

### HexToColor()

[`Color`](https://wofsauge.github.io/IsaacDocs/rep/Color.html) `HexToColor(string hex, number alpha)`

Converts a hex string like "#33aa33" to a Color object.

### HexToKColor()

[`KColor`](https://wofsauge.github.io/IsaacDocs/rep/KColor.html) `HexToKColor(string hex, number alpha)`

Converts a hex string like "#33aa33" to a KColor object.
