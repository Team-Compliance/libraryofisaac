# Charge

## Overview

| Return Value | Function                                                                                                                                                                                                                                                                                                |
| ------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| integer      | [AddCharge](charge.md#addcharge)([`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) activeSlot = ActiveSlot.SLOT\_PRIMARY, `integer` numCharges = 1, `boolean` playSoundEffect = true) |
| integer      | [GetChargesAwayFromMax](charge.md#getchargesawayfrommax)([`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) activeSlot = ActiveSlot.SLOT\_PRIMARY)                                     |
| integer      | [GetTotalCharge](charge.md#gettotalcharge)([`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) activeSlot = ActiveSlot.SLOT\_PRIMARY)                                                   |
| boolean      | [IsActiveSlotDoubleCharged](charge.md#isactiveslotdoublecharged)([`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) activeSlot = ActiveSlot.SLOT\_PRIMARY)                             |

## Functions

### AddCharge()

`integer AddCharge(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) `player,` [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) `activeSlot =` ActiveSlot.SLOT\_PRIMARY`, integer numCharges = 1, boolean playSoundEffect = true)`

Helper function to add a charge to the player's active item. Will flash the HUD and play the appropriate sound effect, depending on whether the charge is partially full or completely full.

If the player's active item is already fully charged, then this function will return 0 and not flash the HUD.

This function will take the following things into account:

* The Battery
* AAA Battery

### GetChargesAwayFromMax()

`integer GetChargesAwayFromMax(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) `player,` [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) `activeSlot =` ActiveSlot.SLOT\_PRIMARY`)`

Helper function to get the amount of charges away from the maximum charge that a particular player is.

This function accounts for The Battery. For example, if the player has 2/6 charges on a D6, this function will return 10 (because there are 4 charges remaining on the base charge and 6 charges remaining on The Battery charge).

### GetTotalCharge()

`integer GetTotalCharge(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) `player,` [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) `activeSlot =` ActiveSlot.SLOT\_PRIMARY`)`

Helper function to get the combined normal charge and the battery charge for the player's active item. This is useful because you have to add these two values together when setting the active charge.

### IsActiveSlotDoubleCharged()

`boolean IsActiveSlotDoubleCharged(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) `player,` [`ActiveSlot`](https://wofsauge.github.io/IsaacDocs/rep/enums/ActiveSlot.html) `activeSlot =` ActiveSlot.SLOT\_PRIMARY`)`

Helper function to check if a player's active item is "double charged", meaning that it has both a full normal charge and a full charge from The Battery.
