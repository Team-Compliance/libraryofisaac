# Shockwaves

## Overview

| Return Value | Function |
|--------------|----------|
| [CustomShockwaveParams](../classes/customshockwaveparams.md) | [CustomShockwaveParams](shockwaves.md#customshockwaveparams)() |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)? | [CreateShockwave](shockwaves.md#createshockwave)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) position, [`CustomShockwaveParams`](../classes/customshockwaveparams.md) customShockwaveParams) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)? | [CreateShockwaveLine](shockwaves.md#createshockwaveline)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) direction, [`CustomShockwaveParams`](../classes/customshockwaveparams.md) customShockwaveParams, `number` spacing = 35 * customShockwaveParams.Size, `integer` delay = 1, `integer` numShockwaves = -1) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)? | [CreateShockwaveRandomLine](shockwaves.md#createshockwaverandomline)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) direction, [`CustomShockwaveParams`](../classes/customshockwaveparams.md) customShockwaveParams, `integer\|`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG, `integer` randomOffset = 60, `number` spacing = 35 * customShockwaveParams.Size, `integer` delay, `integer` numShockwaves = -1) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)[] | [CreateShockwaveRing](shockwaves.md#createshockwavering)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, `radius` number, [`CustomShockwaveParams`](../classes/customshockwaveparams.md) customShockwaveParams, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) direction = Vector(0, -1), `number` angleWidth = 360, `number` spacing = 35 * customShockwaveParams.Size, `integer` numRings = 1, `number` ringSpacing = 35 * customShockwaveParams.Size, `integer` ringDelay = 5) |
| table? | [GetCustomShockwaveData](shockwaves.md#getcustomshockwavedata)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity) |
| boolean | [IsCustomShockwave](shockwaves.md#iscustomshockwave)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity) |

## Functions

### CustomShockwaveParams()

[`CustomShockwaveParams`](../classes/customshockwaveparams.md)` CustomShockwaveParams()`

Creates a new [`CustomShockwaveParams`](../classes/customshockwaveparams.md) object.

### CreateShockwave()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)?` CreateShockwave(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` position, `[`CustomShockwaveParams`](../classes/customshockwaveparams.md)` customShockwaveParams)`

Creates a new shockwave with the given params.

Returns the spawned shockwave, if it can't spawn it, returns nil.

### CreateShockwaveLine()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? CreateShockwaveLine(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` direction, `[`CustomShockwaveParams`](../classes/customshockwaveparams.md)` customShockwaveParams, number spacing = 35 * customShockwaveParams.Size, integer delay = 1, integer numShockwaves = -1)`

Creates a shockwave line with the given properties.

Returns only the first shockwave spawned.

### CreateShockwaveRandomLine()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? CreateShockwaveRandomLine(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` direction, `[`CustomShockwaveParams`](../classes/customshockwaveparams.md)` customShockwaveParams, integer|`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG, integer randomOffset = 60, number spacing = 35 * customShockwaveParams.Size, integer delay, integer numShockwaves = -1)`

Creates a shockwave line with the given properties. Each shockwave is spawned with a random offset.

Returns only the first shockwave spawned.

### CreateShockwaveRing()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] CreateShockwaveRing(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, radius number, `[`CustomShockwaveParams`](../classes/customshockwaveparams.md)` customShockwaveParams, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` direction = Vector(0, -1), number angleWidth = 360, number spacing = 35 * customShockwaveParams.Size, integer numRings = 1, number ringSpacing = 35 * customShockwaveParams.Size, integer ringDelay = 5)`

Creates a shockwave ring with the given properties.

Returns the spawned shockwaves. If multiple rings are set to spawn, returns only the shockwaves spawned in the first ring.

### GetCustomShockwaveData()

`table? GetCustomShockwaveData(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity)`

Helper function to check whether a given entity is a custom shockwave.

### IsCustomShockwave()

`boolean | IsCustomShockwave(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity)`

Helper function to get a custom shockwave's data.
