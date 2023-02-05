# RNG

## Overview

| Return Value | Function |
| - | - |
| [RNG](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) | [CopyRNG](rng.md#copyrng)()[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) rng) |
| integer | [GetRandomSeed](rng.md#getrandomseed)()) |
| [RNG](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) | [NewRNG](rng.md#newrng)()`integer The seed to initialize it with. Default is `TSIL.RNG.GetRandomSeed seed) |
| void | [SetSeed](rng.md#setseed)()[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html) rng, `integer` seed) |

## Functions

### CopyRNG()

[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)` CopyRNG(`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)` rng)`

Copies an `RNG` object 

### GetRandomSeed()

`integer GetRandomSeed()`

Helper function to get a random `Seed` value to be used in spawning entities and so on. Use this instead of calling the `Random` function directly since that can return a value of 0 and crash the game. 

### NewRNG()

[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)` NewRNG(integer The seed to initialize it with. Default is `TSIL.RNG.GetRandomSeed` seed)`

Helper function to initialize an RNG object using Blade's recommended shift index. 

### SetSeed()

`void SetSeed(`[`RNG`](https://wofsauge.github.io/IsaacDocs/rep/RNG.html)` rng, integer seed)`

Helper function to set a seed to an RNG object using Blade's recommended shift index. 

