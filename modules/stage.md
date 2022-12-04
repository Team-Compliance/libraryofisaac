# Stage

## Overview

| Return Value                                                               | Function                                                                                                                                                    |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [StageType](https://wofsauge.github.io/IsaacDocs/rep/enums/StageType.html) | [CalculateStageType](stage.md#calculatestagetype)([`LevelStage`](https://wofsauge.github.io/IsaacDocs/rep/enums/LevelStage.html) stage)                     |
| [StageType](https://wofsauge.github.io/IsaacDocs/rep/enums/StageType.html) | [CalculateStageTypeRepentance](stage.md#calculatestagetyperepentance)([`LevelStage`](https://wofsauge.github.io/IsaacDocs/rep/enums/LevelStage.html) stage) |
| integer                                                                    | [GetEffectiveStage](stage.md#geteffectivestage)()                                                                                                           |
| boolean                                                                    | [OnAscent](stage.md#onascent)()                                                                                                                             |
| boolean                                                                    | [OnFirstFloor](stage.md#onfirstfloor)()                                                                                                                     |
| boolean                                                                    | [OnRepentanceStage](stage.md#onrepentancestage)()                                                                                                           |

## Functions

### CalculateStageType()

[`StageType`](https://wofsauge.github.io/IsaacDocs/rep/enums/StageType.html) `CalculateStageType(`[`LevelStage`](https://wofsauge.github.io/IsaacDocs/rep/enums/LevelStage.html) `stage)`

Helper function that calculates what the [`StageType`](https://wofsauge.github.io/IsaacDocs/rep/enums/StageType.html) should be for the provided [`LevelStage`](https://wofsauge.github.io/IsaacDocs/rep/enums/LevelStage.html) in the current run. This emulates what the game's internal code does.

### CalculateStageTypeRepentance()

[`StageType`](https://wofsauge.github.io/IsaacDocs/rep/enums/StageType.html) `CalculateStageTypeRepentance(`[`LevelStage`](https://wofsauge.github.io/IsaacDocs/rep/enums/LevelStage.html) `stage)`

Helper function that calculates what the Repentance [`StageType`](https://wofsauge.github.io/IsaacDocs/rep/enums/StageType.html) should be for the provided [`LevelStage`](https://wofsauge.github.io/IsaacDocs/rep/enums/LevelStage.html).  This emulates what the game's internal code does.

### GetEffectiveStage()

`integer GetEffectiveStage()`

Helper function to account for Repentance floors being offset by 1. For example, Downpour 2 is the third level of the run, but the game considers it to have a stage of 2. This function will consider Downpour 2 to have a stage of 3.

### OnAscent()

`boolean OnAscent()`

Helper function to check if the appropiate ascent flag is set.

### OnFirstFloor()

`boolean OnFirstFloor()`

Returns whether or not the player is on the first floor of the particular run.

This is tricky to determine because we have to handle the cases of Downpour/Dross 1 not being the first floor and The Ascent.

### OnRepentanceStage()

`boolean OnRepentanceStage()`

Helper function to check if the current stage type is equal to `StageType.STAGETYPE_REPENTANCE` or `StageType.STAGETYPE_REPENTANCE_B`
