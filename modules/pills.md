# Pills

## Overview

| Return Value | Function |
| - | - |
| [PillEffect](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html) | [GetFalsePHDPillEffect](pills.md#getfalsephdpilleffect)()[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html) pillEffect) |
| [PillColor](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html) | [GetHorsePillCollor](pills.md#gethorsepillcollor)()[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html) pillColor) |
| [PillColor](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html) | [GetNormalPillColorFromHorsePill](pills.md#getnormalpillcolorfromhorsepill)()[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html) pillColor) |
| [PillEffect](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html) | [GetPHDPillEffect](pills.md#getphdpilleffect)()[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html) pillEffect) |
| string | [GetPillEffectName](pills.md#getpilleffectname)()[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html) pillEffect) |
| [PillEffectType](../custom-enums/pilleffecttype.md) | [GetPillEffectType](pills.md#getpilleffecttype)()[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html) pillEffect) |
| boolean | [IsHorsePill](pills.md#ishorsepill)()[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html) pillColor) |

## Functions

### GetFalsePHDPillEffect()

[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html)` GetFalsePHDPillEffect(`[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html)` pillEffect)`

Helper function to get the corresponding pill effect a pill effect would be converted into after picking up False PHD. 
If the pill wouldn't transform, it returns the same pill effect. 

### GetHorsePillCollor()

[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)` GetHorsePillCollor(`[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)` pillColor)`

Helper function to get the corresponding horse pill color from a normal pill color 

### GetNormalPillColorFromHorsePill()

[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)` GetNormalPillColorFromHorsePill(`[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)` pillColor)`

Helper function to get the corresponding normal pill color from a horse pill color 

### GetPHDPillEffect()

[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html)` GetPHDPillEffect(`[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html)` pillEffect)`

Helper function to get the corresponding pill effect a pill effect would be converted into after picking up PHD. 
If the pill wouldn't transform, it returns the same pill effect. 

### GetPillEffectName()

`string GetPillEffectName(`[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html)` pillEffect)`

Helper function to get the name of a given pill effect. For modded pill effects it returns the name set in the xml. 

### GetPillEffectType()

[`PillEffectType`](../custom-enums/pilleffecttype.md)` GetPillEffectType(`[`PillEffect`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillEffect.html)` pillEffect)`

Helper function to get the `PillEffectType` of a given pill effect. 
Due to API limitations, it'll returns `PillEffectType.MODDED` for modded pills. 

### IsHorsePill()

`boolean IsHorsePill(`[`PillColor`](https://wofsauge.github.io/IsaacDocs/rep/enums/PillColor.html)` pillColor)`

Helper function to check if a pill color corresponds to a horse pill. 

