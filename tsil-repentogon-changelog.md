# Library Of Isaac Repentogon Changelog

## Additions
- Copying and serializing colors now supports all the colorize attributes.
- Added `POST_SLOT_STATE_CHANGED`.
- Added more grid entity specific functions for the new grid entity types.
- Added `TSIL.IsaacAPIClass.IsColorModifier` and `TSIL.IsaacAPIClass.IsSlot`.

## Enums
The following enums have been renamed to not conflict with ones added in Repentogon:
- `HealthType` -> `PlayerHeartType`.

The following enums have been added in Repentogon:
- `BossID` -> `BossType`.
- `DebugMode` -> `DebugFlag`.
- `Dimension` -> `Dimension`.
- `PoopGridEntityVariant` -> `GridPoopVariant`.
- `PressurePlateVariant` -> `PressurePlateVariant`.
- `LineCheckMode` -> `LineCheckMode`.
- `ProjectilesMode` -> `ProjectileMode`.
- `SlotVariant` -> `SlotVariant`.
- `KnifeVariant` -> `KnifeVariant`.

## Removed
- `TSIL.Charge.GetMaxCharge()` can be replaced by `player:GetActiveMaxCharge()` in some cases. You can now use `TSIL.Charge.GetEffectiveMaxCharge()` if you still want to account for The Battery.
- `TSIL.Charge.GetTotalCharge()` has been replaced by `player:GetTotalActiveCharge()`.
- All grid specific callbacks are now properly implemented.
- `POST_PLAYER_COLLECTIBLE_REMOVED` has been replaced by `MC_POST_TRIGGER_COLLECTIBLE_REMOVED`.
- `POST_PLAYER_COLLECTIBLE_ADDED` has been replaced by `MC_POST_ADD_COLLECTIBLE`.
- `POST_PURCHASE` has been replaced by `MC_POST_PICKUP_SHOP_PURCHASE`.
- `POST_SLOT_UPDATE`, `POST_SLOT_RENDER`, `POST_SLOT_INIT` and `PRE_SLOT_COLLISION` have all been properly implemented.
- `TSIL.Dimensions.GetDimension()` has been replaced by `Level:GetDimension()`.
- Mentions of grid entity crawlspaces have been renamed to stairs to match the new `GridEntityStairs`.
- `TSIL.Pills.GetPillEffectName()` is not neccessary now due to Repentogon exposing localization functions.
- `TSIL.Players.DoesAnyPlayerHasItem()` has been replaced by `PlayerManager.AnyoneHasCollectible(Collectible)`.
- `TSIL.Players.DoesAnyPlayerHasTrinket()` has been replaced by `PlayerManager.AnyoneHasTrinket(Trinket)`.
- `TSIL.Players.GetPlayerInventory()` has been replaced by `EntityPlayer:GetHistory()`.
- `TSIL.Players.AddSmeltedTrinket()` has been replaced by `EntityPlayer:AddSmeltedTrinket(Trinket, FirstTimePickingUp)`.
- `TSIL.Players.GetCharacterDeathAnimationName()` has been replaced by `EntityPlayer:GetDeathAnimName()`.
- `TSIL.Players.GetPlayers()` has been replaced by `PlayerManager.GetPlayers()`.
- `TSIL.Players.RegisterCharacterHealthConversion()` has been replaced by `MC_PLAYER_GET_HEALTH_TYPE`.
- `TSIL.Run.CanRunUnlockAchievements` has been replaced by `Game:AchievementUnlocksDisallowed()`