# Changelog

## 0.329

### Additions

* Added `TSIL.Pause.PausePlayer` and related functions.
    * `TSIL.Pause.PausePlayer(player: EntityPlayer)`: Completely stops the player, removing its controls and making it intangible. Keep in mind that this only lasts for the current room.
    * `TSIL.Pause.UnpausePlayer(player: EntityPlayer)`: Restores the player that was paused before.
    * `TSIL.Pause.IsPlayerPaused(player: EntityPlayer)`: Checks if a player has been paused.
    * `TSIL.Pause.PauseAllPlayers()`: Pauses all players.
    * `TSIL.Pause.UnpauseAllPlayers()`: Unpauses all players.

* Added per-player persistent variables to Save Manager.
    * `TSIL.SaveManager.AddPersistentPlayerVariable(mod: ModReference, variableName: string, defaultValue: any, persistenceMode: VariablePersistenceMode, differentiateSoulAndForgotten: boolean?, ignoreGlowingHourglass: boolean?, conditionalSave: fun(): boolean?)`: Adds a new per-player persistent variable to the Save Manager. 
    * `TSIL.SaveManager.GetPersistentPlayerVariable(mod: ModReference, variableName: string, player: EntityPlayer)`: Returns the current value of a per-player persistent variable for the given player.
    * `TSIL.SaveManager.SetPersistentPlayerVariable(mod: ModReference, variableName: string, player: EntityPlayer, newValue: any)`: Sets the current value of a per-player persitent variable for the given player.

* Added appropiate lua annotations to `TSIL.Utils.Math.Lerp` so it now also accepts `Vector` parameters.

### Changes

* Save Manager uses the Repentogon Glowing Hourglass callbacks to ensure mod persistent data works the same as vanilla data when using Glowing Hourglass.

### Fixes

* Save Manager now restores run persistent variables when using Glowing Hourglass.
* Pickup Index persists correctly on boss rooms during ascent.
* Save Manager keeps working even after using the `luamod` command. Previously it would still work, but it wouldn't be able to load/save the file when exiting/countinuing the run.
* Fixed an error that could happen with version persistent data when loading old versions of the library.

### Removed

* `CustomItemPool` module has been removed since Repentogon allows modders to add item pools using the `itempools.xml` file.
* For the same reason, `POST_GET_COLLECTIBLE_CUSTOM_ITEM_POOL` has been removed.

---

## 0.328

### Changes

* `TSIL.Sprites.GetLastFrameOfAnimation` now returns -1 if the animation doesn't exist.

### Fixes

* Internal callbacks update their version when overriden.
* Updated lua annotation types to match with Filloax's extension.
* Fixed `WillMysteriousPaperRevive` calling `player:GetDeathAnimationName()` instead of `player:GetDeathAnimName()`.
* Fixed `IsDamageToPlayerFatal` typo for Tainted Samson's player type enum.
* `TSIL.Sprites.GetLastFrameOfAnimation` now checks if the animation data is nil.