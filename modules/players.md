# Players

## Overview

| Return Value | Function |
| - | - |
| void | [AddSmeltedTrinket](players.md#addsmeltedtrinket)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) trinketId) |
| boolean | [DoesAnyPlayerHasItem](players.md#doesanyplayerhasitem)()[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleId, `boolean?` ignoreModifiers =  false) |
| boolean | [DoesAnyPlayerHasTrinket](players.md#doesanyplayerhastrinket)()[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) trinketId, `boolean?` ignoreModifiers =  false) |
| integer | [GetBlackHeartsNum](players.md#getblackheartsnum)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| string | [GetCharacterDeathAnimationName](players.md#getcharacterdeathanimationname)()[`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html) character) |
| integer | [GetCharacterMaxHeartContainers](players.md#getcharactermaxheartcontainers)()[`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html) character) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetClosestPlayers](players.md#getclosestplayers)()[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) center, `integer?` numberOfPlayers?) |
| integer | [GetHearts](players.md#gethearts)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)? | [GetPlayerByIndex](players.md#getplayerbyindex)()`PlayerIndex` playerIndex) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)? | [GetPlayerFromEntity](players.md#getplayerfromentity)()[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html) entity) |
| void | [GetPlayerHealthType](players.md#getplayerhealthtype)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`HealthType`](../custom-enums/healthtype.md) healthType) |
| PlayerIndex | [GetPlayerIndex](players.md#getplayerindex)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, `boolean?` differentiateSoulAndForgotten?) |
| InventoryObject\[] | [GetPlayerInventory](players.md#getplayerinventory)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`InventoryType`](../custom-enums/inventorytype.md)`?` inventoryTypeFilter?) |
| void | [GetPlayerMaxHeartContainers](players.md#getplayermaxheartcontainers)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| integer | [GetPlayerNumHitsRemaining](players.md#getplayernumhitsremaining)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayers](players.md#getplayers)()`boolean?` ignoreCoopBabies? =  true) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayersByCollectible](players.md#getplayersbycollectible)()[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html) collectibleId) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayersByTrinket](players.md#getplayersbytrinket)()[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) trinketId) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayersOfType](players.md#getplayersoftype)()[`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html) playerType) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)\[] | [GetPlayersWithControllerIndex](players.md#getplayerswithcontrollerindex)()`integer` controllerIndex) |
| integer | [GetSmeltedTrinketMultiplier](players.md#getsmeltedtrinketmultiplier)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) trinket) |
| integer | [GetSoulHearts](players.md#getsoulhearts)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| [EntityPlayer](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)? | [GetSubPlayerParent](players.md#getsubplayerparent)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) subPlayer) |
| void | [GiveTrinketsBack](players.md#givetrinketsback)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, `TrinketSituation?` trinketSituation) |
| boolean | [IsActiveTaintedLazForm](players.md#isactivetaintedlazform)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| void | [IsChildPlayer](players.md#ischildplayer)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| boolean | [IsDamageToPlayerFatal](players.md#isdamagetoplayerfatal)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, `number` amount, [`EntityRef`](https://wofsauge.github.io/IsaacDocs/rep/EntityRef.html) source, `integer?` lastDamageGameFrame) |
| boolean | [IsKeeper](players.md#iskeeper)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| boolean | [IsTaintedLazarus](players.md#istaintedlazarus)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| TrinketSituation? | [TemporarilyRemoveTrinket](players.md#temporarilyremovetrinket)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player, [`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html) trinketType) |
| TrinketSituation? | [TemporarilyRemoveTrinkets](players.md#temporarilyremovetrinkets)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| boolean | [WillMysteriousPaperRevive](players.md#willmysteriouspaperrevive)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| boolean | [WillPlayerRevive](players.md#willplayerrevive)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| boolean | [WillReviveFromHeartbreak](players.md#willrevivefromheartbreak)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |
| boolean | [WillReviveFromSpiritShackles](players.md#willrevivefromspiritshackles)()[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html) player) |

## Functions

### AddSmeltedTrinket()

`void AddSmeltedTrinket(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, `[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)` trinketId)`

Gives the player an smelted trinket without changing the player's current held trinkets. 

### DoesAnyPlayerHasItem()

`boolean DoesAnyPlayerHasItem(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleId, boolean? ignoreModifiers =  false)`

Returns true if at least one player has the given item. 

### DoesAnyPlayerHasTrinket()

`boolean DoesAnyPlayerHasTrinket(`[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)` trinketId, boolean? ignoreModifiers =  false)`

Returns true if at least one player has the given trinket. 

### GetBlackHeartsNum()

`integer GetBlackHeartsNum(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Returns the number of black hearts that the player has, excluding any soul hearts. For example, if the player has one full black heart, one full soul heart, and one half black heart, this function returns 3. 
This is different from the `EntityPlayer.GetBlackHearts` method, since that returns a bitmask. 

### GetCharacterDeathAnimationName()

`string GetCharacterDeathAnimationName(`[`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html)` character)`

Helper function to determine which death animation a character will play - Most characters have a 56 frame death animation (i.e. the "Death" animation). - The Lost and Tainted Lost have a 38 frame death animation (i.e. the "LostDeath" animation). - Tainted Forgotten has a 20 frame death animation (i.e. the "ForgottenDeath" animation). 

### GetCharacterMaxHeartContainers()

`integer GetCharacterMaxHeartContainers(`[`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html)` character)`

Returns the maximum heart containers that the provided character can have. Normally, this is 12, but with Keeper it is 3, and with Tainted Keeper it is 2. This does not account for Birthright or Mother's Kiss; use the `GetPlayerMaxHeartContainers` helper function for that. 

### GetClosestPlayers()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetClosestPlayers(`[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` center, integer? numberOfPlayers?)`

Returns the n closest players to a certain point. The players are ordered by their distance. 

### GetHearts()

`integer GetHearts(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Returns the number of red hearts that the player has, excluding any rotten hearts. For example, if the player has one full black heart, one full soul heart, and one half black heart, this function returns 3. 
This is different from the `EntityPlayer.GetHearts` method, since that returns a value that includes rotten hearts. 

### GetPlayerByIndex()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`? GetPlayerByIndex(PlayerIndex playerIndex)`

Returns a player given its index. 

### GetPlayerFromEntity()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`? GetPlayerFromEntity(`[`Entity`](https://wofsauge.github.io/IsaacDocs/rep/Entity.html)` entity)`

Helper function to get the player from a tear, laser, bomb, etc. Returns nil if the entity does not correspond to any particular player. 
This function works by looking at the `Parent` and the `SpawnerEntity` fields (in that order). As a last resort, it will attempt to use the `Entity.ToPlayer` method on the entity itself. 

### GetPlayerHealthType()

`void GetPlayerHealthType(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, `[`HealthType`](../custom-enums/healthtype.md)` healthType)`

Helper function to get the amount of a given health type a player has. 

### GetPlayerIndex()

`PlayerIndex GetPlayerIndex(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, boolean? differentiateSoulAndForgotten?)`

Returns a given player's index. Useful for storing unique data per player. 

### GetPlayerInventory()

`InventoryObject[] GetPlayerInventory(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, `[`InventoryType`](../custom-enums/inventorytype.md)`? inventoryTypeFilter?)`

Returns a list of all the items/gulped trinkets (things that appear on the extra HUD) ordered by the time they were collected. This method is not perfect and will fail if the player rerolls all of their items or a mod gives several items in the same frame. 

### GetPlayerMaxHeartContainers()

`void GetPlayerMaxHeartContainers(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to get the max amount of heart containers a player can have. 

### GetPlayerNumHitsRemaining()

`integer GetPlayerNumHitsRemaining(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Returns the combined value of all of the player's red hearts, soul/black hearts, and bone hearts, minus the value of the player's rotten hearts. 
This is equivalent to the number of hits that the player can currently take, but does not take into account double damage from champion enemies and/or being on later floors. (For example, on Womb 1, players who have 1 soul heart remaining would die in 1 hit to anything, even though this function would report that they have 2 hits remaining.) 

### GetPlayers()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayers(boolean? ignoreCoopBabies? =  true)`

Returns a list of all players. 

### GetPlayersByCollectible()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayersByCollectible(`[`CollectibleType`](https://wofsauge.github.io/IsaacDocs/rep/enums/CollectibleType.html)` collectibleId)`

Returns a list of all players that have a certain item 

### GetPlayersByTrinket()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayersByTrinket(`[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)` trinketId)`

Returns all the players that have a certain trinket 

### GetPlayersOfType()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayersOfType(`[`PlayerType`](https://wofsauge.github.io/IsaacDocs/rep/enums/PlayerType.html)` playerType)`

Returns all the players of a given type. 

### GetPlayersWithControllerIndex()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`[] GetPlayersWithControllerIndex(integer controllerIndex)`

Returns all the players corresponding to a controller index. 

### GetSmeltedTrinketMultiplier()

`integer GetSmeltedTrinketMultiplier(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, `[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)` trinket)`

Returns the number of trinkets a player has smelted. Won't count the trinkets they're currently holding. 

### GetSoulHearts()

`integer GetSoulHearts(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Returns the number of soul hearts that the player has, excluding any black hearts. For example, if the player has one full black heart, one full soul heart, and one half black heart, this function returns 2. 
This is different from the `EntityPlayer.GetSoulHearts` method, since that returns the combined number of soul hearts and black hearts. 

### GetSubPlayerParent()

[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)`? GetSubPlayerParent(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` subPlayer)`

Helper function to get the parent of a given sub player. 

### GiveTrinketsBack()

`void GiveTrinketsBack(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, TrinketSituation? trinketSituation)`

Helper function to restore the player's trinkets back to the way they were before the `temporarilyRemoveTrinket` function was used. It will re-smelt any smelted trinkets that were removed. 

### IsActiveTaintedLazForm()

`boolean IsActiveTaintedLazForm(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Returns wether the given form of tainted lazarus is the active one. If the given player is not tainted lazarus, it'll always return false. 
Accounts for when the player has Birthright. 

### IsChildPlayer()

`void IsChildPlayer(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to detect if a player is a "child player", meaning they have a defined `Parent` field (i.e. Strawman players) 

### IsDamageToPlayerFatal()

`boolean IsDamageToPlayerFatal(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, number amount, `[`EntityRef`](https://wofsauge.github.io/IsaacDocs/rep/EntityRef.html)` source, integer? lastDamageGameFrame)`

Uses the player's current health and other miscellaneous things to determine if incoming damage will be fatal. 

### IsKeeper()

`boolean IsKeeper(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to check if a player is either Keeper of T.Keeper. 

### IsTaintedLazarus()

`boolean IsTaintedLazarus(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to check if a player is any form of tainted lazarus. 

### TemporarilyRemoveTrinket()

`TrinketSituation? TemporarilyRemoveTrinket(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player, `[`TrinketType`](https://wofsauge.github.io/IsaacDocs/rep/enums/TrinketType.html)` trinketType)`

Helper function to temporarily remove a specific kind of trinket from the player. Use this in combination with the `giveTrinketsBack` function to take away and give back a trinket on the same frame. This function correctly handles multiple trinket slots and ensures that all copies of the trinket are removed, including smelted trinkets. 
Note that one smelted golden trinket is the same as two smelted normal trinkets. 

### TemporarilyRemoveTrinkets()

`TrinketSituation? TemporarilyRemoveTrinkets(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to temporarily removes a player's held trinkets, if any. This will not remove any smelted trinkets. Use this in combination with the `giveTrinketsBack` function to take away and give back trinkets on the same frame. 

### WillMysteriousPaperRevive()

`boolean WillMysteriousPaperRevive(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Assuming that we are on the frame of fatal damage, this function returns whether or not Mysterious Paper would rotate to Missing Poster on the frame that the "Game Over" screen would appear (which would subsequently save the player from fatal damage). 
Mysterious Paper rotates between the 4 items on every frame, in order. The formula for whether Mysterious Paper be Missing Power is: `gameFrameCount % 4 === 3` 

### WillPlayerRevive()

`boolean WillPlayerRevive(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

The `EntityPlayer.WillPlayerRevive` method does not properly account for Mysterious Paper, so use this helper function instead for more robust revival detection. 

### WillReviveFromHeartbreak()

`boolean WillReviveFromHeartbreak(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to determine if the player will be revived by the Heartbreak collectible if they take fatal damage. This is contingent on the character that they are playing as and the amount of broken hearts that they already have. 

### WillReviveFromSpiritShackles()

`boolean WillReviveFromSpiritShackles(`[`EntityPlayer`](https://wofsauge.github.io/IsaacDocs/rep/EntityPlayer.html)` player)`

Helper function to determine if the Spirit Shackles item is in an enabled state. (It can be either enabled or disabled.) 

