# GridSpecific

## Overview

| Return Value                                                                                        | Function                                                                                                                                                                                                                                                              |
| --------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)\[]                           | [GetCrawlSpaces](gridspecific.md#getcrawlspaces)([`CrawlSpaceVariant` ](../custom-enums/crawlspacevariant.md)crawlSpaceVariant = -1)                                                                                                                                  |
| [GridEntityPit](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPit.html)\[]                     | [GetPits](gridspecific.md#getpits)([`PitVariant` ](../custom-enums/pitvariant.md)pitVariant = -1)                                                                                                                                                                     |
| [GridEntityPoop](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPoop.html)\[]                   | [GetPoops](gridspecific.md#getpoops)([`PoopGridEntityVariant` ](../custom-enums/poopgridentityvariant.md)poopVariant = -1)                                                                                                                                            |
| [GridEntityPressurePlate](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPressurePlate.html)\[] | [GetPressurePlates](gridspecific.md#getpressureplates)([`PressurePlateVariant` ](../custom-enums/pressureplatevariant.md)pressurePlateVariant = -1)                                                                                                                   |
| [GridEntityRock](https://wofsauge.github.io/IsaacDocs/rep/GridEntityRock.html)\[]                   | [GetRocks](gridspecific.md#getrocks)([`RockVariant` ](../custom-enums/rockvariant.md)rockVariant = -1)                                                                                                                                                                |
| [GridEntitySpikes](https://wofsauge.github.io/IsaacDocs/rep/GridEntitySpikes.html)\[]               | [GetSpikes](gridspecific.md#getspikes)(`integer` spikesVariant = -1)                                                                                                                                                                                                  |
| [GridEntityTNT](https://wofsauge.github.io/IsaacDocs/rep/GridEntityTNT.html)\[]                     | [GetTNTs](gridspecific.md#gettnts)(`integer` TNTVariant = -1)                                                                                                                                                                                                         |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)\[]                           | [GetTeleporters](gridspecific.md#getteleporters)(`integer` teleporterVariant = -1)                                                                                                                                                                                    |
| [GridEntity](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)\[]                           | [GetTrapdoors](gridspecific.md#gettrapdoors)([`TrapdoorVariant` ](../custom-enums/trapdoorvariant.md)trapdoorVariant = -1)                                                                                                                                            |
| [GridEntityDoor](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)?                     | [SpawnDoor](gridspecific.md#spawndoor)([`DoorVariant` ](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorVariant.html)doorVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true)             |
| [GridEntityPit](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPit.html)?                       | [SpawnPit](gridspecific.md#spawnpit)([`PitVariant` ](../custom-enums/pitvariant.md)pitVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true)                                                   |
| [GridEntityPoop](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPoop.html)?                     | [SpawnPoop](gridspecific.md#spawnpoop)([`PoopGridEntityVariant` ](../custom-enums/poopgridentityvariant.md)poopVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true)                          |
| [GridEntityPressurePlate](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPressurePlate.html)?   | [SpawnPressurePlate](gridspecific.md#spawnpressureplate)([`PressurePlateVariant` ](../custom-enums/pressureplatevariant.md)pressurePlateVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true) |
| [GridEntityRock](https://wofsauge.github.io/IsaacDocs/rep/GridEntityRock.html)?                     | [SpawnRock](gridspecific.md#spawnrock)([`RockVariant` ](../custom-enums/rockvariant.md)rockVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true)                                              |
| [GridEntitySpikes](https://wofsauge.github.io/IsaacDocs/rep/GridEntitySpikes.html)?                 | [SpawnSpikes](gridspecific.md#spawnspikes)(`integer` spikeVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true)                                                                               |
| [GridEntityTNT](https://wofsauge.github.io/IsaacDocs/rep/GridEntityTNT.html)?                       | [SpawnTNT](gridspecific.md#spawntnt)(`integer` TNTVariant, `integer\|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)indexOrPosition, `boolean` force = true)                                                                                       |

## Functions

### GetCrawlSpaces()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[] GetCrawlSpaces(`[`CrawlSpaceVariant` ](../custom-enums/crawlspacevariant.md)`crawlSpaceVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_STAIRS` and the given variant.

### GetPits()

[`GridEntityPit`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPit.html)`[] GetPits(`[`PitVariant` ](../custom-enums/pitvariant.md)`pitVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_PIT` and the given variant.

### GetPoops()

[`GridEntityPoop`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPoop.html)`[] GetPoops(`[`PoopGridEntityVariant` ](../custom-enums/poopgridentityvariant.md)`poopVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_POOP` and the given variant.

### GetPressurePlates()

[`GridEntityPressurePlate`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPressurePlate.html)`[] GetPressurePlates(`[`PressurePlateVariant` ](../custom-enums/pressureplatevariant.md)`pressurePlateVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_PRESSURE_PLATE` and the given variant.

### GetRocks()

[`GridEntityRock`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityRock.html)`[] GetRocks(`[`RockVariant` ](../custom-enums/rockvariant.md)`rockVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_ROCK` and the given variant.

### GetSpikes()

[`GridEntitySpikes`](https://wofsauge.github.io/IsaacDocs/rep/GridEntitySpikes.html)`[] GetSpikes(integer spikesVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_SPIKES` and the given variant.

### GetTNTs()

[`GridEntityTNT`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityTNT.html)`[] GetTNTs(integer TNTVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_TNT` and the given variant.

### GetTeleporters()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[] GetTeleporters(integer teleporterVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_TELEPORTER` and the given variant.

### GetTrapdoors()

[`GridEntity`](https://wofsauge.github.io/IsaacDocs/rep/GridEntity.html)`[] GetTrapdoors(`[`TrapdoorVariant` ](../custom-enums/trapdoorvariant.md)`trapdoorVariant = -1)`

Helper function to get all grid entities with type `GridEntityType.GRID_TRAPDOOR` and the given variant.

### SpawnDoor()

[`GridEntityDoor`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityDoor.html)`? SpawnDoor(`[`DoorVariant` ](https://wofsauge.github.io/IsaacDocs/rep/enums/DoorVariant.html)`doorVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn a door.

### SpawnPit()

[`GridEntityPit`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPit.html)`? SpawnPit(`[`PitVariant` ](../custom-enums/pitvariant.md)`pitVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn a pit.

### SpawnPoop()

[`GridEntityPoop`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPoop.html)`? SpawnPoop(`[`PoopGridEntityVariant` ](../custom-enums/poopgridentityvariant.md)`poopVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn a poop.

### SpawnPressurePlate()

[`GridEntityPressurePlate`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityPressurePlate.html)`? SpawnPressurePlate(`[`PressurePlateVariant` ](../custom-enums/pressureplatevariant.md)`pressurePlateVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn a pressure plate.

### SpawnRock()

[`GridEntityRock`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityRock.html)`? SpawnRock(`[`RockVariant` ](../custom-enums/rockvariant.md)`rockVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn a rock.

### SpawnSpikes()

[`GridEntitySpikes`](https://wofsauge.github.io/IsaacDocs/rep/GridEntitySpikes.html)`? SpawnSpikes(integer spikeVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn a spike.

### SpawnTNT()

[`GridEntityTNT`](https://wofsauge.github.io/IsaacDocs/rep/GridEntityTNT.html)`? SpawnTNT(integer TNTVariant, integer|`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`indexOrPosition, boolean force = true)`

Helper function to spawn TNT.
