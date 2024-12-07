# Changelog

## 0.329

### Fixes

* Save Manager now restores run persistent variables when using Glowing Hourglass.

## 0.328

### Changes

* `TSIL.Sprites.GetLastFrameOfAnimation` now returns -1 if the animation doesn't exist.

### Fixes

* Internal callbacks update their version when overriden.
* Updated lua annotation types to match with Filloax's extension.
* Fixed `WillMysteriousPaperRevive` calling `player:GetDeathAnimationName()` instead of `player:GetDeathAnimName()`.
* Fixed `IsDamageToPlayerFatal` typo for Tainted Samson's player type enum.
* `TSIL.Sprites.GetLastFrameOfAnimation` now checks if the animation data is nil.