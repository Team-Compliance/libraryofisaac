# ShockWaves

## Overview

| Return Value | Function |
| - | - |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)? | [CreateShockwave](shockwaves.md#createshockwave)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) position, `CustomShockwaveParams` customShockwaveParams) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)? | [CreateShockwaveLine](shockwaves.md#createshockwaveline)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) direction, `CustomShockwaveParams` customShockwaveParams, `number?` spacing, `integer?` delay, `integer?` numShockwaves) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)? | [CreateShockwaveRandomLine](shockwaves.md#createshockwaverandomline)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) direction, `CustomShockwaveParams` customShockwaveParams, `integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`?` seedOrRNG =  `tsil.rng.getrandomseed()` , `integer?` randomOffset, `number?` spacing, `integer?` delay, `integer?` numShockwaves) |
| [Entity](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)\[] | [CreateShockwaveRing](shockwaves.md#createshockwavering)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) source, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, `number` radius, `CustomShockwaveParams` customShockwaveParams, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`?` direction, `number?` angleWidth, `number?` spacing, `integer?` numRings, `number?` ringSpacing, `integer?` ringDelay) |
| CustomShockwaveParams | [CustomShockwaveParams](shockwaves.md#customshockwaveparams)() |
| table? | [GetCustomShockwaveData](shockwaves.md#getcustomshockwavedata)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity) |
| boolean | [IsCustomShockwave](shockwaves.md#iscustomshockwave)([`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity) |

## Functions

### CreateShockwave()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? CreateShockwave(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` position, CustomShockwaveParams customShockwaveParams)`

Creates a new shockwave with the given params. 
Returns the spawned shockwave. If it can't spawn it, returns nil. 

### CreateShockwaveLine()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? CreateShockwaveLine(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` direction, CustomShockwaveParams customShockwaveParams, number? spacing, integer? delay, integer? numShockwaves)`

Creates a shockwave line with the given properties. 
Returns only the first shockwave spawned. 

### CreateShockwaveRandomLine()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`? CreateShockwaveRandomLine(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` direction, CustomShockwaveParams customShockwaveParams, integer | `[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)`? seedOrRNG =  `tsil.rng.getrandomseed()` , integer? randomOffset, number? spacing, integer? delay, integer? numShockwaves)`

Creates a shockwave line with the given properties. Each shockwave is spawned with a random offset. 
Returns only the first shockwave spawned. 

### CreateShockwaveRing()

[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)`[] CreateShockwaveRing(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` source, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, number radius, CustomShockwaveParams customShockwaveParams, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`? direction, number? angleWidth, number? spacing, integer? numRings, number? ringSpacing, integer? ringDelay)`

Creates a shockwave ring with the given properties. 
Returns the spawned shockwaves. If multiple rings are set to spawn, returns only the shockwaves spawned in the first ring. 

### CustomShockwaveParams()

`CustomShockwaveParams CustomShockwaveParams()`

@class CustomShockwaveParams @field Duration integer @field Size number @field Damage number @field SelfDamage boolean @field DamagePlayers boolean @field DestroyGrid boolean @field GoOverPits boolean @field Color Color @field SpriteSheet string @field Sound SoundEffect @field SoundMode ShockwaveSoundMode Creates a new `CustomShockwaveParams` object. 

### GetCustomShockwaveData()

`table? GetCustomShockwaveData(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity)`

Helper function to get a custom shockwave's data. 

### IsCustomShockwave()

`boolean IsCustomShockwave(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity)`

Helper function to check whether a given entity is a custom shockwave. 

