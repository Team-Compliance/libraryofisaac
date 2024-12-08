# Changelog

## 0.329

### Changes

* Save Manager uses the Repentogon Glowing Hourglass callbacks to ensure mod persistent data works the same as vanilla data when using Glowing Hourglass.

### Fixes

* Save Manager now restores run persistent variables when using Glowing Hourglass.
* Pickup Index persists correctly on boss rooms during ascent.
* Save Manager keeps working even after using the `luamod` command.

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