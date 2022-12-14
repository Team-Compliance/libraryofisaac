# Players

## Overview

| Return Value                                                                  | Function                                                                                                                                                                                                                                             |
| ----------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| void                                                                          | [AddSmeltedTrinket](players.md#addsmeltedtrinket)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player, [`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)trinketId)                   |
| boolean                                                                       | [DoesAnyPlayerHasItem](players.md#doesanyplayerhasitem)([`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)collectibleId, `boolean` ignoreModifiers = false)                                                   |
| boolean                                                                       | [DoesAnyPlayerHasTrinket](players.md#doesanyplayerhastrinket)([`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)trinketId, `boolean` ignoreModifiers = false)                                                         |
| string                                                                        | GetCharacterDeathAnimation([`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html) character)                                                                                                                                 |
| integer                                                                       | GetCharacterMaxHeartContainers([`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html) character                                                                                                                              |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetClosestPlayers](players.md#getclosestplayers)([`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)center, `integer` numberOfPlayers = 1)                                                                                            |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)?   | [GetPlayerByIndex](players.md#getplayerbyindex)(`integer` playerIndex)                                                                                                                                                                               |
| integer                                                                       | [GetPlayerIndex](players.md#getplayerindex)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player)                                                                                                                     |
| [InventoryObject](../classes/inventoryobject.md)\[]                           | [GetPlayerInventory](players.md#getplayerinventory)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player, [`InventoryType` ](../custom-enums/inventorytype.md)inventoryTypeFilter?)                                   |
| integer                                                                       | GetPlayerNumHitsRemaining([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player)                                                                                                                                       |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayers](players.md#getplayers)(`boolean` ignoreCoopBabies = true)                                                                                                                                                                               |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayersByCollectible](players.md#getplayersbycollectible)([`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)collectibleId)                                                                                |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayersByTrinket](players.md#getplayersbytrinket)([`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)trinketId)                                                                                                    |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | GetPlayersOfType(`PlayerType` playerType)                                                                                                                                                                                                            |
| integer                                                                       | [GetSmeltedTrinketMultiplier](players.md#getsmeltedtrinketmultiplier)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player, [`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)trinket) |
| boolean                                                                       | [IsActiveTaintedLazForm](players.md#isactivetaintedlazform)([`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)player)                                                                                                     |

## Functions

### AddSmeltedTrinket()

`void AddSmeltedTrinket(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player,` [`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`trinketId)`

Gives the player an smelted trinket without changing the player's current held trinkets.

### DoesAnyPlayerHasItem()

`boolean DoesAnyPlayerHasItem(`[`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`collectibleId, boolean ignoreModifiers = false)`

Returns true if at least one player has the given item.

### DoesAnyPlayerHasTrinket()

`boolean DoesAnyPlayerHasTrinket(`[`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`trinketId, boolean ignoreModifiers = false)`

Returns true if at least one player has the given trinket.

### GetClosestPlayers()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetClosestPlayers(`[`Vector` ](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)`center, integer numberOfPlayers = 1)`

Returns the n closest players to a certain point. The players are ordered by their distance.

### GetPlayerByIndex()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`? GetPlayerByIndex(integer playerIndex)`

Returns a player given its index.

### GetPlayerIndex()

`integer GetPlayerIndex(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player)`

Returns a given player's index. Useful for storing unique data per player.

### GetPlayerInventory()

[`InventoryObject`](../classes/inventoryobject.md)`[] GetPlayerInventory(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player,` [`InventoryType` ](../custom-enums/inventorytype.md)`inventoryTypeFilter?)`

Returns a list of all the items/gulped trinkets (things that appear on the extra HUD) ordered by the time they were collected.

{% hint style="warning" %}
This method is not perfect and will fail if the player rerolls all of their items or if a mod gives several items in the same frame.
{% endhint %}

### GetPlayers()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayers(boolean ignoreCoopBabies = true)`

Returns a list of all players.

### GetPlayersByCollectible()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayersByCollectible(`[`CollectibleType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)`collectibleId)`

Returns a list of all players that have a certain item.

### GetPlayersByTrinket()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayersByTrinket(`[`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`trinketId)`

Returns all the players that have a certain trinket

### GetSmeltedTrinketMultiplier()

`integer GetSmeltedTrinketMultiplier(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player,` [`TrinketType` ](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)`trinket)`

Returns the number of trinkets a player has smelted. Won't count the trinkets they're currently holding.

### IsActiveTaintedLazForm()

`boolean IsActiveTaintedLazForm(`[`EntityPlayer` ](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`player)`

Returns wether the given form of tainted lazarus is the active one. If the given player is not tainted lazarus, it'll always return false.

Accounts for when the player has Birthright.
