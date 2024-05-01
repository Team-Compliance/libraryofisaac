---@diagnostic disable: duplicate-doc-alias, duplicate-set-field, missing-return
_G.TSIL = {}

TSIL.Ambush = {}
TSIL.Benchmark = {}
TSIL.BitSet128 = {}
TSIL.Bombs = {}
TSIL.Bosses = {}
TSIL.Charge = {}
TSIL.Collectibles = {}
TSIL.Color = {}
TSIL.Enums = {}
TSIL.Enums.CustomCallback = {}
TSIL.CustomItemPools = {}
TSIL.Debug = {}
TSIL.Dimensions = {}
TSIL.Direction = {}
TSIL.Doors = {}
TSIL.Effects = {}
TSIL.Entities = {}
TSIL.EntitySpecific = {}
TSIL.Familiars = {}
TSIL.GridEntities = {}
TSIL.GridIndexes = {}
TSIL.GridSpecific = {}
TSIL.Input = {}
TSIL.IsaacAPIClass = {}
TSIL.ItemPool = {}
TSIL.JSON = {}
TSIL.Log = {}
TSIL.Pause = {}
TSIL.Pickups = {}
TSIL.PickupSpecific = {}
TSIL.Pills = {}
TSIL.Players = {}
TSIL.Random = {}
TSIL.RNG = {}
TSIL.Rooms = {}
TSIL.RoomSpecific = {}
TSIL.Run = {}
TSIL.SaveManager = {}
TSIL.Serialize = {}
TSIL.ShockWaves = {}
TSIL.Sprites = {}
TSIL.Stage = {}
TSIL.Trinkets = {}
TSIL.UI = {}
TSIL.Utils = {}
TSIL.Utils.DeepCopy = {}
TSIL.Utils.Easings = {}
TSIL.Utils.Flags = {}
TSIL.Utils.Functions = {}
TSIL.Utils.Math = {}
TSIL.Utils.String = {}
TSIL.Utils.Tables = {}
TSIL.Vector = {}

---Helper function to get the corresponding ambush type for the current room. Returns nil if
---the current room does not correspond to any particular ambush type
---@return AmbushType?
function TSIL.Ambush.GetAmbushType()
end

--- Helper function to benchmark the performance of a function.
--- This function is variadic, which means that you can supply as many functions as you want to
--- benchmark.
---
--- This function uses the `Isaac.GetTime` method to record how long the function took to execute.
--- This method only reports time in milliseconds. For this reason, if you are benchmarking smaller
--- functions, then you should provide a very high value for the number of trials.
---@param numTrials integer
---@vararg function
---@return number[] @ A table containing the average time in milliseconds for each function (this will be printed in the log)
function TSIL.Benchmark.Benchmark(numTrials, ...)
end

---Helper function to copy a `BitSet128` Isaac API class.
---@param bitSet128 BitSet128
---@return BitSet128
function TSIL.BitSet128.CopyBitSet128(bitSet128)
end

---Helper function to find out how large a bomb explosion is based on the damage inflicted.
---@param damage number
---@return number
function TSIL.Bombs.GetBombRadiusFromDamage(damage)
end

---Helper function to get all of the bosses in the room.
---@param entityType EntityType? @Default: -1 | If specified, will only get the bosses that match the type. Default is -1, which matches every type.
---@param variant integer? @Default: -1 | If specified, will only get the bosses that match the variant. Default is -1, which matches every variant.
---@param subType integer? @Default: -1 | If specified, will only get the bosses that match the sub-type. Default is -1, which matches every sub-type.
---@param ignoreFriendly boolean? @Default: false
---@return EntityNPC[]
function TSIL.Bosses.GetBosses(entityType, variant, subType, ignoreFriendly)
end

---Helper function to check if the provided NPC is a Sin miniboss, such as Sloth or Lust.
---@param npc EntityNPC
---@return boolean
function TSIL.Bosses.IsSin(npc)
end

---Helper function to spawn a boss.
---
---Use this function instead of `TSIL.Entities.SpawnNPC` since it handles automatically spawning multiple segments
---for multi-segment bosses.
---
---By default, this will spawn Chub (and his variants) with 3 segments, Lokii with 2 copies,
---Gurglings/Turdlings with 2 copies, and other multi-segment bosses with 4 segments. You can
---customize this via the "numSegments" argument.
---@param entityType EntityType
---@param variant integer
---@param subType integer
---@param position Vector 
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG? integer | RNG
---@param numSegments integer?
---@return EntityNPC
function TSIL.Bosses.SpawnBoss(entityType, variant, subType, position, velocity, spawner, seedOrRNG, numSegments)
end

--- Helper function to get the amount of charges away from the maximum charge that a particular
--- player is.
---
--- This function accounts for The Battery. For example, if the player has 2/6 charges on a D6, this
--- function will return 10 (because there are 4 charges remaining on the base charge and 6 charges
--- remaining on The Battery charge).
---@param player EntityPlayer @The player to get the charges from 
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to get the charges from.
---@return integer
function TSIL.Charge.GetChargesAwayFromMax(player, activeSlot)
end

--- Helper function to return the maximum charge a player can have in
--- a given active slot.
---
--- Use this over `player:GetActiveMaxCharge` if you want to account for
--- the over charge given by The Battery.
---@param player EntityPlayer
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to get the max charges from.
function TSIL.Charge.GetEffectiveMaxCharge(player, activeSlot)
end

--- Helper function to check if a player's active item is "double charged", meaning that it has both
--- a full normal charge and a full charge from The Battery.
---@param player EntityPlayer @The player to check
---@param activeSlot ActiveSlot? @Default: `ActiveSlot.SLOT_PRIMARY` | The slot to check.
---@return boolean
function TSIL.Charge.IsActiveSlotDoubleCharged(player, activeSlot)
end

---Helper function to check if a collectible type has a given flag
---@param collectibleType CollectibleType
---@param flag ItemConfigTag
---@return boolean
function TSIL.Collectibles.CollectibleHasFlag(collectibleType, flag)
end

--- Helper function to check if two collectible sprites are the same.
---@param sprite1 Sprite
---@param sprite2 Sprite
---@return boolean
function TSIL.Collectibles.CollectibleSpriteEquals(sprite1, sprite2)
end

--- Helper function to change the sprite of a collectible pedestal
---@param collectible EntityPickup
---@param spriteSheet string? @Optional. If not set, the sprite will be removed, like if the item had already been taken.
function TSIL.Collectibles.SetCollectibleSprite(collectible, spriteSheet)
end

--- Helper function to get the coin cost a collectible would have if it were being offered as a
--- Devil Room Deal.
---@param collectibleType CollectibleType
---@return integer
function TSIL.Collectibles.GetCollectibleDevilCoinPrice(collectibleType)
end

--- Helper function to get the heart cost a collectible would have if it were being offered as a
--- Devil Room Deal.
---@param collectibleType CollectibleType @ If this is set to `COLLECTIBLE_NULL` then it'll return `PRICE_FREE`
---@param player EntityPlayer
---@return PickupPrice
function TSIL.Collectibles.GetCollectibleDevilHeartPrice(collectibleType, player)
end

---@class CollectibleIndex


--- Mods may have to keep track of data relating to a collectible. Finding an index for these kinds
--- of data structures is difficult, since collectibles are respawned every time a player re-enters a
--- room (like all other pickups), so the `PtrHash` will change.
---
--- Use this function to get a unique index for a collectible to use in these data structures.
---
--- Collectibles are a special case of pickups: they cannot be pushed around. (They actually can be
--- pushed, but usually will stay on the same grid index.) Thus, it is possible to generate a
--- somewhat reliable non-stateful index for collectibles. We use a 4-tuple of the room list index,
--- the grid index of the collectible in the room, the collectible's `SubType`, and the collectible's
--- `InitSeed`.
---
--- Collectibles that are shifted by Tainted Isaac's mechanic will have unique collectible indexes
--- because the `SubType` is different. (The collectible entities share the same `InitSeed` and
--- `PtrHash`.)
---
--- Collectibles that are rolled (with e.g. a D6) will have unique collectible indexes because the
--- `SubType` and `InitSeed` are different. If you want to track collectibles independently of any
--- rerolls, then you can use the `PtrHash` as an index instead. (The `PtrHash` will not persist
--- between rooms, however.)
---
--- Note that:
--- - The grid index is a necessary part of the collectible index because Diplopia and Crooked Penny
---   can cause two or more collectibles with the same `SubType` and `InitSeed` to exist in the same
---   room.
--- - This index will fail in the case where the player uses Diplopia or a successful Crooked Penny
---   seven or more times in the same room, since that will cause two or more collectibles with the
---   same grid index, `SubType`, and `InitSeed` to exist. (More than seven is required in non-1x1
---   rooms.)
--- - The `SubType` is a necessary part of the collectible index because Tainted Isaac will
---   continuously cause collectibles to morph into new sub-types with the same `InitSeed`.
--- - Using a collectible's position as part of the index is problematic, since players can push a
---   pedestal. (Even using the grid index does not solve this problem, since it is possible in
---   certain cases for collectibles to be spawned at a position that is not aligned with the grid,
---   and the pedestal pushed to an adjacent tile, but this case should be extremely rare.)
--- - Mega Chests spawn two collectibles on the exact same position. However, both of them will have
---   a different `InitSeed`, so this is not a problem for this indexing scheme.
--- - The indexing scheme used is different for collectibles that are inside of a Treasure Room or
---   Boss Room, in order to handle the case of the player seeing the same collectible again in a
---   post-Ascent Treasure Room or Boss Room. A 5-tuple of stage, stage type, grid index, `SubType`,
---   and `InitSeed` is used in this case. (Using the room list index or the room grid index is not
---   suitable for this purpose, since both of these values can change in the post-Ascent rooms.)
---   Even though Treasure Rooms and Boss Rooms are grouped together in this scheme, there probably
---   will not be collectibles with the same grid index, SubType, and InitSeed.
---@param collectible EntityPickup
---@return CollectibleIndex
function TSIL.Collectibles.GetCollectibleIndex(collectible)
end

--- Helper function to get the maximum amount of charges that a collectible has. Returns 0 if the
--- provided collectible type was not valid.
---@param collectibleType CollectibleType
---@return number 
function TSIL.Collectibles.GetCollectibleMaxCharges(collectibleType)
end

--- Returns a list with all items currently loaded.
---
--- Use only inside a callback or not all modded items may be loaded.
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetCollectibles()
end

--- Returns a list of all items of a certain quality.
---
--- Use only inside a callback or not all modded items may be loaded.
---@param quality integer
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetCollectiblesByQuality(quality)
end

--- Returns a list of all vanilla items.
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetVanillaCollectibles()
end

--- Returns a list of all modded items currently loaded.
--- 
--- Use only inside a callback or not all modded items may be loaded.
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetModdedCollectibles()
end

--- Returns a list of all items that have all the given tags.
--- 
--- Use only inside a callback or not all modded items may be loaded.
---@param ... ItemConfigTag
---@return ItemConfig_Item[]
function TSIL.Collectibles.GetCollectiblesWithTag(...)
end

--- Returns true if the collectible has a red question mark sprite.
--- 
--- Note that this function will not work properly in a render callback
--- with the render mode set to `RenderMode.WATER_REFLECT`.
---@param collectible EntityPickup
---@return boolean
function TSIL.Collectibles.IsBlindCollectible(collectible)
end

--- Returns true if the collectible is a glitched item, like because of the effect of TMTRAINER.
---@param collectible EntityPickup
---@return boolean
function TSIL.Collectibles.IsGlitchedCollectible(collectible)
end

--- Returns true if the collectible type corresponds a modded item.
---@param collectibleType CollectibleType
---@return boolean
function TSIL.Collectibles.IsModdedColllectible(collectibleType)
end

--- Returns true if the collectible is either `ITEM_PASSIVE` or `ITEM_FAMILIAR`.
---@param collectibleType CollectibleType
---@return boolean
function TSIL.Collectibles.IsPassiveCollectible(collectibleType)
end

--- Helper function to set a collectible sprite to a red question mark.
---@param collectible EntityPickup
function TSIL.Collectibles.SetCollectibleBlind(collectible)
end

--- Helper function to change a collectible into a glitched one.
---@param collectible EntityPickup
function TSIL.Collectibles.SetCollectibleGlitched(collectible)
end

--- Helper function to change the collectible in a pedestal.
---
--- If `COLLECTIBLE_NULL` is given as the new subtype, it'll try removing the item,
--- as if the player had already picked it. Check `TSIL.Collectibles.TryRemoveCollectible()`
--- for more information.
---@param collectible EntityPickup
---@param newSubType CollectibleType
function TSIL.Collectibles.SetCollectibleSubType(collectible, newSubType)
end

--- Empties an item pedestal as if a player had already
--- picked it up.
---
--- If it's a shop item, it removes it completely.
---@param collectible EntityPickup
---@return boolean Whether the collectible could be emptied.
function TSIL.Collectibles.TryRemoveCollectible(collectible)
end

---Copies a color.
---@param color Color
---@return Color
function TSIL.Color.CopyColor(color)
end

---Helper function to copy a `KColor` Isaac API class.
---@param kColor KColor
---@return KColor
function TSIL.Color.CopyKColor(kColor)
end

---Helper function to get a random color.
---
---Only randomizes the R, G and B fields.
---@param seedOrRNG? integer | RNG @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called.
---@param alpha number? @Default: 1 | The alpha value to use.
---@return Color
function TSIL.Color.GetRandomColor(seedOrRNG, alpha)
end

---Converts a hex string like "#33aa33" to a Color object.
---@param hex string
---@param alpha number
---@return Color
function TSIL.Color.HexToColor(hex, alpha)
end

---Converts a hex string like "#33aa33" to a KColor object.
---@param hex string
---@param alpha number
---@return KColor
function TSIL.Color.HexToKColor(hex, alpha)
end

---Similar to the vanilla `AddCallback` but newer versions will	
---override older versions.
---@param id string @Must be unique. Usually they are named `FEATURE_NAME_CALLBACK_NAME`.
---@param callback ModCallbacks | CustomCallback
---@param funct function
---@param priority integer | CallbackPriority?
---@param optionalParam? integer
function TSIL.__AddInternalCallback(id, callback, funct, priority, optionalParam)
end

---Enables an internal callback and allows it to run.
---@param id string @The internal callback id.
function TSIL.__EnableInternalCallback(id)
end

---Disables an internal callback and disallows it from running.
---@param id string @The internal callback id.
function TSIL.__DisableInternalCallback(id)
end

---@class PickingUpItem
---@field ID CollectibleType | TrinketType
---@field Type ItemType


---Registers a new custom callback.
---
---Each `CallbackOptionalArgType` refers to one argument passed
---by the callback, so a callback with params:
---```lua
---(player: EntityPlayer, name: string, num: integer)
---```
---To allow the user to filter by player type and the `num` param
---you'd need to use the following `CallbackOptionalArgType`:
---```lua
---CallbackOptionalArgType.PLAYER_TYPE,
---CallbackOptionalArgType.NONE, --We need to skip the `name` argument
---CallbackOptionalArgType.GENERIC
---```
---@param callback CustomCallback
---@param returnMode? CallbackReturnMode @Default: CallbackReturnMode.NONE
---@param ... CallbackOptionalArgType
function TSIL.__RegisterCustomCallback(callback, returnMode, ...)
end

---@param param integer?
---@return boolean
function TSIL.__IsDefaultParam(param)
end

---@param callback CustomCallback
---@param ... any
---@return unknown?
function TSIL.__TriggerCustomCallback(callback, ...)
end

---Adds an item to a custom item pool for the current run.
---
---If the item wasn't in the pool to begin with, it'll create a new entry for the item.
---If the item was already in the pool, it'll add the weight you passed to the entry already in the pool,
---unless the `ignoreDuplicate` param is set to true.
---@param customItemPoolType integer
---@param newItemPoolCollectible CustomItemPoolCollectible
---@param ignoreIfDuplicate? boolean @ Default: false | Set to true so if the item is in the pool, it doesn't get added again
function TSIL.CustomItemPools.AddCollectible(customItemPoolType, newItemPoolCollectible, ignoreIfDuplicate)
end

---Adds an item to a registered custom item pool.
---
---Unlike `TSIL.CustomItemPools.AddCollectible`, this will add the collectible to the registered pool,
---so when the pool is reset, this new item will be in the pool.
---@param customItemPoolType integer
---@param newItemPoolCollectible CustomItemPoolCollectible
function TSIL.CustomItemPools.AddCollectibleToRegisteredPool(customItemPoolType, newItemPoolCollectible)
end

---Adds a list of collectibles to a registered custom item pool.
---
---Unlike `TSIL.CustomItemPools.AddCollectible`, this will add the collectible to the registered pool,
---so when the pool is reset, this new item will be in the pool.
---@param customItemPoolType integer
---@param itemPoolCollectibles CustomItemPoolCollectible[]
function TSIL.CustomItemPools.AddCollectiblesToRegisteredPool(customItemPoolType, itemPoolCollectibles)
end

---Helper function to get an item from a custom item pool created with `TSIL.CustomItemPools.RegisterCustomItemPool()`.
---
---Similar to vanilla pools, the item will only get it's weight decreased if the `decrease` argument is set to true.
---@param customItemPoolType integer
---@param decrease? boolean @Default: true
---@param seedOrRNG? integer | RNG @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called.
---@param defaultItem? CollectibleType @Default: CollectibleType.COLLECTIBLE_NULL
function TSIL.CustomItemPools.GetCollectible(customItemPoolType, decrease, seedOrRNG, defaultItem)
end

---Helper function to get a copy of the current item entries for a given pool.
---@param customItemPoolType integer
---@return CustomItemPoolCollectible[]
function TSIL.CustomItemPools.GetCollectibleEntriesInItemPool(customItemPoolType)
end

---Helper function to check if a certain collectible is in a custom item pool.
---@param customItemPoolType integer
---@param collectibleType CollectibleType
---@return boolean
function TSIL.CustomItemPools.IsCollectibleInCustomPool(customItemPoolType, collectibleType)
end

---@class CustomItemPoolCollectible
---@field Collectible CollectibleType
---@field Weight number
---@field DecreaseBy number
---@field RemoveOn number


---Registers a new custom item pool. Use this function once after loading the library to
---load your item pool.
---
---This function also returns an automatically assigned ID you need to refer to your item pool.
---
---For example:
---```lua
---local myItemPoolItems = {
--- {Collectible = CollectibleType.COLLECTIBLE_SAD_ONION, Weight = 1, DecreaseBy = 1, RemoveOn = 0.1},
--- {Collectible = CollectibleType.COLLECTIBLE_BRIMSTONE, Weight = 1, DecreaseBy = 1, RemoveOn = 0.1},
---}
---local MY_ITEM_POOL = TSIL.CustomItemPools.RegisterCustomItemPool(myItemPoolItems)
---```
---@param collectibles? CustomItemPoolCollectible[] @ Default: {}
---@return integer
function TSIL.CustomItemPools.RegisterCustomItemPool(collectibles)
end

---Helper function to remove an item from the given custom item pool.
---
---Will return true if the item was in the pool before being removed.
---@param customItemPoolType integer
---@param collectibleType CollectibleType
---@param decreaseBy? number @ If provided, it'll remove the weight from the item instead of removing the item completely
---@return boolean
function TSIL.CustomItemPools.RemoveCollectible(customItemPoolType, collectibleType, decreaseBy)
end

---Helper function to get the current time for benchmarking / profiling purposes.
---
---The return value will either be in seconds or milliseconds, depending on if the "--luadebug" flag
---is turned on or not.
---
---If the "--luadebug" flag is present, then this function will use the `socket.gettime` method,
---which returns the epoch timestamp in seconds (e.g. "1640320492.5779"). This is preferable over
---the more conventional `Isaac.GetTime` method, since it has one extra decimal point of precision.
---
---If the "--luadebug" flag is not present, then this function will use the `Isaac.GetTime` method,
---which returns the number of milliseconds since the computer's operating system was started (e.g.
---"739454963").
---@return number
function TSIL.Debug.GetTime()
end

---Helper function to get a stack trace.
---
---This will only work if the `--luadebug` launch option is enabled.
---@return string
function TSIL.Debug.GetTraceback()
end

---Helper function to check if a debug mode is active.
---@param mode DebugFlag
---@return boolean
function TSIL.Debug.IsDebugModeActive(mode)
end

---Players can boot the game with an launch option called "--luadebug", which will enable additional
---functionality that is considered to be unsafe. For more information about this flag, see the
---wiki: https://bindingofisaacrebirth.fandom.com/wiki/Launch_Options
---
---When this flag is enabled, the global environment will be slightly different. The differences are
---documented here: https://wofsauge.github.io/IsaacDocs/rep/Globals.html
---
---This function uses the `package` global variable as a proxy to determine if the "--luadebug" flag
---is enabled or not.
---@return boolean
function TSIL.Debug.IsLuaDebugEnabled()
end

---Helper function to print a stack trace to the "log.txt" file, similar to JavaScript's
---`console.trace` function.
---This will only work if the `--luadebug` launch option is enabled
function TSIL.Debug.Traceback()
end

--- Helper function to check if the players are in a given dimension.
---@param dimension Dimension
---@return boolean
function TSIL.Dimensions.InDimension(dimension)
end

--- Helper function to convert a given amount of angle degrees into the corresponding `Direction` enum.
---@param angleDegrees number
---@return Direction
function TSIL.Direction.AngleToDirection(angleDegrees)
end

--- Helper function to get the corresponding angle degrees from a `Direction` enum.
---@param direction Direction
---@return integer
function TSIL.Direction.DirectionToDegrees(direction)
end

--- Helper function to get a Vector pointing in a given Direction.
---@param direction Direction
---@return Vector
function TSIL.Direction.DirectionToVector(direction)
end

--- Helper function to open a door instantly without playing its open animation.
---@param door GridEntityDoor
function TSIL.Doors.CloseDoorFast(door)
end

--- Helper funciton to close all doors in the current room.
---@param playAnim boolean @ If set to false, the doors won't play the close animation.
function TSIL.Doors.CloseAllDoors(playAnim)
end

--- Helper function to reset an unlocked door back to its locked state.
---@param door GridEntityDoor
function TSIL.Doors.LockDoor(door)
end

--- Helper function to get a door slot flag from a door slot.
---@param doorSlot DoorSlot
---@return integer
function TSIL.Doors.DoorSlotToDoorSlotFlag(doorSlot)
end

--- Helper function to convert the provided door slots into a door slot bitmask.
---@param ... DoorSlot
---@return integer
function TSIL.Doors.DoorSlotsToDoorSlotBitMask(...)
end

--- Helper function to get the door slots corresponding to a door slot bit mask.
---@param doorSlotBitMask integer
---@return DoorSlot[]
function TSIL.Doors.GetDoorSlotsFromDoorSlotBitMask(doorSlotBitMask)
end

--- Helper function to get the direction corresponding to a given door slot.
---@param doorSlot DoorSlot
---@return Direction
function TSIL.Doors.DoorSlotToDirection(doorSlot)
end

--- Helper function to get the offset from a door position that a player will enter a room at.
---@param doorSlot any
---@return Vector
function TSIL.Doors.GetDoorSlotEnterPositionOffset(doorSlot)
end

--- Helper function to get the position that a player will enter a room at corresponding to a door slot.
---@param doorSlot DoorSlot
---@return Vector
function TSIL.Doors.GetDoorSlotEnterPosition(doorSlot)
end

--- Helper function to get the position that a player will enter a room at corresponding to a door.
---@param door GridEntityDoor
---@return Vector
function TSIL.Doors.GetDoorEnterPosition(door)
end

--- Helper function to return all doors in the current room.
---
--- You can optionally specify one or more room types to return only the doors
--- that match the specified room types.
---@param ... RoomType
---@return GridEntityDoor[]
function TSIL.Doors.GetDoors(...)
end

--- Helper function to return all doors in the current room that lead to
--- a given room index.
---@param ... integer
---@return GridEntityDoor[]
function TSIL.Doors.GetDoorsToRoomIndex(...)
end

--- Helper function to get all the possible door slots in a room shape.
---@param roomShape RoomShape
---@return DoorSlot[]
function TSIL.Doors.GetDoorSlotsForRoomShape(roomShape)
end

--- Helper function to get the corresponding door slot for a given room shape and grid coordinates.
---@param roomShape RoomShape
---@param x integer
---@param y integer
---@return DoorSlot?
function TSIL.Doors.GetRoomShapeDoorSlot(roomShape, x, y)
end

--- Helper function to get the grid coordinates for a specific room shape and door slot combination.
---@param roomShape RoomShape
---@param doorSlot DoorSlot
---@return {x:integer, y:integer}?
function TSIL.Doors.GetRoomShapeDoorSlotCoordinates(roomShape, doorSlot)
end

--- Helper function to get the angel room door in the current room.
--- If there isn't any, returns nil.
---@return GridEntityDoor?
function TSIL.Doors.GetAngelRoomDoor()
end

--- Helper function to get the devil room door in the current room.
--- If there isn't any, returns nil.
---@return GridEntityDoor?
function TSIL.Doors.GetDevilRoomDoor()
end

--- Helper function to get an angel or devil room door in the current room.
---
--- Note that if there are both an angel and devil room door it'll only return the one in the lowest door slot.
---@return GridEntityDoor?
function TSIL.Doors.GetAngelOrDevilRoomDoor()
end

--- Helper function to get the door that leads to the blue womb entrance in the current room.
---@return GridEntityDoor?
function TSIL.Doors.GetBlueWombDoor()
end

--- Helper function to get the door that leads to a repentance secret exit in the current room.
---@return GridEntityDoor?
function TSIL.Doors.GetSecretExitDoor()
end

--- Helper function to check if a given door slot can be present in a given room shape.
---@param doorSlot DoorSlot
---@param roomShape RoomShape
---@return boolean
function TSIL.Doors.IsDoorSlotInRoomShape(doorSlot, roomShape)
end

--- Helper function to see if a door leads to an angel deal room.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsAngelRoomDoor(door)
end

--- Helper function to see if a door leads to an devil deal room.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDevilRoomDoor(door)
end

--- Helper function to see if a door is the blue womb entrance door that
--- appears after defeating Mom's Heart/It Lives.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsBlueWombDoor(door)
end

--- Helper function to see if a door leads to any of the secret exit introduced
--- in Repentance, that lead you to the Repentance floors.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsSecretExitDoor(door)
end

--- Helper function to see if a door leads to the secret exit to Downpour.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToDownpour(door)
end

--- Helper function to see if a door leads to the secret exit to Mausoleum.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMausoleum(door)
end

--- Helper function to see if a door leads to the secret exit to the ascent version of Mausoleum,
--- located in Depths 2 and requires The Polaroid or The Negative to open.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMausoleumAscent(door)
end

--- Helper function to see if a door leads to the secret exit to Mines.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMines(door)
end

--- Helper function to see if a door is the door that spawns after defeating Mom in
--- Mausoleum II and requires both knife pieces to open.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsDoorToMomsHeart(door)
end

--- Helper function to check if a door is a hole in the wall that appears after
--- bombing the entrance to a secret room.
---
--- Note that the door still exists even if it hasn't been bombed yet.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsSecretRoomDoor(door)
end

--- Helper function to check if a door is a hole in the wall that appears after
--- bombing the entrance to a secret room but hasn't been revealed yet.
---@param door GridEntityDoor
---@return boolean
function TSIL.Doors.IsHiddenSecretDoor(door)
end

--- Helper function to open a door instantly without playing its open animation.
---@param door GridEntityDoor
function TSIL.Doors.OpenDoorFast(door)
end

--- Helper funciton to open all doors in the current room
---@param playAnim boolean @ If set to false, the doors won't play the open animation.
function TSIL.Doors.OpenAllDoors(playAnim)
end

--- Helper function to remove a single door
---@param door GridEntityDoor
function TSIL.Doors.RemoveDoor(door)
end

--- Helper function to remove all the given doors
---@param doors GridEntityDoor[]
function TSIL.Doors.RemoveDoors(doors)
end

--- Helper function to remove all doors of the given room types.
---@param ... RoomType @ If no room type is specified, all doors will get removed.
function TSIL.Doors.RemoveAllDoorsOfType(...)
end

--- Helper function to get all unused door slots in the current room.
---
--- Useful to spawn custom doors.
---@return DoorSlot[]
function TSIL.Doors.GetUnusedDoorSlots()
end

--- Helper function to check if the current room has any unused door slots.
---@return boolean
function TSIL.Doors.HasUnusedDoorSlot()
end

---Helper function to check if a player is close enough to a dice floor to trigger its effect.
---
---Unlike most entities in the game, dice floors have an square hitbox.
---@param entity Entity
---@param diceFloor EntityEffect
function TSIL.Effects.IsCloseEnoughToTriggerDiceFloor(entity, diceFloor)
end

---Helper function to check if an entity can collide with a given grid entity.
---@param entity Entity
---@param gridEntity GridEntity
---@return boolean
function TSIL.Entities.CanCollideWithGridEntity(entity, gridEntity)
end

---Sets some arbitrary data for an entity. Use this instead of `Entity:GetData()` since that
---is global and allows for other mods to edit your data.
---
---This is also better than manually keeping track of the data manually with the save manager
---since the PtrHash can be reused after the entity is removed and this keeps track of it manually.
---
---Use only for non persistent entities like effects.
---@param mod table
---@param entity Entity
---@param field string
---@param value any
function TSIL.Entities.SetEntityData(mod, entity, field, value)
end

---Gets some arbitrary data for an entity. Use this instead of `Entity:GetData()` since that
---is global and allows for other mods to edit your data.
---
---This is also better than manually keeping track of the data manually with the save manager
---since the PtrHash can be reused after the entity is removed and this keeps track of it manually.
---
---Use only for non persistent entities like effects.
---@param mod table
---@param entity Entity
---@param field string
---@return any
function TSIL.Entities.GetEntityData(mod, entity, field)
end

--- Helper function to get all of the entities in the room or all of the entities tht match a specific entity type / variant / sub-type.
--- Due to bugs with `Isaac.FindInRadius`, this function uses `Isaac.GetRoomEntities`, which is more expensive but is also more robust.
--- (If a matching entity type is provided, then `Isaac.FindByType` will be used instead.)
---@param entityType EntityType|integer? @Default: -1 | If specified, will only get the entities that match the type. Default is -1, which matches every type.
---@param variant integer? @Default: -1 | If specified, will only get the entities that match the variant. Default is -1, which matches every variant.
---@param subType integer? @Default: -1 | If specified, will only get the entities that match the sub-type. Default is -1, which matches every sub-type.
---@param ignoreFriendly boolean? @Default: false | If set to true, it will exclude friendly NPCs from being returned. Will only be taken into account if the `entityType` is specified.
---@return Entity[]
function TSIL.Entities.GetEntities(entityType, variant, subType, ignoreFriendly)
end

--- Helper function to get a map containing the positions of every entity in the current room.
---@param entities Entity[]? @Optional. If provided, will only get the positions of the given entities, instead of calling `Isaac.GetRoomEntities`.
---@return table<EntityPtr, Vector>
function TSIL.Entities.GetEntityPositions(entities)
end

--- Helper function to get a map containing the velocities of every entity in the current room.
---@param entities Entity[]? @Optional. If provided, will only get the velocities of the given entities, instead of calling `Isaac.GetRoomEntities`.
---@return table<EntityPtr, Vector>
function TSIL.Entities.GetEntityVelocities(entities)
end

--- Helper function to set the positions of all the entities in the room.
--- 
--- Useful for rewinding entity positions.
---@param positions table<EntityPtr, Vector>
---@param entities Entity[]? @Optional If provided, will only set the positions of the given entities, instead of calling `Isaac.GetRoomEntities`.
function TSIL.Entities.SetEntityPositions(positions, entities)
end

--- Helper function to set the velocities of all the entities in the room.
--- 
--- Useful for rewinding entity velocities.
---@param velocities table<EntityPtr, Vector>
---@param entities Entity[]? @Optional If provided, will only set the velocities of the given entities, instead of calling `Isaac.GetRoomEntities`.
function TSIL.Entities.SetEntityVelocities(velocities, entities)
end

--- Checks if an entity is colliding with a grid entity.
--- If it does, returns the first grid entity it's colliding with, else returns nil.
---@param entity Entity
---@return GridEntity?
function TSIL.Entities.IsCollidingWithGrid(entity)
end

---Helper function to spawn an entity. Use this instead of the `Isaac.Spawn` method if you do not
---need to specify the velocity or spawner.
---@param entityType EntityType
---@param variant integer 
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return Entity
function TSIL.Entities.Spawn(entityType, variant, subType, position, velocity, spawner, seedOrRNG)
end

--- Helper function to get all of the bombs in the room. (Specifically, this refers to the `EntityBomb` class, not bomb pickups.)
---@param bombVariant BombVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityBomb[]
function TSIL.EntitySpecific.GetBombs(bombVariant, subType)
end

--- Helper function to get all of the effects in the room.
---@param effectVariant EffectVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityEffect[]
function TSIL.EntitySpecific.GetEffects(effectVariant, subType)
end

--- Helper function to get all of the familiars in the room.
---@param familiarVariant FamiliarVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityFamiliar[]
function TSIL.EntitySpecific.GetFamiliars(familiarVariant, subType)
end

--- Helper function to get all of the knives in the room.
---@param knifeVariant KnifeVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
function TSIL.EntitySpecific.GetKnives(knifeVariant, subType)
end

--- Helper function to get all of the lasers in the room.
---@param laserVariant LaserVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityLaser[]
function TSIL.EntitySpecific.GetLasers(laserVariant, subType)
end

--- Helper function to get all of the NPCs in the room.
---@param entityType EntityType|integer? @Default: -1 | Default is -1, which matches all types.
---@param variant integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@param ignoreFriendly boolean? @Default: false | If set to true, it will exclude friendly NPCs from being returned. Default is false. Will only be taken into account if the `entityType` is specified.
---@return EntityNPC[]
function TSIL.EntitySpecific.GetNPCs(entityType, variant, subType, ignoreFriendly)
end

--- Helper function to get all of the pickups in the room.
---@param pickupVariant PickupVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityPickup[]
function TSIL.EntitySpecific.GetPickups(pickupVariant, subType)
end

--- Helper function to get all of the projectiles in the room.
---@param projectileVariant ProjectileVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityProjectile[]
function TSIL.EntitySpecific.GetProjectiles(projectileVariant, subType)
end

--- Helper function to get all of the slots in the room.
---@param slotVariant SlotVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return Entity[]
function TSIL.EntitySpecific.GetSlots(slotVariant, subType)
end

--- Helper function to get all of the tears in the room.
---@param tearVariant TearVariant|integer? @Default: -1 | Default is -1, which matches all variants.
---@param subType integer? @Default: -1 | Default is -1, which matches all sub-types.
---@return EntityTear[]
function TSIL.EntitySpecific.GetTears(tearVariant, subType)
end

---Helper function to spawn an NPC.
---
---Note that if you pass a non-NPC `EntityType` to this function, it will cause a run-time error,
---since the `Entity.ToNPC` method will return nil.
---@param entityType EntityType
---@param variant integer
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner? Entity
---@param seedOrRNG? integer | RNG
---@return EntityNPC
function TSIL.EntitySpecific.SpawnNPC(entityType, variant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a bomb.
---@param bombVariant BombVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityBomb
function TSIL.EntitySpecific.SpawnBomb(bombVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn an effect.
---@param effectVariant EffectVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityEffect
function TSIL.EntitySpecific.SpawnEffect(effectVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a familiar.
---@param familiarVariant FamiliarVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityFamiliar
function TSIL.EntitySpecific.SpawnFamiliar(familiarVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a knife.
---@param knifeVariant KnifeVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityKnife
function TSIL.EntitySpecific.SpawnKnife(knifeVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a laser.
---@param laserVariant LaserVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityLaser
function TSIL.EntitySpecific.SpawnLaser(laserVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a pickup.
---@param pickupVariant PickupVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.EntitySpecific.SpawnPickup(pickupVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a projectile.
---@param projectileVariant ProjectileVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityProjectile
function TSIL.EntitySpecific.SpawnProjectile(projectileVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a slot.
---@param slotVariant SlotVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return Entity
function TSIL.EntitySpecific.SpawnSlot(slotVariant, subType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a tear.
---@param tearVariant TearVariant
---@param subType integer
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityTear
function TSIL.EntitySpecific.SpawnTear(tearVariant, subType, position, velocity, spawner, seedOrRNG)
end

---@enum AmbushType
TSIL.Enums.AmbushType = {
    CHALLENGE_ROOM = 0,
    BOSS_RUSH = 1
}

---Used when registering a custom callback using `TSIL.__RegisterCustomCallback()`.
---
---Defines how the callback filtering should treat each parameter.
---@enum CallbackOptionalArgType
TSIL.Enums.CallbackOptionalArgType = {
    --Directly checks for equality using `==`
    GENERIC = 0,
    --Skips this argument when checking
    NONE = 1,

    ENTITY_TYPE = 2,
    ENTITY_TYPE_VARIANT = 3,
    ENTITY_TYPE_VARIANT_SUBTYPE = 4,
    ENTITY_VARIANT_SUBTYPE = 5,
    ENTITY_SUBTYPE = 6,

    GRID_TYPE = 7,
    GRID_TYPE_VARIANT = 8,
    GRID_VARIANT = 9,

    PLAYER_TYPE_VARIANT = 10,
    PLAYER_TYPE = 11,

    MOD_NAME = 12
}

---Used when registering a custom callback using `TSIL.__RegisterCustomCallback()`.
---
---Defines how the returned values of the executed functions will be treated and
---what value is returned by `TSIL.__TriggerCustomCallback()`.
---@enum CallbackReturnMode
TSIL.Enums.CallbackReturnMode = {
	--Returned values are ignored
	NONE = 0,
	--When a function returns a non nil value
	--the rest are skipped.
	SKIP_NEXT = 1,
	--The last function to return a non nil value
	--overwrites all other returned values
	LAST_WINS = 2,
	--When a function returns a non nil value, the returned
	--value is used as the first argument for the next functions.
	--If a table is returned, the first element of the table will
	--be the first argument, the second element will be the second
	--argument, etc.
	NEXT_ARGUMENT = 3
}

---@enum ConversionHeartSubType
TSIL.Enums.ConversionHeartSubType = {
	BLACK = HeartSubType.HEART_BLACK,
	SOUL = HeartSubType.HEART_SOUL,
}

---@enum CustomCallback
TSIL.Enums.CustomCallback = {
	--Called whenever an instance of the library is finished loading.
	--
	--Used internally to make sure all of the library features are loaded
	POST_TSIL_LOAD = "POST_TSIL_LOAD",

	--Called before the save manager saves data to the disk for each mod. Return
	--`true` to skip saving for the current mod. If you choose to skip, you must
	--save the library persistent data yourself so it can later be loaded.
	--
	--Use this callback together with `PRE_SAVE_MANAGER_LOAD_FROM_DISK` if you want
	--to use a different save manager.
	--
	--Note that the modName and modPersistentData may be nil if it's only saving the library data.
	--This will happen if no mod is using the save manager but the library is still using
	--it internally.
	--
	--Params:
	--
	-- * modName - string?
	-- * modPersistentData - table?
	-- * libraryPersistentData - table
	--
	--Optional args:
	--
	-- * modName - string
	PRE_SAVE_MANAGER_SAVE_TO_DISK = "PRE_SAVE_MANAGER_SAVE_TO_DISK",

	--Called before the save manager loads data from the disk for each mod. Return
	--a table to be used as the library persistent data and avoid the save manager from
	--loading the mod's data.
	--
	--Use this callback together with `PRE_SAVE_MANAGER_SAVE_TO_DISK` if you want
	--to use a different save manager.
	--
	--Note that the modName may be nil if it's only loading the library data.
	--This will happen if no mod is using the save manager but the library is still using
	--it internally.
	--
	--Params:
	--
	-- * modName - string?
	--
	--Optional args:
	--
	-- * modName - string
	PRE_SAVE_MANAGER_LOAD_FROM_DISK = "PRE_SAVE_MANAGER_LOAD_FROM_DISK",

	--Called whenever on the first frame a challenge room or a boss rush is started.
	--Internally it's called the first frame `Room.IsAmbushDone` is true.
	--
	--Params:
	--
	-- * ambushType - AmbushType
	--
	--Optional args:
	--
	-- * ambushType - AmbushType
	POST_AMBUSH_STARTED = "POST_AMBUSH_STARTED",
	--Called whenever on the first frame a challenge room or a boss rush is started.
	--Internally it's called the first frame `Room.IsAmbushDone` is true.
	--
	--Params:
	--
	-- * ambushType - AmbushType
	--
	--Optional args:
	--
	-- * ambushType - AmbushType
	POST_AMBUSH_FINISHED = "POST_AMBUSH_FINISHED",
	--Called on first frame after clearing a wave in challenge room or boss rush.
	--Internally it's called the first frame either `Isaac.CountEnemies` or `Isaac.CountBosses` returns 0, depending on ambush type.
	--
	--Params:
	--
	-- * ambushType - AmbushType
	--
	--Optional args:
	--
	-- * ambushType - AmbushType
	POST_AMBUSH_WAVE = "POST_AMBUSH_WAVE",

	--Called whenever the clear state of a room changes.
	--
	--Params:
	--
	-- * isClear - boolean
	--
	--Optional args:
	--
	-- * clear - boolean
	POST_ROOM_CLEAR_CHANGED = "POST_ROOM_CLEAR_CHANGED",

	--Called when a bomb explodes. More specifically, this is called whenever
	--a bomb plays it's `Explode` animation.
	--
	--Params:
	--
	-- * bomb - EntityBomb
	--
	--Optional args:
	--
	-- * bombVariant - BombVariant
	-- * bombSubType - integer
	POST_BOMB_EXPLODED = "POST_BOMB_EXPLODED",
	--Called the first frame a bomb is available. This is useful since the
	--`POST_BOMB_INIT` callback doesn't let you access all of the bomb's attributes.
	--
	--Params:
	--
	-- * bomb - EntityBomb
	--
	--Optional args:
	--
	-- * bombVariant - BombVariant
	-- * bombSubType - integer
	POST_BOMB_INIT_LATE = "POST_BOMB_INIT_LATE",

	--Called the first frame a pedestal is empty.
	--
	--Params:
	--
	-- * pedestal - EntityPickup
	-- * oldCollectibleType - CollectibleType
	--
	--Optional args:
	--
	-- * collectibleType - CollectibleType
	POST_COLLECTIBLE_EMPTY = "POST_COLLECTIBLE_EMPTY",
	--Called from the `POST_PICKUP_INIT` the first time a pedestal is encountered.
	--
	--This is useful since pickups trigger the `POST_PICKUP_INIT` callback when they
	--respawn when room is reentered and, when playing T.Isaac, everytime they shift
	--
	--Params:
	--
	-- * collectible - EntityPickup
	--
	--Optional args:
	--
	-- * collectibleType - CollectibleType
	POST_COLLECTIBLE_INIT_FIRST = "POST_COLLECTIBLE_INIT_FIRST",

	--Called the first frame an effect entity is available. This is useful since the
	--`POST_EFFECT_INIT` callback doesn't let you access all of the effect's attributes.
	--
	--Params:
	--
	-- * effect - EntityEffect
	--
	--Optional args:
	--
	-- * effectVariant - EffectVariant
	-- * effectSubType - integer
	POST_EFFECT_INIT_LATE = "POST_EFFECT_INIT_LATE",
	--Called everytime an effect entity's state changes.
	--
	--Params:
	--
	-- * effect - EntityEffect
	-- * oldState - integer
	-- * newState - integer
	--
	--Optional args:
	--
	-- * effectVariant - EffectVariant
	-- * effectSubType - integer
	POST_EFFECT_STATE_CHANGED = "POST_EFFECT_STATE_CHANGED",

	--Called the first frame a familiar is available. This is useful since the
	--`POST_FAMILIAR_INIT` callback doesn't let you access all of the familiar's attributes.
	--
	--Params:
	--
	-- * familiar - EntityFamiliar
	--
	--Optional args:
	--
	-- * familiarVariant - FamiliarVariant
	-- * familiarSubType - integer
	POST_FAMILIAR_INIT_LATE = "POST_FAMILIAR_INIT_LATE",
	--Called everytime a familiar's state changes.
	--
	--Params:
	--
	-- * familiar - EntityFamiliar
	-- * oldState - integer
	-- * newState - integer
	--
	--Optional args:
	--
	-- * familiarVariant - FamiliarVariant
	-- * familiarSubType - integer
	POST_FAMILIAR_STATE_CHANGED = "POST_FAMILIAR_STATE_CHANGED",

	--Called whenever the greed wave counter increases.
	--
	--Params:
	--
	-- * oldWave - integer
	-- * newWave - integer
	POST_GREED_MODE_WAVE = "POST_GREED_MODE_WAVE",

	--Works exactly the same as the regular `ENTITY_REMOVE` callback but
	--let's you specify more arguments for filtering.
	--
	--Params:
	--
	-- * entity - Entity
	--
	--Optional args:
	--
	-- * entiyType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	POST_ENTITY_REMOVE_FILTER = "POST_ENTITY_REMOVE_FILTER",
	--Works exactly the same as the regular `ENTITY_TAKE_DMG` callback but
	--let's you specify more arguments for filtering.
	--
	--Return true or nil to sustain the damage. Return false to ignore it.
	--
	--Params:
	--
	-- * tookDamage - Entity
	-- * amount - number
	-- * source - EntityRef
	-- * countdown - integer
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	ENTITY_TAKE_DMG_FILTER = "ENTITY_TAKE_DMG_FILTER",
	--Works exactly the same as the regular `POST_NPC_DEATH` callback but
	--let's you specify more arguments for filtering.
	--
	--Params:
	--
	-- * entity - EntityNPC
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	POST_NPC_DEATH_FILTER = "POST_NPC_DEATH_FILTER",
	--Works exactly the same as the regular `POST_NPC_INIT` callback but
	--let's you specify more arguments for filtering.
	--
	--Params:
	--
	-- * entity - EntityNPC
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	POST_NPC_INIT_FILTER = "POST_NPC_INIT_FILTER",
	--Works exactly the same as the regular `POST_NPC_RENDER` callback but
	--let's you specify more arguments for filtering.
	--
	--Params:
	--
	-- * entity - EntityNPC
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	POST_NPC_RENDER_FILTER = "POST_NPC_RENDER_FILTER",
	--Works exactly the same as the regular `POST_NPC_UPDATE` callback but
	--let's you specify more arguments for filtering.
	--
	--Params:
	--
	-- * entity - EntityNPC
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	POST_NPC_UPDATE_FILTER = "POST_NPC_UPDATE_FILTER",
	--Works exactly the same as the regular `PRE_NPC_COLLISION` callback but
	--let's you specify more arguments for filtering.
	--
	--Return true to ignore collision, false to collide but not execute internal
	--code and nil to continue with internal code
	--
	--Params:
	--
	-- * entity - EntityNPC
	-- * collider - Entity
	-- * isLow - boolean
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	PRE_NPC_COLLISION_FILTER = "PRE_NPC_COLLISION_FILTER",
	--Works exactly the same as the regular `PRE_NPC_UPDATE` callback but
	--let's you specify more arguments for filtering.
	--
	--Return true to ignore internal AI. Return nil or false otherwise
	--
	--Params:
	--
	-- * entity - EntityNPC
	--
	--Optional args:
	--
	-- * entityType - EntityType
	-- * entityVariant - integer
	-- * entitySubType - integer
	PRE_NPC_UPDATE_FILTER = "PRE_NPC_UPDATE_FILTER",

	--Called the first frame a familiar is available. This is useful since the
	--`POST_FAMILIAR_INIT` callback doesn't let you access all of the familiar's attributes.
	--
	--Params:
	--
	-- * pickup - EntityPickup
	--
	--Optional args:
	--
	-- * pickupVariant - PickupVariant
	-- * pickupSubType - integer
	POST_PICKUP_INIT_LATE = "POST_PICKUP_INIT_LATE",
	--Called the first frame a pickup starts playing it's `Collect` animation.
	--
	--Params:
	--
	-- * pickup - EntityPickup
	--
	--Optional args:
	--
	-- * pickupVariant - PickupVariant
	-- * pickupSubType - integer
	POST_PICKUP_COLLECT = "POST_PICKUP_COLLECT",
	--Called from the `POST_PICKUP_INIT` the first time a pickup is encountered
	--
	--This is useful since pickups respawn every time a room is reentered and trigger
	--the `POST_PICKUP_INIT` callback.
	--
	--Params:
	--
	-- * pickup - EntityPickup
	--
	--Optional args:
	-- * pickupVariant - PickupVariant
	-- * pickupSubType - integer
	POST_PICKUP_INIT_FIRST = "POST_PICKUP_INIT_FIRST",
	--Called everytime an entity pickup's state changes.
	--
	--Params:
	--
	-- * pickup - EntityPickup
	-- * oldState - integer
	-- * newState - integer
	--
	--Optional args:
	--
	-- * pickupVariant - PickupVariant
	-- * pickupSubType - integer
	POST_PICKUP_STATE_CHANGED = "POST_PICKUP_STATE_CHANGED",
	--Called from the `PRE_PICKUP_COLLISION` whenever a player touches
	--a pedestal and can collect it.
	--
	--Return true to ignore collision, false to collide but not execute internal
	--code and nil to continue with internal code
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * collectible - EntityPickup
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * collectibleType - CollectibleType
	PRE_GET_PEDESTAL = "PRE_GET_PEDESTAL",

	--Called the first frame a projectile is available. This is useful since the
	--`POST_PROJECTILE_INIT` callback doesn't let you access all of the projectile's attributes.
	--
	--Params:
	--
	-- * projectile - EntityProjectile
	--
	--Optional args:
	--
	-- * projectileVariant - ProjectileVariant
	-- * projectileSubType - integer
	POST_PROJECTILE_INIT_LATE = "POST_PROJECTILE_INIT_LATE",

	--Called the first frame a laser is available. This is useful since the
	--`POST_LASER_INIT` callback doesn't let you access all of the laser's attributes.
	--
	--Params:
	--
	-- * laser - EntityLaser
	--
	--Optional args:
	--
	-- * laserVariant - LaserVariant
	-- * laserSubType - integer
	POST_LASER_INIT_LATE = "POST_LASER_INIT_LATE",

	--Called the first frame a knife is available. This is useful since the
	--`POST_KNIFE_INIT` callback doesn't let you access all of the knife's attributes.
	--
	--Params:
	--
	-- * knife - EntityKnife
	--
	--Optional args:
	--
	-- * knifeVariant - KnifeVariant
	-- * knifeSubType - integer
	POST_KNIFE_INIT_LATE = "POST_KNIFE_INIT_LATE",

	--Called the first frame an npc is available. This is useful since the
	--`POST_NPC_INIT` callback doesn't let you access all of the npc's attributes.
	--
	--Params:
	--
	-- * npc - EntityNPC
	--
	--Optional args:
	--
	-- * npcType - EntityType
	-- * npcVariant - integer
	-- * npcSubType - integer
	POST_NPC_INIT_LATE = "POST_NPC_INIT_LATE",
	--Called whenever an npc's state changes.
	--
	--Params:
	--
	-- * npc - EntityNPC
	-- * oldState - integer
	-- * newState - integer
	--
	--Optional args:
	--
	-- * npcType - EntityType
	-- * npcVariant - integer
	-- * npcSubType - integer
	POST_NPC_STATE_CHANGED = "POST_NPC_STATE_CHANGED",

	--Called the first frame a slot is available.
	--
	--Params
	--
	-- * slot - Entity
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_INIT = "POST_SLOT_INIT",
	--Called from the `POST_UPDATE` callback for every slot in the room.
	--
	--Params
	--
	-- * slot - Entity
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_UPDATE = "POST_SLOT_UPDATE",
	--Called from the `POST_RENDER` callback for every slot in the room.
	--
	--Params
	--
	-- * slot - Entity
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_RENDER = "POST_SLOT_RENDER",
	--Called whenever an slot's sprite triggers its `Prize` or `Disappear` events.
	--
	--`Prize` is triggered by slot machines and beggars and `Disappear` is only triggered
	--by beggars when they pay out their item.
	--
	--Params
	--
	-- * slot - Entity
	-- * isDisappear - boolean
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_PRIZE = "POST_SLOT_PRIZE",
	--Called whenever an slot's animation changes.
	--
	--Params
	--
	-- * slot - Entity
	-- * oldAnimation - string
	-- * newAnimation - string
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_ANIMATION_CHANGED = "POST_SLOT_ANIMATION_CHANGED",
	--Called whenever an slot is destroyed.
	--
	--This can happen when a slot is destroyed by an explosion or
	--when a slot pays out with an item.
	--
	--Params
	--
	-- * slot - Entity
	-- * isPayingOut - boolean
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_DESTROYED = "POST_SLOT_DESTROYED",
	--Called whenever a slot's state changes.
	--
	--Params:
	--
	-- * slot - EntitySlot
	-- * oldState - integer
	-- * newState - integer
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	POST_SLOT_STATE_CHANGED = "POST_SLOT_STATE_CHANGED",
	--Called from the `PRE_PLAYER_COLLISION` callback whenever the
	--player collides with a slot.
	--
	--Params
	--
	-- * slot - Entity
	-- * player - EntityPlayer
	--
	--Optional args:
	--
	-- * slotVariant - SlotVariant
	-- * slotSubType - integer
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	--
	PRE_SLOT_COLLISION = "PRE_SLOT_COLLISION",

	--Called the first frame a tear is available. This is useful since the
	--`POST_TEAR_INIT` callback doesn't let you access all of the tear's attributes.
	--
	--Params:
	--
	-- * tear - EntityTear
	--
	--Optional args:
	--
	-- * tearVariant - TearVariant
	-- * tearSubType - integer
	POST_TEAR_INIT_LATE = "POST_TEAR_INIT_LATE",
	--Called the second frame a tear is available. This is useful since
	--incubus tears are not distinguishable until the second frame.
	--
	--Params:
	--
	-- * tear - EntityTear
	--
	--Optional args:
	--
	-- * tearVariant - TearVariant
	-- * tearSubType - integer
	POST_TEAR_INIT_VERY_LATE = "POST_TEAR_INIT_VERY_LATE",

	--Called whenever an item enters a player's item queue. i.e. when they
	--begin holding it.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * itemID - CollectibleType | TriketType
	-- * itemType - InventoryType
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * itemID - CollectibleType | TriketType
	-- * itemType - InventoryType
	PRE_ITEM_PICKUP = "PRE_ITEM_PICKUP",
	--Called whenever an item exits a player's item queue. i.e. when it enters
	--the player inventory.
	--
	--This callback will trigger for trinkets and collectibles, and if the collectible is
	--added through the console or code it won't trigger. For that use `POST_PLAYER_COLLECTIBLE_ADDED`.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * itemID - CollectibleType | TriketType
	-- * itemType - InventoryType
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * itemID - CollectibleType | TriketType
	-- * itemType - InventoryType
	POST_ITEM_PICKUP = "POST_ITEM_PICKUP",
	--Called whenever an item is added to a player's inventory.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * collectibleType - CollectibleType
	-- * firstTime - boolean
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * collectibleType - CollectibleType
	-- * firstTime - boolean
	POST_PLAYER_COLLECTIBLE_ADDED = "POST_PLAYER_COLLECTIBLE_ADDED",
	--Called whenever an item is removed from a player's inventory.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * collectibleType - CollectibleType
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * collectibleType - CollectibleType
	POST_PLAYER_COLLECTIBLE_REMOVED = "POST_PLAYER_COLLECTIBLE_REMOVED",
	--Called whenever a trinket is gulped to a player's inventory.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * trinketType - TrinketType
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * trinketType - TrinketType
	POST_PLAYER_GULPED_TRINKET_ADDED = "POST_PLAYER_GULPED_TRINKET_ADDED",
	--Called whenever a gulped trinket is removed from a player's inventory.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * trinketType - TrinketType
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * trinketType - TrinketType
	POST_PLAYER_GULPED_TRINKET_REMOVED = "POST_PLAYER_GULPED_TRINKET_REMOVED",
	--Called whenever a player transforms into esau jr.
	--
	--This is useful because the player doesn't actually tranform into esau
	--jr. until the next frame of using the item.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_ESAU_JR = "POST_ESAU_JR",
	--Called the first time a player transforms into esau jr in a run.
	--
	--This is useful because the esau jr.'s entity player is not accessible
	--before it is created.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_FIRST_ESAU_JR = "POST_FIRST_ESAU_JR",
	--Called whenever a T.Lazarus player uses flip.
	--
	--This is useful because the unlike the `POST_USE_ITEM` callback, this provides
	--the new lazarus player.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_FLIP = "POST_FLIP",
	--Called the first time a T.Lazarus player uses flip on a run.
	--
	--This is useful because there is no way of getting the flipped player entity
	--before actually using the Flip item.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_FIRST_FLIP = "POST_FIRST_FLIP",
	--Called whenever the player's health changes.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * healthType - HealthType
	-- * oldAmount - integer
	-- * newAmount - integer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * healthType - HealthType
	POST_PLAYER_HEALTH_CHANGED = "POST_PLAYER_HEALTH_CHANGED",
	--Called whenever the player's type changes, via the Clicker item for example.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * oldPlayerType - PlayerType
	-- * newPlayerType - PlayerType
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * oldPlayerType - PlayerType
	POST_PLAYER_TYPE_CHANGED = "POST_PLAYER_TYPE_CHANGED",
	--Called from the `POST_PLAYER_INIT` callback, the first time it's called for each player.
	--
	--Params:
	--
	-- * player - EntityPlayer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	POST_PLAYER_INIT_FIRST = "POST_PLAYER_INIT_FIRST",
	--Called the first frame a player is available. This is useful since the
	--`POST_PLAYER_INIT` callback doesn't let you access all of the player's attributes.
	--
	--Params:
	--
	-- * player - EntityPlayer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	POST_PLAYER_INIT_LATE = "POST_PLAYER_INIT_LATE",
	--Called whenever a bone club (EntityType.ENTITY_KNIFE, KnifeVariant.BONE_CLUB)
	--plays any of it's swing animations.
	--
	--Params:
	--
	-- * boneClub - EntityKnife
	POST_BONE_SWING = "POST_BONE_SWING",
	--Called whenever a player's holy mantle effect count decreases.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * oldHolyMantleNum - integer
	-- * newHolyMantleNum - integer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	POST_HOLY_MANTLE_REMOVED = "POST_HOLY_MANTLE_REMOVED",
	--Called from the `ENTITY_TAKE_DMG` callback when a player takes
	--damage that would kill them.
	--
	--This function takes into account vanilla revive items and
	--using The Bible on Satan.
	--
	--Return false to avoid the fatal damage.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * amount - number
	-- * damageFlags - DamageFlag
	-- * source - EntityRef
	-- * countdown - integer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	POST_PLAYER_FATAL_DAMAGE = "POST_PLAYER_FATAL_DAMAGE",
	--Called whenever the player purchases an item.
	--
	--Internally this detects whenever a player starts holding
	--an item and searches for any pickups with a non-zero price that
	--no longer exist.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * purchasedPickup - EntityPickup
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * pickupVariant - PickupVariant
	-- * pickupSubType - integer
	POST_PURCHASE = "POST_PURCHASE",
	--Called whenever a player uses the spikes in a sacrifice room.
	--
	--Return false to avoid the damage.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * numSacrifices - integer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	POST_SACRIFICE = "POST_SACRIFICE",
	--Called whenever a player gains a transformation.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * transformation - PlayerForm
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * transformation - PlayerForm
	POST_TRANSFORMATION_GAINED = "POST_TRANSFORMATION_GAINED",
	--Called whenever a player loses a transformation.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * transformation - PlayerForm
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * transformation - PlayerForm
	POST_TRANSFORMATION_LOST = "POST_TRANSFORMATION_LOST",
	--Called whenever a player loses charge on their active item.
	--
	--This is useful because throwable items don't actually discharge
	--until they are thrown.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * collectibleType - CollectibleType
	-- * activeSlot - ActiveSlot
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	-- * collectibleType - CollectibleType
	POST_ITEM_DISCHARGE = "POST_ITEM_DISCHARGE",
	--Called when a player is about to exit the berserk state and will
	--die when it ends.
	--
	--Params:
	--
	-- * player - EntityPlayer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	PRE_BERSERK_DEATH = "PRE_BERSERK_DEATH",

	--Called when a new Grid Entity is created, either from the
	--`NEW_ROOM_REORDERED` callback or from the `POST_UPDATE` callback,
	--when a new Grid Entity is created mid-way through the room
	--
	--Params:
	--
	-- * gridEntity - GridEntity
	-- * createdMidWay - boolean
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	POST_GRID_ENTITY_INIT = "POST_GRID_ENTITY_INIT",
	--Called from the `POST_UPDATE` callback for each Grid Entity in the room.
	--
	--Params:
	--
	-- * gridEntity - GridEntity
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	POST_GRID_ENTITY_UPDATE = "POST_GRID_ENTITY_UPDATE",
	--Called from the `POST_RENDER` callback for each Grid Entity in the room.
	--
	--Params:
	--
	-- * gridEntity - GridEntity
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	POST_GRID_ENTITY_RENDER = "POST_GRID_ENTITY_RENDER",
	--Called whenever an entity collides with a Grid Entity.
	--
	--Params:
	--
	-- * gridEntity - GridEntity
	-- * collider - Entity
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	-- * colliderType - EntityType
	-- * colliderVariant - integer
	-- * colliderSubType - integer
	POST_GRID_COLLISION = "POST_GRID_COLLISION",
	--Called whenever a Grid Entity's state changes.
	--
	--Params:
	--
	-- * gridEntity - GridEntity
	-- * oldState - integer
	-- * newState - integer
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	POST_GRID_ENTITY_STATE_CHANGED = "POST_GRID_ENTITY_STATE_CHANGED",
	--Called when a Grid Entity changes into an state that represents it's broken.
	--
	--Params:
	--
	-- * gridEntity - GridEntity
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	POST_GRID_ENTITY_BROKEN = "POST_GRID_ENTITY_BROKEN",
	--Called when a Grid Entity is removed.
	--
	--Params:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	-- * gridIndex - integer
	--
	--Optional args:
	--
	-- * gridEntityType - GridEntityType
	-- * gridEntityVariant - integer
	POST_GRID_ENTITY_REMOVED = "POST_GRID_ENTITY_REMOVED",

	--Called from the `GRID_ENTITY_UPDATE` callback for each door.
	--
	--Params:
	--
	-- * door - GridEntityDoor
	--
	--Optional args:
	--
	-- * doorVariant - DoorVariant
	POST_DOOR_UPDATE = "POST_DOOR_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each door.
	--
	--Params:
	--
	-- * door - GridEntityDoor
	--
	--Optional args:
	--
	-- * doorVariant - DoorVariant
	POST_DOOR_RENDER = "POST_DOOR_RENDER",
	--Called from the `GRID_ENTITY_UPDATE` callback for each pit.
	--
	--Params:
	--
	-- * pit - GridEntityPit
	--
	--Optional args:
	--
	-- * pitVariant - integer
	POST_PIT_UPDATE = "POST_PIT_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each pit.
	--
	--Params:
	--
	-- * pit - GridEntityPit
	--
	--Optional args:
	--
	-- * pitVariant - integer
	POST_PIT_RENDER = "POST_PIT_RENDER",
	--Called from the `GRID_ENTITY_UPDATE` callback for each poop.
	--
	--Params:
	--
	-- * poop - GridEntityPoop
	--
	--Optional args:
	--
	-- * poopVariant - PoopGridEntityVariant
	POST_POOP_UPDATE = "POST_POOP_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each poop.
	--
	--Params:
	--
	-- * poop - GridEntityPoop
	--
	--Optional args:
	--
	-- * poopVariant - PoopGridEntityVariant
	POST_POOP_RENDER = "POST_POOP_RENDER",
	--Called from the `GRID_ENTITY_UPDATE` callback for each pressure plate.
	--
	--Params:
	--
	-- * pressurePlate - GridEntityPressurePlate
	--
	--Optional args:
	--
	-- * pressurePlateVariant - PressurePlateVariant
	POST_PRESSURE_PLATE_UPDATE = "POST_PRESSURE_PLATE_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each pressure plate.
	--
	--Params:
	--
	-- * pressurePlate - GridEntityPressurePlate
	--
	--Optional args:
	--
	-- * pressurePlateVariant - PressurePlateVariant
	POST_PRESSURE_PLATE_RENDER = "POST_PRESSURE_PLATE_RENDER",
	--Called from the `GRID_ENTITY_UPDATE` callback for each rock.
	--
	--Params:
	--
	-- * rock - GridEntityRock
	--
	--Optional args:
	--
	-- * rockType - GridEntityType
	-- * rockVariant - integer
	POST_ROCK_UPDATE = "POST_ROCK_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each rock.
	--
	--Params:
	--
	-- * rock - GridEntityRock
	--
	--Optional args:
	--
	-- * rockType - GridEntityType
	-- * rockVariant - integer
	POST_ROCK_RENDER = "POST_ROCK_RENDER",
	--Called from the `GRID_ENTITY_UPDATE` callback for each spike.
	--
	--Params:
	--
	-- * spikes - GridEntitySpikes
	--
	--Optional args:
	--
	-- * spikesVariant - integer
	POST_SPIKES_UPDATE = "POST_SPIKES_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each spike.
	--
	--Params:
	--
	-- * spikes - GridEntitySpikes
	--
	--Optional args:
	--
	-- * spikesVariant - integer
	POST_SPIKES_RENDER = "POST_SPIKES_RENDER",
	--Called from the `GRID_ENTITY_UPDATE` callback for each TNT.
	--
	--Params:
	--
	-- * tnt - GridEntityTNT
	--
	--Optional args:
	--
	-- * tntVariant - integer
	POST_TNT_UPDATE = "POST_TNT_UPDATE",
	--Called from the `GRID_ENTITY_RENDER` callback for each TNT.
	--
	--Params:
	--
	-- * tnt - GridEntityTNT
	--
	--Optional args:
	--
	-- * tntVariant - integer
	POST_TNT_RENDER = "POST_TNT_RENDER",

	--Called when a player enters the radius of activation of a
	--dice floor.
	--
	--Params:
	--
	-- * player - EntityPlayer
	-- * diceFloorType - DiceFloorSubType
	--
	--Optional args:
	--
	-- * diceFloorType - DiceFloorSubType
	POST_DICE_ROOM_ACTIVATED = "POST_DICE_ROOM_ACTIVATED",

	--Similar to the vanilla `POST_GAME_STARTED` callback, but fires in the
	--expected order in relation to the new level/room callbacks.
	--
	--GAME_STARTED_REORDERED -> NEW_LEVEL_REORDERED -> NEW_ROOM_REORDERED
	--
	--Params:
	--
	-- * isContinued - boolean
	POST_GAME_STARTED_REORDERED = "POST_GAME_STARTED_REORDERED",
	--Fires last in relation to the other reordered callbacks, so you
	--can execute code after all other run initialization code has finished.
	--
	--Params:
	--
	-- * isContinued - boolean
	POST_GAME_STARTED_REORDERED_LAST = "POST_GAME_STARTED_REORDERED_LAST",
	--Similar to the vanilla `POST_NEW_LEVEL` callback, but fires in the
	--expected order in relation to the new game/room callbacks.
	--
	--GAME_STARTED_REORDERED -> NEW_LEVEL_REORDERED -> NEW_ROOM_REORDERED
	POST_NEW_LEVEL_REORDERED = "POST_NEW_LEVEL_REORDERED",
	--Similar to the vanilla `POST_NEW_ROOM` callback, but fires in the
	--expected order in relation to the new game/level callbacks.
	--
	--GAME_STARTED_REORDERED -> NEW_LEVEL_REORDERED -> NEW_ROOM_REORDERED
	POST_NEW_ROOM_REORDERED = "POST_NEW_ROOM_REORDERED",
	--Similar to the vanilla `POST_PEFFECT_UPDATE` callback but only gets called
	--after the run initialization callbacks have been executed.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_PEFFECT_UPDATE_REORDERED = "POST_PEFFECT_UPDATE_REORDERED",
	--Similar to the vanilla `POST_PLAYER_RENDER` callback but only gets called
	--after the run initialization callbacks have been executed.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_PLAYER_RENDER_REORDERED = "POST_PLAYER_RENDER_REORDERED",
	--Similar to the vanilla `POST_PLAYER_UPDATE` callback but only gets called
	--after the run initialization callbacks have been executed.
	--
	--Params:
	--
	-- * player - EntityPlayer
	POST_PLAYER_UPDATE_REORDERED = "POST_PLAYER_UPDATE_REORDERED",

	--Called from the `POST_NEW_ROOM` or `PRE_ENTITY_SPAWN` callback where being in a
	--new room is detected.
	--
	--This is useful because the `POST_NEW_ROOM` callback only gets called after all the
	--entities have been updated once.
	POST_NEW_ROOM_EARLY = "POST_NEW_ROOM_EARLY",

	--Called from the `POST_RENDER` callback, when a player is about to enter a
	--trapdoor/heaven door.
	--
	--Doesn't get called when reloading the current room (Forget Me Now) or on the
	--first floor of the run
	--
	--Params:
	--
	-- * player - EntityPlayer
	PRE_NEW_LEVEL = "PRE_NEW_LEVEL",

	--Called before a player is about to die. Return a `CustomReviveType` to make the
	--player revive.
	--
	--To make the player play an animation after they revive, use the `POST_CUSTOM_REVIVE` callback.
	--
	--If a callback returns a non nil value, the rest will be skipped.
	--
	--Params:
	--
	-- * player - EntityPlayer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	PRE_CUSTOM_REVIVE = "PRE_CUSTOM_REVIVE",

	--Called after a player revives via the `PRE_CUSTOM_REVIVE` callback. Use it to
	--make the reviving player play a custom animation or to give them a custom amount of health.
	--
	--Params:
	--
	-- * player - EntityPlayer
	--
	--Optional args:
	--
	-- * playerType - PlayerType
	-- * playerVariant - PlayerVariant
	POST_CUSTOM_REVIVE = "POST_CUSTOM_REVIVE",

	--Called after an item is selected from a custom item pool.
	--Return a new collectible type to change the returned collectible.
	--
	--If a non nil value is returned, it'll become the `selectedCollectible` argument
	--for next callbacks.
	--
	--Params:
	--
	-- * selectedCollectible - CollectibleType
	-- * customItemPool - integer
	-- * decrease - boolean
	-- * seed - integer
	--
	--Optional args:
	--
	-- * collectibleType - CollectibleType
	-- * customItemPoolType - integer
	POST_GET_COLLECTIBLE_CUSTOM_ITEM_POOL = "POST_GET_COLLECTIBLE_CUSTOM_ITEM_POOL"
}

---Used in the `PRE_CUSTOM_REVIVE` callback to determine how the player should revive.
---@enum CustomReviveType
TSIL.Enums.CustomReviveType = {
    --Internally uses Soul of Lazarus
    SAME_ROOM = 0,

    --Internally uses 1 UP
    PREVIOUS_ROOM = 1
}

---@enum DebugMode
TSIL.Enums.DebugMode = {
    ENTITY_POSITIONS = 1,
    ---Shows grid and grid collision values
    SHOW_GRID = 2,
    INFINITE_HP = 3,
    HIGH_DAMAGE = 4,
    ROOM_INFO = 5,
    SHOW_HITBOX = 6,
    SHOW_DAMAGE_VALUES = 7,
    INFINITE_CHARGE = 8,
    HIGH_LUCK = 9,
    QUICK_KILL = 10,
    ---Shows grid and grid indexes
    SHOW_GRID_INFO = 11,
    PLAYER_INFO = 12,
    SHOW_GRID_COLLISION = 13,
    SHOW_LUA_MEMORY_USAGE = 14
}

---@enum LockState
TSIL.Enums.LockState = {
    LOCKED = 0,
    UNLOCKED = 1,
}

---@enum PoopState
TSIL.Enums.PoopState = {
    UNDAMAGED = 0,
    ONE_QUARTER_DAMAGED = 250,
    TWO_QUARTERS_DAMAGED = 500,
    THREE_QUARTERS_DAMAGED = 750,
    DESTROYED = 1000
}

---@enum RockState
TSIL.Enums.RockState = {
    UNBROKEN = 1,
    BROKEN = 2,
    EXPLODING = 3,
    HALF_BROKEN = 4
}

---@enum SpiderWebState
TSIL.Enums.SpiderWebState = {
    UNBROKEN = 0,
    BROKEN = 1,
}

---@enum TNTState
TSIL.Enums.TNTState = {
    UNDAMAGED = 0,
    ONE_QUARTER_DAMAGED = 1,
    TWO_QUARTERS_DAMAGED = 2,
    THREE_QUARTERS_DAMAGED = 3,
    EXPLODED = 4
}

---@enum PitState
TSIL.Enums.PitState = {
	NORMAL = 0,

	--- Pits can become filled when nearby rocks are bombed into them.
	---
	--- Note that the ladder collectible does not change the state to this.
	FILLED = 1,
}

---@enum StairsVariant
TSIL.Enums.StairsVariant = {
	NORMAL = 0,
	GREAT_GIDEON = 1,
	SECRET_SHOP = 2,
	PASSAGE_TO_BEGGINING_OF_FLOOR = 3,
	NULL = 4
}

---@enum PitVariant
TSIL.Enums.PitVariant = {
	NORMAL = 0,
	FISSURE_SPAWNER = 16
}

---@enum RockVariant
TSIL.Enums.RockVariant = {
	NORMAL = 0,
	EVENT = 1
}

---@enum StatueVariant
TSIL.Enums.StatueVariant = {
	DEVIL = 0,
	ANGEL = 1
}

---@enum TrapdoorVariant
TSIL.Enums.TrapdoorVariant = {
	NORMAL = 0,
	VOID_PORTAL = 1
}

---@enum GridEntityXMLType
TSIL.Enums.GridEntityXMLType = {
	DECORATION = 0,
	ROCK = 1000,
	ROCK_BOMB = 1001,
	ROCK_ALT = 1002,
	ROCK_TINTED = 1003,
	ROCK_ALT_2 = 1008,
	ROCK_EVENT = 1009,
	ROCK_SPIKED = 1010,
	ROCK_GOLD = 1011,
	TNT = 1300,
	FIREPLACE = 1400,
	RED_FIREPLACE = 1410,
	POOP_RED = 1490,
	POOP_RAINBOW = 1494,
	POOP_CORN = 1495,
	POOP_GOLDEN = 1496,
	POOP_BLACK = 1497,
	POOP_WHITE = 1498,
	POOP_GIGA = 1499,
	POOP = 1500,
	POOP_CHARMING = 1501,
	BLOCK = 1900,
	PILLAR = 1901,
	SPIKES = 1930,
	SPIKES_ON_OFF = 1931,
	SPIDER_WEB = 1940,
	WALL = 1999,
	PIT = 3000,
	FISSURE_SPAWNER = 3001,
	PIT_EVENT = 3009,
	LOCK = 4000,
	PRESSURE_PLATE = 4500,
	STATUE_DEVIL = 5000,
	STATUE_ANGEL = 5001,
	TELEPORTER = 6100,
	TRAPDOOR = 9000,
	CRAWL_SPACE = 9100,
	GRAVITY = 10000
}

---@enum InventoryType
TSIL.Enums.InventoryType = {
	COLLECTIBLE = 1,
	TRINKET = 2
}

---@enum ItemConfigTag
TSIL.Enums.ItemConfigTag = {
  --[[
    Dead things (for the Parasite unlock).
   
    Equal to "dead" in "items_metadata.xml".
   
    1 << 0 (1)
   --]]
   DEAD = 1 << 0,

   --[[
     Syringes (for Little Baggy and the Spun transformation).
    
     Equal to "syringe" in "items_metadata.xml".
    
     1 << 1 (2)
    --]]
   SYRINGE = 1 << 1,
 
   --[[
     Mom's things (for Mom's Contact and the Yes Mother transformation).
    
     Equal to "mom" in "items_metadata.xml".
    
     1 << 2 (4)
    --]]
   MOM = 1 << 2,
 
   --[[
     Technology items (for the Technology Zero unlock).
    
     Equal to "tech" in "items_metadata.xml".
    
     1 << 3 (8)
    --]]
   TECH = 1 << 3,
 
   --[[
     Battery items (for the Jumper Cables unlock).
    
     Equal to "battery" in "items_metadata.xml".
    
     1 << 4 (16)
    --]]
   BATTERY = 1 << 4,
 
   --[[
     Guppy items (Guppy transformation).
    
     Equal to "guppy" in "items_metadata.xml".
    
     1 << 5 (32)
    --]]
   GUPPY = 1 << 5,
 
   --[[
     Fly items (Beelzebub transformation).
    
     Equal to "fly" in "items_metadata.xml".
    
     1 << 6 (64)
    --]]
   FLY = 1 << 6,
 
   --[[
     Bob items (Bob transformation).
    
     Equal to "bob" in "items_metadata.xml".
    
     1 << 7 (128)
    --]]
   BOB = 1 << 7,
 
   --[[
     Mushroom items (Fun Guy transformation).
    
     Equal to "mushroom" in "items_metadata.xml".
    
     1 << 8 (256)
    --]]
   MUSHROOM = 1 << 8,
 
    --[[
     Baby items (Conjoined transformation).
    
     Equal to "mushroom" in "items_metadata.xml".
    
     1 << 9 (512)
    --]]
   BABY = 1 << 9,
 
    --[[
     Angel items (Seraphim transformation).
    
     Equal to "angel" in "items_metadata.xml".
    
     1 << 10 (1024)
    --]]
   ANGEL = 1 << 10,
 
    --[[
     Devil items (Leviathan transformation).
    
     Equal to "devil" in "items_metadata.xml".
    
     1 << 11 (2048)
    --]]
   DEVIL = 1 << 11,
 
    --[[
     Poop items (Oh Shit transformation).
    
     Equal to "poop" in "items_metadata.xml".
    
     1 << 12 (4096)
    --]]
   POOP = 1 << 12,
 
    --[[
     Book items (Book Worm transformation).
    
     Equal to "book" in "items_metadata.xml".
    
     1 << 13 (8192)
    --]]
   BOOK = 1 << 13,
 
    --[[
     Spider items (Spider Baby transformation).
    
     Equal to "spider" in "items_metadata.xml".
    
     1 << 14 (16384)
    --]]
   SPIDER = 1 << 14,
 
    --[[
     Quest item (cannot be rerolled or randomly obtained).
    
     Equal to "quest" in "items_metadata.xml".
    
     1 << 15 (32768)
    --]]
   QUEST = 1 << 15,
 
    --[[
     Can be spawned by Monster Manual.
    
     Equal to "monstermanual" in "items_metadata.xml".
    
     1 << 16 (65536)
    --]]
   MONSTER_MANUAL = 1 << 16,
 
    --[[
     Cannot appear in Greed Mode.
    
     Equal to "nogreed" in "items_metadata.xml".
    
     1 << 17 (131072)
    --]]
   NO_GREED = 1 << 17,
 
    --[[
     Food item (for Binge Eater).
    
     Equal to "food" in "items_metadata.xml".
    
     1 << 18 (262144)
    --]]
   FOOD = 1 << 18,
 
    --[[
     Tears up item (for Lachryphagy unlock detection).
    
     Equal to "tearsup" in "items_metadata.xml".
    
     1 << 19 (524288)
    --]]
   TEARS_UP = 1 << 19,
 
    --[[
     Whitelisted item for Tainted Lost.
    
     Equal to "offensive" in "items_metadata.xml".
    
     1 << 20 (1048576)
    --]]
   OFFENSIVE = 1 << 20,
 
    --[[
     Blacklisted item for Keeper & Tainted Keeper.
    
     Equal to "nokeeper" in "items_metadata.xml".
    
     1 << 21 (2097152)
    --]]
   NO_KEEPER = 1 << 21,
 
    --[[
     Blacklisted item for The Lost's Birthright.
    
     Equal to "nolostbr" in "items_metadata.xml".
    
     1 << 22 (4194304)
    --]]
   NO_LOST_BR = 1 << 22,
 
    --[[
     Star themed items (for the Planetarium unlock).
    
     Equal to "stars" in "items_metadata.xml".
    
     1 << 23 (8388608)
    --]]
   STARS = 1 << 23,
 
    --[[
     Summonable items (for Tainted Bethany).
    
     Equal to "summonable" in "items_metadata.xml".
    
     1 << 24 (16777216)
    --]]
   SUMMONABLE = 1 << 24,
 
    --[[
     Can't be obtained in Cantripped challenge.
    
     Equal to "nocantrip" in "items_metadata.xml".
    
     1 << 25 (33554432)
    --]]
   NO_CANTRIP = 1 << 25,
 
    --[[
     Active items that have wisps attached to them (automatically set).
    
     Not equal to any particular tag in "items_metadata.xml". Instead, this is set for all of the
     items in the "wisps.xml" file.
    
     1 << 26 (67108864)
    --]]
   WISP = 1 << 26,
 
    --[[
     Unique familiars that cannot be duplicated.
    
     Equal to "uniquefamiliar" in "items_metadata.xml".
    
     1 << 27 (134217728)
    --]]
   UNIQUE_FAMILIAR = 1 << 27,
 
    --[[
     Items that should not be obtainable in challenges.
    
     Equal to "nochallenge" in "items_metadata.xml".
    
     1 << 28 (268435456)
    --]]
   NO_CHALLENGE = 1 << 28,
 
    --[[
     Items that should not be obtainable in daily runs.
    
     Equal to "nodaily" in "items_metadata.xml".
    
     1 << 29 (536870912)
    --]]
   NO_DAILY = 1 << 29,
 
    --[[
     Items that should be shared between Tainted Lazarus' forms.
    
     This is different from `LAZ_SHARED_GLOBAL` in that it does apply stat changes from the item for
     both characters.
    
     Equal to "lazarusshared" in "items_metadata.xml".
    
     1 << 30 (1073741824)
    --]]
   LAZ_SHARED = 1 << 30,
 
    --[[
     Items that should be shared between Tainted Lazarus' forms but only through global checks (such
     as `PlayerManager = =HasCollectible`).
    
     This is different from `LAZ_SHARED` in that it does not apply stat changes from the item for
     both characters.
    
     Equal to "lazarussharedglobal" in "items_metadata.xml".
    
     1 << 31 (2147483648)
    --]]
   LAZ_SHARED_GLOBAL = 1 << 31,
 
    --[[
     Items that will not be a random starting item for Eden and Tainted Eden.
    
     Equal to "noeden" in "items_metadata.xml".
    
     1 << 32 (4294967296)
    --]]
   NO_EDEN = 1 << 32,
}

---@enum PillEffectType
TSIL.Enums.PillEffectType = {
    NULL = -1,
    POSITIVE = 0,
    NEGATIVE = 1,
    NEUTRAL = 2,
    MODDED = 3
}

---@enum PlayerHeartType
TSIL.Enums.PlayerHeartType = {
    RED = 1,
    SOUL = 2,
    ETERNAL = 3,
    BLACK = 4,
    GOLDEN = 5,
    BONE = 6,
    ROTTEN = 7,
    BROKEN = 8,
    MAX_HEARTS = 9,
}

---@enum ProjectilesMode
TSIL.Enums.ProjectilesMode = {
	ONE_PROJECTILE = 0,

	-- Uses params.Spread.
	TWO_PROJECTILES = 1,

	-- Uses params.Spread.
	THREE_PROJECTILES = 2,

	-- Uses params.Spread.
	THREE_PROJECTILES_SPREAD = 3,

	-- Uses params.Spread.
	FOUR_PROJECTILES = 4,

	-- Uses params.Spread.
	FIVE_PROJECTILES = 5,

	-- Uses velocity.X as speed.
	FOUR_PROJECTILES_PLUS_PATTERN = 6,

	-- Uses velocity.X as speed.
	FOUR_PROJECTILES_X_PATTERN = 7,

	-- Uses velocity.X as speed.
	EIGHT_PROJECTILES_STAR_PATTERN = 8,

	---- Uses `velocity.X` as speed.
	---- Uses `velocity.Y` as N.
	---- To fire in an arc, use params.FireDirectionLimit and params.DotProductLimit.
	N_PROJECTILES_IN_CIRCLE = 9,
}

---@enum SerializationBrand
TSIL.Enums.SerializationBrand = {
    BIT_SET_128 = "__BIT_SET_128",
    COLOR = "__COLOR",
    K_COLOR = "__K_COLOR",
    RNG = "__RNG",
    VECTOR = "__VECTOR",
    TABLE_WITH_NUMBER_KEYS = "__TABLE_WITH_NUMBER_KEYS"
}

---@enum SerializationType
TSIL.Enums.SerializationType = {
    NONE = 1,
    SERIALIZE = 2,
    DESERIALIZE = 3,
}

---@enum CopyableIsaacAPIClassType
TSIL.Enums.CopyableIsaacAPIClassType = {
    BIT_SET_128 = "BitSet128",
    COLOR = "Color",
    K_COLOR = "KColor",
    RNG = "RNG",
    VECTOR = "Vector",
}

---@enum ShockwaveSoundMode
TSIL.Enums.ShockwaveSoundMode = {
    NO_SOUND = 0,
    ON_CREATE = 1,
    LOOP = 2
}

---@enum StageID
TSIL.Enums.StageID = {
    SPECIAL_ROOMS = 0,
    BASEMENT = 1,
    CELLAR = 2,
    BURNING_BASEMENT = 3,
    CAVES = 4,
    CATACOMBS = 5,
    FLOODED_CAVES = 6,
    DEPTHS = 7,
    NECROPOLIS = 8,
    DANK_DEPTHS = 9,
    WOMB = 10,
    UTERO = 11,
    SCARRED_WOMB = 12,
    BLUE_WOMB = 13,
    SHEOL = 14,
    CATHEDRAL = 15,
    DARK_ROOM = 16,
    CHEST = 17,
    VOID = 26,
    DOWNPOUR = 27,
    DROSS = 28,
    MINES = 29,
    ASHPIT = 30,
    MAUSOLEUM = 31,
    GEHENNA = 32,
    CORPSE = 33,
    MORTIS = 34,
    HOME = 35,
    BACKWARDS = 36,
}

---@enum BlueFlySubType
--- For `EntityType.FAMILIAR` (3), `FamiliarVariant.BLUE_FLY` (43). 
TSIL.Enums.BlueFlySubType = {
  -- A standard fly, like what you get from using Guppy's Head. 
  BLUE_FLY = 0,

  -- Red (explosive) 
  WRATH = 1,

  -- Green (poison) 
  PESTILENCE = 2,

  -- Yellow (slowing) 
  FAMINE = 3,

  -- Black (double-damage) 
  DEATH = 4,

  -- White 
  CONQUEST = 5,
}

---@enum DipFamiliarSubType
--- For `EntityType.FAMILIAR` (3), `FamiliarVariant.DIP` (201). 
TSIL.Enums.DipFamiliarSubType = {
  NORMAL = 0,
  RED = 1,
  CORNY = 2,
  GOLD = 3,
  RAINBOW = 4,
  BLACK = 5,
  WHITE = 6,
  STONE = 12,
  FLAMING = 13,
  STINKY = 14,
  BROWNIE = 20,
}

---@enum BloodClotSubType
--- For `EntityType.FAMILIAR` (3), `FamiliarVariant.BLOOD_BABY` (238). 
TSIL.Enums.BloodClotSubType = {
  RED = 0,
  SOUL = 1,
  BLACK = 2,
  ETERNAL = 3,
  GOLD = 4,
  BONE = 5,
  ROTTEN = 6,

  -- Spawned by the Blood Clot trinket; cannot be turned into health by Sumptorium. 
  RED_NO_SUMPTORIUM = 7,
}

---@enum PickupNullSubType
--- For `EntityType.PICKUP` (5), `PickupVariant.NULL` (0). 
TSIL.Enums.PickupNullSubType = {
  -- Has a chance to spawn any possible pickup, including collectibles. 
  ALL = 0,

  EXCLUDE_COLLECTIBLES_CHESTS = 1,
  EXCLUDE_COLLECTIBLES = 2,
  EXCLUDE_COLLECTIBLES_CHESTS_COINS = 3,
  EXCLUDE_COLLECTIBLES_TRINKETS_CHESTS = 4,
}

---@enum ChargerSubType
--- For `EntityType.CHARGER` (23), `ChargerVariant.CHARGER` (0). 
TSIL.Enums.ChargerSubType = {
  CHARGER = 0,
  MY_SHADOW = 1,
}

---@enum ConstantStoneShooterSubType
--- For `EntityType.CONSTANT_STONE_SHOOTER` (202),
--- `ConstantStoneShooterVariant.CONSTANT_STONE_SHOOTER` (0).
--- This is the same as the `Direction` enum.
TSIL.Enums.ConstantStoneShooterSubType = {
  LEFT = 0,
  UP = 1,
  RIGHT = 2,
  DOWN = 3,
}

---@enum MotherSubType
--- For `EntityType.MOTHER` (912), `MotherVariant.MOTHER_1` (0). 
TSIL.Enums.MotherSubType = {
  PHASE_1 = 0,
  PHASE_2 = 1,
}

---@enum BloodExplosionSubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.BLOOD_EXPLOSION` (2). 
TSIL.Enums.BloodExplosionSubType = {
  MEDIUM_WITH_LEFTOVER_BLOOD = 0,
  SMALL = 1,
  MEDIUM = 2,
  LARGE = 3,
  GIANT = 4,
  SWIRL = 5,
}

---@enum PoofSubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.POOF_1` (15). 
TSIL.Enums.PoofSubType = {
  NORMAL = 0,
  SMALL = 1,

  -- A sub-type of 2 appears to be the same thing as a sub-type of 0.

  LARGE = 3,
}

---@enum HeavenLightDoorSubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.HEAVEN_LIGHT_DOOR` (39). 
TSIL.Enums.HeavenLightDoorSubType = {
  HEAVEN_DOOR = 0,
  MOONLIGHT = 1,
}

---@enum GibSubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.BLOOD_PARTICLE` (5).
TSIL.Enums.GibSubType = {
  BLOOD = 0,
  BONE = 1,
  GUT = 2,
  EYE = 3,
}

---@enum DiceFloorSubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.DICE_FLOOR` (76). 
TSIL.Enums.DiceFloorSubType = {
  -- Has the same effect as using a D4. 
  ONE_PIP = 0,

  -- Has the same effect as using a D20. 
  TWO_PIP = 1,

  --[[
    Rerolls all pickups and trinkets on the floor, including items inside of a shop, excluding
    collectibles.
    ]]--
  THREE_PIP = 2,

  -- Rerolls all collectibles on the floor. 
  FOUR_PIP = 3,

  -- Has the same effect as using a Forget Me Now. 
  FIVE_PIP = 4,

  -- Has the combined effect of a 1-pip, 3-pip and 4-pip dice room. 
  SIX_PIP = 5,
}

---@enum TallLadderSubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.TALL_LADDER` (156). 
TSIL.Enums.TallLadderSubType = {
  TALL_LADDER = 0,
  STAIRWAY = 1,
}

---@enum PurgatorySubType
--- For `EntityType.EFFECT` (1000), `EffectVariant.PURGATORY` (189). 
TSIL.Enums.PurgatorySubType = {
  RIFT = 0,
  GHOST = 1,
}

---@enum VariablePersistenceMode
TSIL.Enums.VariablePersistenceMode = {
	--The save manager won't reset your variable
	NONE = 1,

	--The save manager will restore the default on a new room
	RESET_ROOM = 2,
	--The save manager will restore the default on a new level
	RESET_LEVEL = 3,
	--The save manager will restore the default on a new run
	RESET_RUN = 4,

	--The save manager will remove your variable on a new room
	REMOVE_ROOM = 5,
	--The save manager will remove your variable on a new level
	REMOVE_LEVEL = 6,
	--The save manager will remove your variable on a new run
	REMOVE_RUN = 7
}

---@enum GaperVariant
---- For `EntityType.ENTITY_GAPER` (10).
TSIL.Enums.GaperVariant = {
  FROWNING_GAPER = 0,
  GAPER = 1,
  FLAMING_GAPER = 2,
  ROTTEN_GAPER = 3,
}

---@enum GusherVariant
--- For `EntityType.ENTITY_GUSHER` (11). 
TSIL.Enums.GusherVariant = {
  GUSHER = 0,
  PACER = 1,
}

---@enum PooterVariant
--- For `EntityType.ENTITY_POOTER` (14). 
TSIL.Enums.PooterVariant = {
  POOTER = 0,
  SUPER_POOTER = 1,
  TAINTED_POOTER = 2,
}

---@enum ClottyVariant
--- For `EntityType.ENTITY_CLOTTY` (15). 
TSIL.Enums.ClottyVariant = {
  CLOTTY = 0,
  CLOT = 1,
  BLOB = 2,
  GRILLED_CLOTTY = 3,
}

---@enum MulliganVariant
--- For `EntityType.ENTITY_MULLIGAN` (16). 
TSIL.Enums.MulliganVariant = {
  MULLIGAN = 0,
  MULLIGOON = 1,
  MULLIBOOM = 2,
}

---@enum ShopKeeperVariant
--- For `EntityType.ENTITY_SHOPKEEPER` (17). 
TSIL.Enums.ShopkeeperVariant = {
  SHOPKEEPER = 0,
  SECRET_ROOM_KEEPER = 1,
  ERROR_ROOM_KEEPER = 2,
  SPECIAL_SHOPKEEPER = 3,
  SPECIAL_SECRET_ROOM_KEEPER = 4,
}

---@enum LarryJrVariant
--- For `EntityType.ENTITY_LARRY_JR` (19). 
TSIL.Enums.LarryJrVariant = {
  LARRY_JR = 0,
  THE_HOLLOW = 1,
  TUFF_TWIN = 2,
  THE_SHELL = 3,
}

---@enum HiveVariant
--- For `EntityType.ENTITY_HIVE` (22). 
TSIL.Enums.HiveVariant = {
  HIVE = 0,
  DROWNED_HIVE = 1,
  HOLY_MULLIGAN = 2,
  TAINTED_MULLIGAN = 3,
}

---@enum ChargerVariant
--- For `EntityType.ENTITY_CHARGER` (23). 
TSIL.Enums.ChargerVariant = {
  CHARGER = 0,
  DROWNED_CHARGER = 1,
  DANK_CHARGER = 2,
  CARRION_PRINCESS = 3,
}

---@enum GlobinVariant
--- For `EntityType.ENTITY_GLOBIN` (24). 
TSIL.Enums.GlobinVariant = {
  GLOBIN = 0,
  GAZING_GLOBIN = 1,
  DANK_GLOBIN = 2,
  CURSED_GLOBIN = 3,
}

---@enum BoomFlyVariant
--- For `EntityType.ENTITY_BOOM_FLY` (25). 
TSIL.Enums.BoomFlyVariant = {
  BOOM_FLY = 0,
  RED_BOOM_FLY = 1,
  DROWNED_BOOM_FLY = 2,
  DRAGON_FLY = 3,
  BONE_FLY = 4,
  SICK_BOOM_FLY = 5,
  TAINTED_BOOM_FLY = 6,
}

---@enum MawVariant
--- For `EntityType.ENTITY_MAW` (26). 
TSIL.Enums.MawVariant = {
  MAW = 0,
  RED_MAW = 1,
  PSYCHIC_MAW = 2,
}

---@enum HostVariant
--- For `EntityType.ENTITY_HOST` (27). 
TSIL.Enums.HostVariant = {
  HOST = 0,
  RED_HOST = 1,
  HARD_HOST = 2,
}

---@enum ChubVariant
--- For `EntityType.ENTITY_CHUB` (28). 
TSIL.Enums.ChubVariant = {
  CHUB = 0,
  CHAD = 1,
  CARRION_QUEEN = 2,
}

---@enum HopperVariant
--- For `EntityType.ENTITY_HOPPER` (29). 
TSIL.Enums.HopperVariant = {
  HOPPER = 0,
  TRITE = 1,
  EGGY = 2,
  TAINTED_HOPPER = 3,
}

---@enum BoilVariant
--- For `EntityType.ENTITY_BOIL` (30). 
TSIL.Enums.BoilVariant = {
  BOIL = 0,
  GUT = 1,
  SACK = 2,
}

---@enum SpittyVariant
--- For `EntityType.ENTITY_SPITTY` (31). 
TSIL.Enums.SpittyVariant = {
  SPITTY = 0,
  TAINTED_SPITTY = 1,
}

---@enum FireplaceVariant
--- For `EntityType.ENTITY_FIREPLACE` (33).
--- Also see the `FireplaceGridEntityVariant` enum, which is different and used for the grid entity
--- version.
TSIL.Enums.FireplaceVariant = {
  NORMAL = 0,
  RED = 1,
  BLUE = 2,
  PURPLE = 3,
  WHITE = 4,
  MOVEABLE = 10,
  COAL = 11,
  MOVEABLE_BLUE = 12,
  MOVEABLE_PURPLE = 13,
}

---@enum LeaperVariant
--- For `EntityType.ENTITY_LEAPER` (34). 
TSIL.Enums.LeaperVariant = {
  LEAPER = 0,
  STICKY_LEAPER = 1,
}

---@enum MrMawVariant
--- For `EntityType.ENTITY_MR_MAW` (35). 
TSIL.Enums.MrMawVariant = {
  MR_MAW = 0,
  MR_MAW_HEAD = 1,
  MR_RED_MAW = 2,
  MR_RED_MAW_HEAD = 3,
  MR_MAW_NECK = 10,
}

---@enum BabyVariant
--- For `EntityType.ENTITY_BABY` (38). 
TSIL.Enums.BabyVariant = {
  BABY = 0,
  ANGELIC_BABY = 1,
  ULTRA_PRIDE_BABY = 2,
  WRINKLY_BABY = 3,
}

---@enum VisVariant
--- For `EntityType.ENTITY_VIS` (39). 
TSIL.Enums.VisVariant = {
  VIS = 0,
  DOUBLE_VIS = 1,
  CHUBBER = 2,
  SCARRED_DOUBLE_VIS = 3,
  CHUBBER_PROJECTILE = 22,
}

---@enum GutsVariant
--- For `EntityType.ENTITY_GUTS` (40). 
TSIL.Enums.GutsVariant = {
  GUTS = 0,
  SCARRED_GUTS = 1,
  SLOG = 2,
}

---@enum KnightVariant
--- For `EntityType.ENTITY_KNIGHT` (41). 
TSIL.Enums.KnightVariant = {
  KNIGHT = 0,
  SELFLESS_KNIGHT = 1,
  LOOSE_KNIGHT = 2,
  BRAINLESS_KNIGHT = 3,
  BLACK_KNIGHT = 4,
}

---@enum GrimaceVariant
--- For `EntityType.ENTITY_GRIMACE` (42). 
TSIL.Enums.GrimaceVariant = {
  STONE_GRIMACE = 0,
  VOMIT_GRIMACE = 1,
  TRIPLE_GRIMACE = 2,
}

---@enum Monstro2Variant
--- For `EntityType.ENTITY_MONSTRO_2` (43). 
TSIL.Enums.Monstro2Variant = {
  MONSTRO_2 = 0,
  GISH = 1,
}

---@enum PokyVariant
--- For `EntityType.ENTITY_POKY` (44). 
TSIL.Enums.PokyVariant = {
  POKY = 0,
  SLIDE = 1,
}

---@enum MomVariant
--- For `EntityType.ENTITY_MOM` (45). 
TSIL.Enums.MomVariant = {
  MOM = 0,
  STOMP = 10,
}

---@enum SlothVariant
--- For `EntityType.ENTITY_SLOTH` (46). 
TSIL.Enums.SlothVariant = {
  SLOTH = 0,
  SUPER_SLOTH = 1,
  ULTRA_PRIDE = 2,
}

---@enum LustVariant
--- For `EntityType.ENTITY_LUST` (47). 
TSIL.Enums.LustVariant = {
  LUST = 0,
  SUPER_LUST = 1,
}

---@enum WrathVariant
--- For `EntityType.ENTITY_WRATH` (48). 
TSIL.Enums.WrathVariant = {
  WRATH = 0,
  SUPER_WRATH = 1,
}

---@enum GluttonyVariant
--- For `EntityType.ENTITY_GLUTTONY` (49). 
TSIL.Enums.GluttonyVariant = {
  GLUTTONY = 0,
  SUPER_GLUTTONY = 1,
}

---@enum GreedVariant
--- For `EntityType.ENTITY_GREED` (50). 
TSIL.Enums.GreedVariant = {
  GREED = 0,
  SUPER_GREED = 1,
}

---@enum EnvyVariant
--- For `EntityType.ENTITY_ENVY` (51). 
TSIL.Enums.EnvyVariant = {
  ENVY = 0,
  SUPER_ENVY = 1,
  ENVY_BIG = 10,
  SUPER_ENVY_BIG = 11,
  ENVY_MEDIUM = 20,
  SUPER_ENVY_MEDIUM = 21,
  ENVY_SMALL = 30,
  SUPER_ENVY_SMALL = 31,
}

---@enum PrideVariant
--- For `EntityType.ENTITY_PRIDE` (52). 
TSIL.Enums.PrideVariant = {
  PRIDE = 0,
  SUPER_PRIDE = 1,
}

---@enum DopleVariant
--- For `EntityType.ENTITY_DOPLE` (53). 
TSIL.Enums.DopleVariant = {
  DOPLE = 0,
  EVIL_TWIN = 1,
}

---@enum LeechVariant
--- For `EntityType.ENTITY_LEECH` (55). 
TSIL.Enums.LeechVariant = {
  LEECH = 0,
  KAMIKAZE_LEECH = 1,
  HOLY_LEECH = 2,
}

---@enum MembrainVariant
--- For `EntityType.ENTITY_MEMBRAIN` (57). 
TSIL.Enums.MemBrainVariant = {
  MEMBRAIN = 0,
  MAMA_GUTS = 1,
  DEAD_MEAT = 2,
}

---@enum ParaBiteVariant
--- For `EntityType.ENTITY_PARA_BITE` (58). 
TSIL.Enums.ParaBiteVariant = {
  PARA_BITE = 0,
  SCARRED_PARA_BITE = 1,
}

---@enum EyeVariant
--- For `EntityType.ENTITY_EYE` (60). 
TSIL.Enums.EyeVariant = {
  EYE = 0,
  BLOODSHOT_EYE = 1,
  HOLY_EYE = 2,
}

---@enum SuckerVariant
--- For `EntityType.ENTITY_SUCKER` (61). 
TSIL.Enums.SuckerVariant = {
  SUCKER = 0,
  SPIT = 1,
  SOUL_SUCKER = 2,
  INK = 3,
  MAMA_FLY = 4,
  BULB = 5,
  BLOOD_FLY = 6,
  TAINTED_SUCKER = 7,
}

---@enum PinVariant
--- For `EntityType.ENTITY_PIN` (62). 
TSIL.Enums.PinVariant = {
  PIN = 0,
  SCOLEX = 1,
  FRAIL = 2,
  WORMWOOD = 3,
}

---@enum WarVariant
--- For `EntityType.ENTITY_WAR` (65). 
TSIL.Enums.WarVariant = {
  WAR = 0,
  CONQUEST = 1,
  WAR_WITHOUT_HORSE = 2,
}

---@enum DeathVariant
--- For `EntityType.ENTITY_DEATH` (66). 
TSIL.Enums.DeathVariant = {
  DEATH = 0,
  DEATH_SCYTHE = 10,
  DEATH_HORSE = 20,
  DEATH_WITHOUT_HORSE = 30,
}

---@enum DukeVariant
--- For `EntityType.ENTITY_DUKE` (67). 
TSIL.Enums.DukeVariant = {
  DUKE_OF_FLIES = 0,
  THE_HUSK = 1,
}

---@enum PeepVariant
--- For `EntityType.ENTITY_PEEP` (68). 
TSIL.Enums.PeepVariant = {
  PEEP = 0,
  BLOAT = 1,
  PEEP_EYE = 10,
  BLOAT_EYE = 11,
}

---@enum LokiVariant
--- For `EntityType.ENTITY_LOKI` (69). 
TSIL.Enums.LokiVariant = {
  LOKI = 0,
  LOKII = 1,
}

---@enum FistulaVariant
--- For:
---     - `EntityType.ENTITY_FISTULA_BIG` (71)
---     - `EntityType.ENTITY_FISTULA_MEDIUM` (72)
---     - `EntityType.ENTITY_FISTULA_SMALL` (73)
TSIL.Enums.FistulaVariant = {
  FISTULA = 0,
  TERATOMA = 1,
}

---@enum MomsHeartVariant
--- For `EntityType.ENTITY_MOMS_HEART` (78). 
TSIL.Enums.MomsHeartVariant = {
  MOMS_HEART = 0,
  IT_LIVES = 1,
  MOMS_GUTS = 2,
}

---@enum GeminiVariant
--- For `EntityType.ENTITY_GEMINI` (79). 
TSIL.Enums.GeminiVariant = {
  GEMINI = 0,
  STEVEN = 1,
  BLIGHTED_OVUM = 2,
  GEMINI_BABY = 10,
  STEVEN_BABY = 11,
  BLIGHTED_OVUM_BABY = 12,
  UMBILICAL_CORD = 20,
}

---@enum FallenVariant
--- For `EntityType.ENTITY_FALLEN` (81). 
TSIL.Enums.FallenVariant = {
  FALLEN = 0,
  KRAMPUS = 1,
}

---@enum SatanVariant
--- For `EntityType.ENTITY_SATAN` (84). 
TSIL.Enums.SatanVariant = {
  SATAN = 0,
  STOMP = 10,
}

---@enum GurgleVariant
--- For `EntityType.ENTITY_GURGLE` (87). 
TSIL.Enums.GurgleVariant = {
  GURGLE = 0,
  CRACKLE = 1,
}

---@enum WalkingBoilVariant
--- For `EntityType.ENTITY_WALKING_BOIL` (88). 
TSIL.Enums.WalkingBoilVariant = {
  WALKING_BOIL = 0,
  WALKING_GUT = 1,
  WALKING_SACK = 2,
}

---@enum HeartVariant
--- For `EntityType.ENTITY_HEART` (92). 
TSIL.Enums.HeartVariant = {
  HEART = 0,
  HALF_HEART = 1,
}

---@enum MaskVariant
--- For `EntityType.ENTITY_MASK` (93). 
TSIL.Enums.MaskVariant = {
  MASK = 0,
  MASK_2 = 1,
}

---@enum WidowVariant
--- For `EntityType.ENTITY_WIDOW` (100). 
TSIL.Enums.WidowVariant = {
  WIDOW = 0,
  THE_WRETCHED = 1,
}

---@enum DaddyLongLegsVariant
--- For `EntityType.ENTITY_DADDY_LONG_LEGS` (101). 
TSIL.Enums.DaddyLongLegsVariant = {
  DADDY_LONG_LEGS = 0,
  TRIACHNID = 1,
}

---@enum IsaacVariant
--- For `EntityType.ENTITY_ISAAC` (102). 
TSIL.Enums.IsaacVariant = {
  ISAAC = 0,
  BLUE_BABY = 1,
  BLUE_BABY_HUSH = 2,
}

---@enum ConstantStoneShooterVariant
--- For `EntityType.ENTITY_CONSTANT_STONE_SHOOTER` (202). 
TSIL.Enums.ConstantStoneShooterVariant = {
  CONSTANT_STONE_SHOOTER = 0,
  CROSS_STONE_SHOOTER = 10,
  CROSS_STONE_SHOOTER_ALWAYS_ON = 11,
}

---@enum BabyLongLegsVariant
--- For `EntityType.ENTITY_BABY_LONG_LEGS` (206). 
TSIL.Enums.BabyLongLegsVariant = {
  BABY_LONG_LEGS = 0,
  SMALL_BABY_LONG_LEGS = 1,
}

---@enum CrazyLongLegsVariant
--- For `EntityType.ENTITY_CRAZY_LONG_LEGS` (207). 
TSIL.Enums.CrazyLongLegsVariant = {
  CRAZY_LONG_LEGS = 0,
  SMALL_CRAZY_LONG_LEGS = 1,
}

---@enum FattyVariant
--- For `EntityType.ENTITY_FATTY` (208). 
TSIL.Enums.FattyVariant = {
  FATTY = 0,
  PALE_FATTY = 1,
  FLAMING_FATTY = 2,
}

---@enum DeathsHeadVariant
--- For `EntityType.ENTITY_DEATHS_HEAD` (212). 
TSIL.Enums.DeathsHeadVariant = {
  DEATHS_HEAD = 0,
  DANK_DEATHS_HEAD = 1,
  CURSED_DEATHS_HEAD = 2,
  BRIMSTONE_DEATHS_HEAD = 3,
  RED_SKULL = 4,
}

---@enum SwingerVariant
--- For `EntityType.ENTITY_SWINGER` (216). 
TSIL.Enums.SwingerVariant = {
  SWINGER = 0,
  SWINGER_HEAD = 1,
  SWINGER_NECK = 10,
}

---@enum DipVariant
--- For `EntityType.ENTITY_DIP` (217). 
TSIL.Enums.DipVariant = {
  DIP = 0,
  CORN = 1,
  BROWNIE_CORN = 2,
  BIG_CORN = 3,
}

---@enum SquirtVariant
--- For `EntityType.ENTITY_SQUIRT` (220). 
TSIL.Enums.SquirtVariant = {
  SQUIRT = 0,
  DANK_SQUIRT = 1,
}

---@enum SkinnyVariant
--- For `EntityType.ENTITY_SKINNY` (226). 
TSIL.Enums.SkinnyVariant = {
  SKINNY = 0,
  ROTTY = 1,
  CRISPY = 2,
}

---@enum BonyVariant
--- For `EntityType.ENTITY_BONY` (227). 
TSIL.Enums.BonyVariant = {
  BONY = 0,
  HOLY_BONY = 1,
}

---@enum HomunculusVariant
--- For `EntityType.ENTITY_HOMUNCULUS` (228). 
TSIL.Enums.HomunculusVariant = {
  HOMUNCULUS = 0,
  HOMUNCULUS_CORD = 10,
}

---@enum TumorVariant
--- For `EntityType.ENTITY_TUMOR` (229). 
TSIL.Enums.TumorVariant = {
  TUMOR = 0,
  PLANETOID = 1,
}

---@enum NerveEndingVariant
--- For `EntityType.ENTITY_NERVE_ENDING` (231). 
TSIL.Enums.NerveEndingVariant = {
  NERVE_ENDING = 0,
  NERVE_ENDING_2 = 1,
}

---@enum GurglingVariant
--- For `EntityType.ENTITY_GURGLING` (237). 
TSIL.Enums.GurglingVariant = {
  GURGLING = 0,
  GURGLING_BOSS = 1,
  TURDLING = 2,
}

---@enum GrubVariant
--- For `EntityType.ENTITY_GRUB` (239). 
TSIL.Enums.GrubVariant = {
  GRUB = 0,
  CORPSE_EATER = 1,
  CARRION_RIDER = 2,
}

---@enum WallCreepVariant
--- For `EntityType.ENTITY_WALL_CREEP` (240). 
TSIL.Enums.WallCreepVariant = {
  WALL_CREEP = 0,
  SOY_CREEP = 1,
  RAG_CREEP = 2,
  TAINTED_SOY_CREEP = 3,
}

---@enum RageCreepVariant
--- For `EntityType.ENTITY_RAGE_CREEP` (241). 
TSIL.Enums.RageCreepVariant = {
  RAGE_CREEP = 0,
  SPLIT_RAGE_CREEP = 1,
}

---@enum RoundWormVariant
--- For `EntityType.ENTITY_ROUND_WORM` (244). 
TSIL.Enums.RoundWormVariant = {
  ROUND_WORM = 0,
  TUBE_WORM = 1,
  TAINTED_ROUND_WORM = 2,
  TAINTED_TUBE_WORM = 3,
}

---@enum PoopEntityVariant
--- For `EntityType.ENTITY_POOP` (245). 
TSIL.Enums.PoopEntityVariant = {
  NORMAL = 0,
  GOLDEN = 1,
  STONE = 11,
  CORNY = 12,
  BURNING = 13,
  STINKY = 14,
  BLACK = 15,
  HOLY = 16,
}

---@enum RaglingVariant
--- For `EntityType.ENTITY_RAGLING` (246). 
TSIL.Enums.RaglingVariant = {
  RAGLING = 0,
  RAG_MANS_RAGLING = 1,
}

---@enum BegottenVariant
--- For `EntityType.ENTITY_BEGOTTEN` (251). 
TSIL.Enums.BegottenVariant = {
  BEGOTTEN = 0,
  BEGOTTEN_CHAIN = 10,
}

---@enum ConjoinedFattyVariant
--- For `EntityType.ENTITY_CONJOINED_FATTY` (257). 
TSIL.Enums.ConjoinedFattyVariant = {
  CONJOINED_FATTY = 0,
  BLUE_CONJOINED_FATTY = 1,
}

---@enum HauntVariant
--- For `EntityType.ENTITY_THE_HAUNT` (260). 
TSIL.Enums.HauntVariant = {
  HAUNT = 0,
  LIL_HAUNT = 10,
}

---@enum DingleVariant
--- For `EntityType.ENTITY_DINGLE` (261). 
TSIL.Enums.DingleVariant = {
  DINGLE = 0,
  DANGLE = 1,
}

---@enum MamaGurdyVariant
--- For `EntityType.ENTITY_MAMA_GURDY` (266). 
TSIL.Enums.MamaGurdyVariant = {
  MAMA_GURDY = 0,
  LEFT_HAND = 1,
  RIGHT_HAND = 2,
}

---@enum PolycephalusVariant
--- For `EntityType.ENTITY_POLYCEPHALUS` (269). 
TSIL.Enums.PolycephalusVariant = {
  POLYCEPHALUS = 0,
  THE_PILE = 1,
}

---@enum AngelVariant
--- For `EntityType.ENTITY_URIEL` (271) and `EntityType.ENTITY_GABRIEL` (272). 
TSIL.Enums.AngelVariant = {
  NORMAL = 0,
  FALLEN = 1,
}

---@enum LambVariant
--- For `EntityType.ENTITY_THE_LAMB` (273). 
TSIL.Enums.LambVariant = {
  LAMB = 0,
  BODY = 10,
}

---@enum MegaSatanVariant
--- For `EntityType.ENTITY_MEGA_SATAN` (274) and `EntityType.ENTITY_MEGA_SATAN_2` (275). 
TSIL.Enums.MegaSatanVariant = {
  MEGA_SATAN = 0,
  MEGA_SATAN_RIGHT_HAND = 1,
  MEGA_SATAN_LEFT_HAND = 2,
}

---@enum PitfallVariant
--- For `EntityType.ENTITY_PITFALL` (291). 
TSIL.Enums.PitfallVariant = {
  PITFALL = 0,
  SUCTION_PITFALL = 1,
  TELEPORT_PITFALL = 2,
}

---@enum MoveableTNTVariant
--- For `EntityType.ENTITY_MOVABLE_TNT` (292). 
TSIL.Enums.MoveableTNTVariant = {
  MOVEABLE_TNT = 0,
  MINE_CRAFTER = 1,
}

---@enum UltraCoinVariant
--- For `EntityType.ENTITY_ULTRA_COIN` (293). 
TSIL.Enums.UltraCoinVariant = {
  SPINNER = 0,
  KEY = 1,
  BOMB = 2,
  HEART = 3,
}

---@enum StoneyVariant
--- For `EntityType.ENTITY_STONEY` (302). 
TSIL.Enums.StoneyVariant = {
  STONEY = 0,
  CROSS_STONEY = 10,
}

---@enum PortalVariant
--- For `EntityType.ENTITY_PORTAL` (306). 
TSIL.Enums.PortalVariant = {
  PORTAL = 0,
  LIL_PORTAL = 1,
}

---@enum LeperVariant
--- For `EntityType.ENTITY_LEPER` (310). 
TSIL.Enums.LeperVariant = {
  LEPER = 0,
  LEPER_FLESH = 1,
}

---@enum MrMineVariant
--- For `EntityType.ENTITY_MR_MINE` (311). 
TSIL.Enums.MrMineVariant = {
  MR_MINE = 0,
  MR_MINE_NECK = 10,
}

---@enum LittleHornVariant
--- For `EntityType.ENTITY_LITTLE_HORN` (404). 
TSIL.Enums.LittleHornVariant = {
  LITTLE_HORN = 0,
  DARK_BALL = 1,
}

---@enum RagManVariant
--- For `EntityType.ENTITY_RAG_MAN` (405). 
TSIL.Enums.RagManVariant = {
  RAG_MAN = 0,
  RAG_MAN_HEAD = 1,
}

---@enum UltraGreedVariant
--- For `EntityType.ENTITY_ULTRA_GREED` (406). 
TSIL.Enums.UltraGreedVariant = {
  ULTRA_GREED = 0,
  ULTRA_GREEDIER = 1,
}

---@enum RagMegaVariant
--- For `EntityType.ENTITY_RAG_MEGA` (409). 
TSIL.Enums.RagMegaVariant = {
  RAG_MEGA = 0,
  PURPLE_BALL = 1,
  REBIRTH_PILLAR = 2,
}

---@enum BigHornVariant
--- For `EntityType.ENTITY_BIG_HORN` (411). 
TSIL.Enums.BigHornVariant = {
  BIG_HORN = 0,
  SMALL_HOLE = 1,
  BIG_HOLE = 2,
}

---@enum BloodPuppyVariant
--- For `EntityType.ENTITY_BLOOD_PUPPY` (802). 
TSIL.Enums.BloodPuppyVariant = {
  SMALL = 0,
  LARGE = 1,
}

---@enum SubHorfVariant
--- For `EntityType.ENTITY_SUB_HORF` (812). 
TSIL.Enums.SubHorfVariant = {
  SUB_HORF = 0,
  TAINTED_SUB_HORF = 1,
}

---@enum PoltyVariant
--- For `EntityType.ENTITY_POLTY` (816). 
TSIL.Enums.PoltyVariant = {
  POLTY = 0,
  KINETI = 1,
}

---@enum PreyVariant
--- For `EntityType.ENTITY_PREY` (817). 
TSIL.Enums.PreyVariant = {
  PREY = 0,
  MULLIGHOUL = 1,
}

---@enum RockSpiderVariant
--- For `EntityType.ENTITY_ROCK_SPIDER` (818). 
TSIL.Enums.RockSpiderVariant = {
  ROCK_SPIDER = 0,
  TINTED_ROCK_SPIDER = 1,
  COAL_SPIDER = 2,
}

---@enum FlyBombVariant
--- For `EntityType.ENTITY_FLY_BOMB` (819). 
TSIL.Enums.FlyBombVariant = {
  FLY_BOMB = 0,
  ETERNAL_FLY_BOMB = 1,
}

---@enum DannyVariant
--- For `EntityType.ENTITY_DANNY` (820). 
TSIL.Enums.DannyVariant = {
  DANNY = 0,
  COAL_BOY = 1,
}

---@enum GyroVariant
--- For `EntityType.ENTITY_GYRO` (824). 
TSIL.Enums.GyroVariant = {
  GYRO = 0,
  GRILLED_GYRO = 1,
}

---@enum FacelessVariant
--- For `EntityType.ENTITY_FACELESS` (827). 
TSIL.Enums.FacelessVariant = {
  FACELESS = 0,
  TAINTED_FACELESS = 1,
}

---@enum MoleVariant
--- For `EntityType.ENTITY_MOLE` (829). 
TSIL.Enums.MoleVariant = {
  MOLE = 0,
  TAINTED_MOLE = 1,
}

---@enum BigBonyVariant
--- For `EntityType.ENTITY_BIG_BONY` (830). 
TSIL.Enums.BigBonyVariant = {
  BIG_BONY = 0,
  BIG_BONE = 10,
}

---@enum GuttedFattyVariant
--- For `EntityType.ENTITY_GUTTED_FATTY` (831). 
TSIL.Enums.GuttedFattyVariant = {
  GUTTED_FATTY = 0,
  GUTTY_FATTY_EYE = 10,
  FESTERING_GUTS = 20,
}

---@enum ExorcistVariant
--- For `EntityType.ENTITY_EXORCIST` (832). 
TSIL.Enums.ExorcistVariant = {
  EXORCIST = 0,
  FANATIC = 1,
}

---@enum WhipperVariant
--- For `EntityType.ENTITY_WHIPPER` (834). 
TSIL.Enums.WhipperVariant = {
  WHIPPER = 0,
  SNAPPER = 1,
  FLAGELLANT = 2,
}

---@enum PeeperFattyVariant
--- For `EntityType.ENTITY_PEEPER_FATTY` (835). 
TSIL.Enums.PeeperFattyVariant = {
  PEEPING_FATTY = 0,
  PEEPING_FATTY_EYE = 10,
}

---@enum RevenantVariant
--- For `EntityType.ENTITY_REVENANT` (841). 
TSIL.Enums.RevenantVariant = {
  REVENANT = 0,
  QUAD_REVENANT = 1,
}

---@enum CanaryVariant
--- For `EntityType.ENTITY_CANARY` (843). 
TSIL.Enums.CanaryVariant = {
  CANARY = 0,
  FOREIGNER = 1,
}

---@enum Gaper2Variant
--- For `EntityType.ENTITY_GAPER_L2` (850). 
TSIL.Enums.Gaper2Variant = {
  GAPER = 0,
  HORF = 1,
  GUSHER = 2,
}

---@enum Charger2Variant
--- For `EntityType.ENTITY_CHARGER_L2` (855). 
TSIL.Enums.Charger2Variant = {
  CHARGER = 0,
  ELLEECH = 1,
}

---@enum EvisVariant
--- For `EntityType.ENTITY_EVIS` (865). 
TSIL.Enums.EvisVariant = {
  EVIS = 0,
  EVIS_GUTS = 10,
}

---@enum DarkEsauVariant
--- For `EntityType.ENTITY_DARK_ESAU` (866). 
TSIL.Enums.DarkEsauVariant = {
  DARK_ESAU = 0,
  PIT = 1,
}

---@enum DumpVariant
--- For `EntityType.ENTITY_DUMP` (876). 
TSIL.Enums.DumpVariant = {
  DUMP = 0,
  DUMP_HEAD = 1,
}

---@enum NeedleVariant
--- For `EntityType.ENTITY_NEEDLE` (881). 
TSIL.Enums.NeedleVariant = {
  NEEDLE = 0,
  PASTY = 1,
}

---@enum CultistVariant
--- For `EntityType.ENTITY_CULTIST` (885). 
TSIL.Enums.CultistVariant = {
  CULTIST = 0,
  BLOOD_CULTIST = 1,
  BONE_TRAP = 10,
}

---@enum VisFattyVariant
--- For `EntityType.ENTITY_VIS_FATTY` (886). 
TSIL.Enums.VisFattyVariant = {
  VIS_FATTY = 0,
  FETAL_DEMON = 1,
}

---@enum GoatVariant
--- For `EntityType.ENTITY_GOAT` (891). 
TSIL.Enums.GoatVariant = {
  GOAT = 0,
  BLACK_GOAT = 1,
}

---@enum VisageVariant
--- For `EntityType.ENTITY_VISAGE` (903). 
TSIL.Enums.VisageVariant = {
  VISAGE = 0,
  VISAGE_MASK = 1,
  VISAGE_CHAIN = 10,
  VISAGE_PLASMA = 20,
}

---@enum SirenVariant
--- For `EntityType.ENTITY_SIREN` (904). 
TSIL.Enums.SirenVariant = {
  SIREN = 0,
  SIREN_SKULL = 1,
  SIREN_HELPER_PROJECTILE = 10,
}

---@enum ScourgeVariant
--- For `EntityType.ENTITY_SCOURGE` (909). 
TSIL.Enums.ScourgeVariant = {
  SCOURGE = 0,
  SCOURGE_CHAIN = 10,
}

---@enum ChimeraVariant
--- For `EntityType.ENTITY_CHIMERA` (910). 
TSIL.Enums.ChimeraVariant = {
  CHIMERA = 0,
  CHIMERA_BODY = 1,
  CHIMERA_HEAD = 2,
}

---@enum RotgutVariant
--- For `EntityType.ENTITY_ROTGUT` (911). 
TSIL.Enums.RotgutVariant = {
  PHASE_1_HEAD = 0,
  PHASE_2_MAGGOT = 1,
  PHASE_3_HEART = 2,
}

---@enum MotherVariant
--- For `EntityType.ENTITY_MOTHER` (912). 
TSIL.Enums.MotherVariant = {
  --[[
    The body that is attached to the top of the screen in phase 1. During phase 2, it remains alive
    but is inactive.
    ]]--
  MOTHER_1 = 0,

  -- The circular body that moves around in phase 2. 
  MOTHER_2 = 10,

  BALL = 100,
}

---@enum SingeVariant
--- For `EntityType.ENTITY_SINGE` (915). 
TSIL.Enums.SingeVariant = {
  SINGE = 0,
  SINGE_BALL = 1,
}

---@enum RaglichVariant
--- For `EntityType.ENTITY_RAGLICH` (919). 
TSIL.Enums.RaglichVariant = {
  RAGLICH = 0,
  RAGLICH_ARM = 1,
}

---@enum ClutchVariant
--- For `EntityType.ENTITY_CLUTCH` (921). 
TSIL.Enums.ClutchVariant = {
  CLUTCH = 0,
  CLUTCH_ORBITAL = 1,
}

---@enum DogmaVariant
--- For `EntityType.ENTITY_DOGMA` (950). 
TSIL.Enums.DogmaVariant = {
  DOGMA_PHASE_1 = 0,
  TV = 1,
  ANGEL_PHASE_2 = 2,
  ANGEL_BABY_UNUSED = 10,
}

---@enum BeastVariant
--- For `EntityType.ENTITY_BEAST` (951). 
TSIL.Enums.BeastVariant = {
  BEAST = 0,
  STALACTITE = 1,
  ROCK_PROJECTILE = 2,
  SOUL = 3,
  ULTRA_FAMINE = 10,
  ULTRA_FAMINE_FLY = 11,
  ULTRA_PESTILENCE = 20,
  ULTRA_PESTILENCE_FLY = 21,
  ULTRA_PESTILENCE_MAGGOT = 22,
  ULTRA_PESTILENCE_FLY_BALL = 23,
  ULTRA_WAR = 30,
  ULTRA_WAR_BOMB = 31,
  ULTRA_DEATH = 40,
  ULTRA_DEATH_SCYTHE = 41,
  ULTRA_DEATH_HEAD = 42,
  BACKGROUND_BEAST = 100,
  BACKGROUND_FAMINE = 101,
  BACKGROUND_PESTILENCE = 102,
  BACKGROUND_WAR = 103,
  BACKGROUND_DEATH = 104,
}

---@enum GenericPropVariant
--- For `EntityType.ENTITY_GENERIC_PROP` (960). 
TSIL.Enums.GenericPropVariant = {
  GENERIC_PROP = 0,
  MOMS_DRESSER = 1,
  MOMS_VANITY = 2,
  COUCH = 3,
  TV = 4,
}

--- Helper function to add and remove familiars based on a target amount that you specify.
---
--- This is a convenience wrapper around the `EntityPlayer.CheckFamiliar` method. Use this helper
--- function instead so that you do not have to retrieve the `ItemConfigItem` and so that you do not
--- specify an incorrect RNG object. (The vanilla method is bugged in that it does not increment the
--- RNG object; see the documentation of the method for more details.)
---
--- This function is meant to be called in the `EVALUATE_CACHE` callback (when the cache flag is
--- equal to `CacheFlag.FAMILIARS`).
---
--- Note that this function is only meant to be used in special circumstances where the familiar
--- count is completely custom and does not correspond to the amount of collectibles. For the general
--- case, use the `checkFamiliarFromCollectibles` helper function instead.
---
--- Note that this will spawn familiars with a completely random `InitSeed`. When calculating random
--- events for this familiar, you should use a data structure that maps familiar `InitSeed` to RNG
--- objects that are initialized based on the seed from `EntityPlayer.GetCollectibleRNG(collectibleType)`.
---@param player EntityPlayer
---@param collectibleType CollectibleType
---@param targetCount integer
---@param familiarVariant FamiliarVariant
---@param familiarSubtype integer? @Optional. The SubType of the familiar to spawn or remove. If not specified, it will seach for existing familiars of all SubTypes, and spawn new familiars with a SubType of 0.
---@return EntityFamiliar[]
function TSIL.Familiars.CheckFamiliar(player, collectibleType, targetCount, familiarVariant, familiarSubtype)
end

--- Helper function to add and remove familiars based on the amount of associated collectibles that a
--- player has.
---
--- Use this helper function instead of invoking the `EntityPlayer.CheckFamiliar` method directly so
--- that the target count is handled automatically.
---
--- This function is meant to be called in the `EVALUATE_CACHE` callback (when the cache flag is
--- equal to `CacheFlag.FAMILIARS`).
---
--- Use this function when the amount of familiars should be equal to the amount of associated
--- collectibles that the player has (plus any extras from having used Box of Friends or Monster
--- Manual). If you instead need to have a custom amount of familiars, use the `checkFamiliars`
--- function instead.
---
--- Note that this will spawn familiars with a completely random `InitSeed`. When calculating random
--- events for this familiar, you should use a data structure that maps familiar `InitSeed` to RNG
--- objects that are initialized based on the seed from
--- `EntityPlayer.GetCollectibleRNG(collectibleType)`.
---@param player EntityPlayer
---@param collectibleType CollectibleType
---@param familiarVariant FamiliarVariant
---@param familiarSubtype integer? @ Optional. The SubType of the familiar to spawn or remove. If not specified, it will seach for existing familiars of all SubTypes, and spawn new familiars with a SubType of 0.
---@return EntityFamiliar[]
function TSIL.Familiars.CheckFamiliarFromCollectibles(player, collectibleType, familiarVariant, familiarSubtype)
end

--- Helper function to get all familiars that belong to a given player.
---@param player EntityPlayer
---@return EntityFamiliar[]
function TSIL.Familiars.GetPlayerFamiliars(player)
end

--- Helper function to get the corresponding "Siren Helper" entity for a stolen familiar.
---
--- When The Siren boss "steals" your familiars, a hidden "Siren Helper" entity is spawned to control
--- each familiar stolen. (Checking for the presence of this entity seems to be the only way to
--- detect when the Siren steals a familiar.)
---@param familiar EntityFamiliar
---@return Entity? @ Returns the hidden "Siren Helper" entity corresponding to the given familiar, if it exists. Returns nil otherwise.
function TSIL.Familiars.GetSirenHelper(familiar)
end

--- Helper function to check if the given familiar is being controlled by The Siren boss.
---@param familiar EntityFamiliar
---@return boolean
function TSIL.Familiars.IsFamiliarStolenBySiren(familiar)
end

--- Helper function to convert the grid entity type found in a room XML file to the corresponding
--- grid entity type and variant normally used by the game. For example, a rock is represented as
--- 1000.0 in a room XML file, but `GridEntityType.GRID_ROCK` is equal to 2.
---@param gridEntityXMLType GridEntityXMLType
---@param gridEntityXMLVariant integer
---@return {type : GridEntityType, variant : integer}
function TSIL.GridEntities.ConvertXMLGridEntityType(gridEntityXMLType, gridEntityXMLVariant)
end

--- Returns all the entities that are colliding with a given grid entity.
--- 
--- Note that this function won't work in the `POST_NEW_ROOM` callback, since
--- entities don't have collision yet.
---@param gridEntity GridEntity
---@return Entity[]
function TSIL.GridEntities.GetCollidingEntitiesWithGridEntity(gridEntity)
end

--- Returns a list with all grid entities in the room.
---@param ... GridEntityType
---@return GridEntity[]
function TSIL.GridEntities.GetGridEntities(...)
end

--- Returns a map with all grid entities in the room indexed by their grid index.
---@param ... GridEntityType
---@return table<integer, GridEntity>
function TSIL.GridEntities.GetGridEntitiesMap(...)
end

--- Helper function to get all grid entities around a grid index, not including itself.
---@param gridIndex GridEntity
---@return GridEntity[]
function TSIL.GridEntities.GetSurroundingGridEntities(gridIndex)
end

--- Helper function to get the grid index of the top left wall.
---@return integer
function TSIL.GridEntities.GetTopLeftWallGridIndex()
end

--- Helper function to get the top left wall grid entity.
---@return GridEntity
function TSIL.GridEntities.GetTopLeftWall()
end

--- Helper function to check if a GridEntity is able to be broken with an explosion.
---@param gridEntity GridEntity
---@return boolean
function TSIL.GridEntities.IsGridEntityBreakableByExplosion(gridEntity)
end

--- Helper function to see if the given GridEntity is in its respective broken state.
--- 
--- Note that `GridEntityType.GRID_LOCK` will turn to being broken before the actual
--- collision is turned off.
---@param gridEntity GridEntity
---@return boolean
function TSIL.GridEntities.IsGridEntityBroken(gridEntity)
end

--- Helper function to remove a grid entity by providing the GridEntity or the grid index.
---
--- If removing a Devil or Angel Statue it'll also remove the associated effect.
---@param gridEntityOrGridIndex GridEntity | integer
---@param immediate boolean? @Default: true | Whether or not to use Repentogon's RemoveGridEntityImmediate. Vanilla RemoveGridEntity doesn't update the room, making it impossible to spawn a new grid entity on the same frame.
function TSIL.GridEntities.RemoveGridEntity(gridEntityOrGridIndex, immediate)
end

--- Helper function to remove all grid entities from a given list.
---@param gridEntities GridEntity[]
---@param immediate boolean? @Default: true | Whether or not to use Repentogon's RemoveGridEntityImmediate. Vanilla RemoveGridEntity doesn't update the room, making it impossible to spawn a new grid entity on the same frame.
function TSIL.GridEntities.RemoveGridEntities(gridEntities, immediate)
end

--- Helper function to spawn a grid entity.
---
--- Use this instead of `Isaac.GridSpawn` as it handles:
--- - Walls and pits collision
--- - Removing existing grid entities
--- - Allows you to use the grid index or position
---@param gridEntityType GridEntityType
---@param gridEntityVariant integer
---@param gridIndexOrPosition Vector | integer
---@param force boolean? @Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntity?
function TSIL.GridEntities.SpawnGridEntity(gridEntityType, gridEntityVariant, gridIndexOrPosition, force)
end

--- Helper function to spawn a void portal.
---
--- This is more complicated than just spawning a trapdoor with the appropriate variant, as
--- it won't have the correct graphics and it won't lead to The Void.
---@param gridIndexOrPosition Vector | integer
---@param force boolean? @Default : true. Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntity?
function TSIL.GridEntities.SpawnVoidPortal(gridIndexOrPosition, force)
end

--- Helper function to spawn a giant poop.
--- 
--- Will return true if the poop has successfully spawned.
---@param topLeftGridIndexOrPosition Vector | integer @Where the top left corner of the poop will be placed.
---@param force boolean? @Default : true. Set this to true if you want to replace existing grid entities in the same tiles.
---@return boolean
function TSIL.GridEntities.SpawnGigaPoop(topLeftGridIndexOrPosition, force)
end

--- Helper function to get every legal grid index for the current room.
--- If `onlyInRoom` is set to true it will only return those that are actually in the room,
--- accounting for L shaped and small rooms.
---@param onlyInRoom boolean? @ Default: true
---@return integer[]
function TSIL.GridIndexes.GetAllGridIndexes(onlyInRoom)
end

--- Helper function to get all the grid indexes between two others.
---
--- Note that the two grid indexes need to be in the same column or row.
---@param gridIndex1 integer
---@param gridIndex2 integer
---@param roomShape RoomShape
---@return integer[]
function TSIL.GridIndexes.GetGridIndexesBetween(gridIndex1, gridIndex2, roomShape)
end

--- Helper function to get all the grid entities with type `GridEntityType.GRID_DECORATION` and the given variant.
---@param decorationVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityDecoration[]
function TSIL.GridSpecific.GetDecorations(decorationVariant)
end

--- Helper function to get all the grid entities with type `GridEntityType.GRID_FIREPLACE` and the given variant.
---
--- Keep in mind that fires are actually entities with on top of an invisible grid entity.
---@param fireVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityFire[]
function TSIL.GridSpecific.GetFires(fireVariant)
end

--- Helper function to get all the grid entities with type `GridEntityType.GRID_GRAVITY` and the given variant.
---@param gravityVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityGravity[]
function TSIL.GridSpecific.GetGravities(gravityVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_PIT` and the given variant.
---@param pitVariant PitVariant? @Default: -1. Which matches all variants.
---@return GridEntityPit[]
function TSIL.GridSpecific.GetPits(pitVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_POOP` and the given variant.
---@param poopVariant GridPoopVariant? @Default: -1. Which matches all variants.
---@return GridEntityPoop[]
function TSIL.GridSpecific.GetPoops(poopVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_PRESSURE_PLATE` and the given variant.
---@param pressurePlateVariant PressurePlateVariant? @Default: -1. Which matches all variants.
---@return GridEntityPressurePlate[]
function TSIL.GridSpecific.GetPressurePlates(pressurePlateVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_ROCK` and the given variant.
---@param rockVariant RockVariant? @Default: -1. Which matches all variants.
---@return GridEntityPoop[]
function TSIL.GridSpecific.GetRocks(rockVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_SPIKES` and the given variant.
---@param spikeVariant integer? @Default: -1. Which matches all variants.
---@return GridEntitySpikes[]
function TSIL.GridSpecific.GetSpikes(spikeVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_STAIRS` and the given variant.
---@param stairsVariant StairsVariant? @Default: -1. Which matches all variants.
---@return GridEntityStairs[]
function TSIL.GridSpecific.GetStairs(stairsVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_STATUE` and the given variant.
---@param statueVariant StatueVariant? @Default: -1. Which matches all variants.
---@return GridEntityStatue[]
function TSIL.GridSpecific.GetStatues(statueVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_TNT` and the given variant.
---@param TNTVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityTNT[]
function TSIL.GridSpecific.GetTNTs(TNTVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_TRAPDOOR` and the given variant.
---@param trapdoorVariant TrapdoorVariant? @Default: -1. Which matches all variants.
---@return GridEntityTrapDoor[]
function TSIL.GridSpecific.GetTrapdoors(trapdoorVariant)
end

--- Helper function to get all grid entities with type `GridEntityType.GRID_WALL` and the given variant.
---@param wallVariant integer? @Default: -1. Which matches all variants.
---@return GridEntityWall[]
function TSIL.GridSpecific.GetWalls(wallVariant)
end

--- Helper function to spawn a decoration.
---@param decorationVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityDecoration?
function TSIL.GridSpecific.SpawnDecoration(decorationVariant, indexOrPosition, force)
end

--- Helper function to spawn a door.
---@param doorVariant DoorVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityDoor?
function TSIL.GridSpecific.SpawnDoor(doorVariant, indexOrPosition, force)
end

--- Helper function to spawn a fireplace.
---@param fireVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityFire?
function TSIL.GridSpecific.SpawnFire(fireVariant, indexOrPosition, force)
end

--- Helper function to spawn a gravity grid entity.
---@param gravityVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityGravity?
function TSIL.GridSpecific.SpawnGravity(gravityVariant, indexOrPosition, force)
end

--- Helper function to spawn a pit.
---@param pitVariant PitVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPit?
function TSIL.GridSpecific.SpawnPit(pitVariant, indexOrPosition, force)
end

--- Helper function to spawn a poop.
---@param poopVariant GridPoopVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPoop?
function TSIL.GridSpecific.SpawnPoop(poopVariant, indexOrPosition, force)
end

--- Helper function to spawn a pressure plate.
---@param pressurePlateVariant PressurePlateVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityPressurePlate?
function TSIL.GridSpecific.SpawnPressurePlate(pressurePlateVariant, indexOrPosition, force)
end

--- Helper function to spawn a rock.
---@param rockVariant RockVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityRock?
function TSIL.GridSpecific.SpawnRock(rockVariant, indexOrPosition, force)
end

--- Helper function to spawn spikes.
---@param spikeVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntitySpikes?
function TSIL.GridSpecific.SpawnSpikes(spikeVariant, indexOrPosition, force)
end

--- Helper function to spawn stairs.
---@param stairsVariant StairsVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityStairs?
function TSIL.GridSpecific.SpawnStairs(stairsVariant, indexOrPosition, force)
end

--- Helper function to spawn a statue.
---@param statueVariant StatueVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityStatue?
function TSIL.GridSpecific.SpawnStatue(statueVariant, indexOrPosition, force)
end

--- Helper function to spawn a TNT.
---@param TNTVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityTNT?
function TSIL.GridSpecific.SpawnStatue(TNTVariant, indexOrPosition, force)
end

--- Helper function to spawn a trapdoor.
---@param trapdoorVariant TrapdoorVariant
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityTrapDoor?
function TSIL.GridSpecific.SpawnTrapdoor(trapdoorVariant, indexOrPosition, force)
end

--- Helper function to spawn a wall.
---@param wallVariant integer
---@param indexOrPosition integer | Vector
---@param force boolean? @ Default: true | Set this to true if you want to replace existing grid entities in the same tile.
---@return GridEntityWall?
function TSIL.GridSpecific.SpawnTrapdoor(wallVariant, indexOrPosition, force)
end

--- Helper function to get all the values of the `ButtonAction` enum that correspond to movement.
---@return ButtonAction[]
function TSIL.Input.GetMoveActions()
end

--- Helper function to get all the values of the `ButtonAction` enum that correspond to shooting.
---@return ButtonAction[]
function TSIL.Input.GetShootActions()
end

--- Helper function to check if a given Button Action is being pressed in any controller.
---@param action ButtonAction
---@return boolean
function TSIL.Input.IsActionPressedOnAnyInput(action)
end

--- Helper function to check if a given Button Action is being triggered in any controller.
---@param action ButtonAction
---@return boolean
function TSIL.Input.IsActionTriggeredOnAnyInput(action)
end

--- Helper function to see if any of the given keys are being pressed in the keyboard.
---@param ... Keyboard
---@return boolean
function TSIL.Input.IsKeyboardPressed(...)
end

--- Helper function to get the modifier key that is being pressed in the keyboard
---
--- A modifier key is defined as shift, control, alt, or Windows.
---@return Keyboard? @ The modifier key that's being pressed, or nil if there are none.
function TSIL.Input.GetPressedModifier()
end

--- Helper function to get the string that would be typed if someone pressed the corresponding key.
---@param key Keyboard
---@param shiftPressed boolean
---@return string
function TSIL.Input.KeyboardToString(key, shiftPressed)
end

--- Helper function to check if a given Button Action corresponds to movement.
---@param buttonAction ButtonAction
---@return boolean
function TSIL.Input.IsMoveAction(buttonAction)
end

--- Helper function to check if a move action is being pressed in any controller.
---@return boolean
function TSIL.Input.IsMoveActionPressedOnAnyInput()
end

--- Helper function to check if a move action is being triggered in any controller.
---@return boolean
function TSIL.Input.IsMoveActionTriggeredOnAnyInput()
end

--- Helper function to check if a given Button Action corresponds to shooting.
---@param buttonAction ButtonAction
---@return boolean
function TSIL.Input.IsShootAction(buttonAction)
end

--- Helper function to check if a shoot action is being pressed in any controller.
---@return boolean
function TSIL.Input.IsShootActionPressedOnAnyInput()
end

--- Helper function to check if a shoot action is being triggered in any controller.
---@return boolean
function TSIL.Input.IsShootActionTriggeredOnAnyInput()
end

---Helper function to check if something is an instantiated `BitSet128` object.
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsBitSet128(variable)
end

---Helper function to check if something is an instantiated `Color` object.
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsColor(variable)
end

---Helper function to check if something is an instantiated `ColorModifier` object.
---@param variable any
---@return boolean
function TSIL.IsaacAPIClass.IsColorModifier(variable)
end

---Helper function to detect if a variable is of type `KColor`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsKColor(variable)
end

---Helper function to detect if a variable is of type `EntityKnife`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsKnife(variable)
end

---Helper function to detect if a variable is of type `EntityLaser`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsLaser(variable)
end

---Helper function to detect if a variable is of type `EntityNPC`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsNPC(variable)
end

---Helper function to detect if a variable is of type `EntityPickup`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPickup(variable)
end

---Helper function to detect if a variable is of type `GridEntityPit`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPit(variable)
end

---Helper function to detect if a variable is of type `EntityPlayer`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPlayer(variable)
end

---Helper function to detect if a variable is of type `GridEntityPoop`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPoop(variable)
end

---Helper function to detect if a variable is of type `GridEntityPressurePlate`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPressurePlate(variable)
end

---Helper function to detect if a variable is of type `EntityProjectile`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsProjectile(variable)
end

---Helper function to detect if a variable is of type `RNG`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsRNG(variable)
end

---Helper function to detect if a variable is of type `GridEntityRock`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsRock(variable)
end

---Helper function to detect if a variable is of type `EntitySlot`
---@param variable any
---@return boolean
function TSIL.IsaacAPIClass.IsSlot(variable)
end

---Helper function to detect if a variable is of type `GridEntitySpikes`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsSpikes(variable)
end

---Helper function to detect if a variable is of type `EntityTear`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsTear(variable)
end

---Helper function to detect if a variable is of type `GridEntityTNT`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsTNT(variable)
end

---Helper function to detect if a variable is of type `Vector`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsVector(variable)
end

---Helper function to get the name of a class from the Isaac API. This is contained within the
---"__type" metatable key.
---
---For example, a `Vector` class is has a name of "Vector".
---
---Returns nil if the object is not of type `userdata` or if the "__type" metatable key does
---not exist.
---
---In some cases, Isaac classes can be a read-only. If this is the case, the "__type" field will be
---prepended with "const ". This function will always strip this prefix, if it exists. For example,
---the class name returned for "const Vector" will be "Vector".
---@param object unknown
---@return string?
function TSIL.IsaacAPIClass.GetIsaacAPIClassName(object)
end

---Helper function to see if the given collectible is still present in the given item pool.
---
---This function ignores modifiers like T.Lost offensive item mechanic and passive effects like the NO! trinket.
---If you want to account for them, use `ItemPool:CanSpawnCollectible()`.
---@param collectibleType CollectibleType
---@param itemPoolType ItemPoolType
---@return boolean
function TSIL.ItemPool.IsCollectibleInItemPool(collectibleType, itemPoolType)
end

---Converts a Lua table to a JSON string.
---
---In most cases, this function will be used for writing data to a "save#.dat" file. 
---If encoding fails, it will throw an error to prevent writing a blank string or corrupted
---data to a user's "save#.dat" file.
---
---Under the hood, this uses a custom JSON parser that was measured to be 11.8 times faster than the vanilla JSON parser.
---@param val any
---@return string
function TSIL.JSON.Encode(val)
end

---Converts a JSON string to a Lua table.
---
---In most cases, this function will be used for reading data from a "save#.dat" file.
---If decoding fails, it will return a blank Lua table instead of throwing an error.
---(This allows execution to continue in cases where users have no current save data or have
---manually removed their existing save data.)
---
---Under the hood, this uses a custom JSON parser that was measured to be 11.8 times faster than the vanilla JSON parser.
---@param str any
---@return unknown
function TSIL.JSON.Decode(str)
end

--- Helper function to get the name and the line number of the current calling function.
---
--- For this function to work properly, the "--luadebug" flag must be enabled. Otherwise, it will
--- always return undefined.
---@param levels number? @Default: 3 | The amount of levels to look backwards in the call stack. Default is 3 because the first level is the function, the second level is the calling function, and the third level is the parent of the calling function.
---@return string?
function TSIL.Log.GetParentFunctionDescription(levels)
end

--- Helper function to avoid typing out `Isaac.DebugString()`.
---
--- If you have the "--luadebug" launch flag turned on, then this
--- function will also prepend the function name and the line number before the string.
---@param message string
function TSIL.Log.Log(message)
end

---Helper function to pause the game similarly to how the game does when showing a giant book
---or an achievement.
---
---Internally it's done by using the pause item on every frame and keeping track of every tear
---and projectile's states.
function TSIL.Pause.Pause()
end

---Unpauses the game if it was previously paused by `TSIL.Pause.Pause()`.
---
---Because of limitations with the Pause item, this will remove all projectiles.
function TSIL.Pause.Unpause()
end

---Helper function to check if the game is being paused by the library
---@return boolean
function TSIL.Pause.IsPaused()
end

---Helper function to get the corresponding coin amount from a `CoinSubType`. Returns 1 for modded sub-types.
---@param coinSubType CoinSubType
---@return integer
function TSIL.Pickups.GetCoinValue(coinSubType)
end

---Helper function to test if the provided pickup matches one of the various chest variants.
---@param pickup EntityPickup
---@return boolean
function TSIL.Pickups.IsChest(pickup)
end

---@class PickupIndex : integer


---@class PickupDescription
---@field Position Vector
---@field InitSeed integer


--- Mods often have to track variables relating to a pickups. Finding an index for these kinds of
--- data structures is difficult, since pickups are respawned every time a player re-enters a room,
--- so the `PtrHash` will change.
---
--- Use this function to get a unique index for a pickup to use in these data structures.
---
--- Specifically, `PickupIndex` is a number that represents the spawn order of the pickup on the
--- current run. For example, the first pickup spawned will have an index of 1, the second one will
--- have an index of 2, and so on.
---@param pickup EntityPickup
---@return PickupIndex
function TSIL.Pickups.GetPickupIndex(pickup)
end

---Helper function to get all of the red heart pickup entities in the room.
---@return EntityPickup[]
function TSIL.Pickups.GetRedHearts()
end

---Helper function to test if the provided pickup matches one of the various red heart sub types.
---@param pickup EntityPickup
---@return boolean
function TSIL.Pickups.IsRedHeart(pickup)
end

---Helper function to get all the batteries in the room.
---@param batterySubtype BatterySubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetBatteries(batterySubtype)
end

---Helper function to get all the bomb pickups in the room.
---@param bombSubtype? BombSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetBombPickups(bombSubtype)
end

---Helper function to get all the cards in the room.
---@param cardType? Card
---@return EntityPickup[]
function TSIL.PickupSpecific.GetCards(cardType)
end

---Helper function to get all the coins in the room.
---@param coinSubtype? CoinSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetCoins(coinSubtype)
end

---Helper function to get all the collectibles in the room.
---@param collectibleType? CollectibleType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetCollectibles(collectibleType)
end

---Helper function to get all the hearts in the room.
---@param heartSubtype? HeartSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetHearts(heartSubtype)
end

---Helper function to get all the keys in the room.
---@param keySubtype? KeySubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetKeys(keySubtype)
end

---Helper function to get all the pills in the room.
---@param pillColor? PillColor
---@return EntityPickup[]
function TSIL.PickupSpecific.GetPills(pillColor)
end

---Helper function to get all the sacks in the room.
---@param sackSubtype? SackSubType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetSacks(sackSubtype)
end

---Helper function to get all the trinkets in the room.
---@param trinketType? TrinketType
---@return EntityPickup[]
function TSIL.PickupSpecific.GetTrinket(trinketType)
end

---Helper function to spawn a battery.
---@param batterySubtype BatterySubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnBattery(batterySubtype, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a bomb pickup.
---@param bombSubtype BombSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnBombPickup(bombSubtype, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a card.
---@param cardType Card
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnCard(cardType, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a coin.
---@param coinSubtype CoinSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnCoin(coinSubtype, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a heart.
---@param heartSubtype HeartSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnHeart(heartSubtype, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a key.
---@param keySubtype KeySubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnKey(keySubtype, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a pill.
---@param pillColor PillColor
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnPill(pillColor, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a sack.
---@param sackSubtype SackSubType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnSack(sackSubtype, position, velocity, spawner, seedOrRNG)
end

---Helper function to spawn a trinket.
---@param trinketType TrinketType
---@param position Vector
---@param velocity Vector?
---@param spawner Entity?
---@param seedOrRNG integer | RNG?
---@return EntityPickup
function TSIL.PickupSpecific.SpawnTrinket(trinketType, position, velocity, spawner, seedOrRNG)
end

--- Helper function to get the corresponding pill effect a pill effect would be
--- converted into after picking up PHD.
---
--- If the pill wouldn't transform, it returns the same pill effect.
---@param pillEffect PillEffect
---@return PillEffect
function TSIL.Pills.GetPHDPillEffect(pillEffect)
end

--- Helper function to get the corresponding pill effect a pill effect would be
--- converted into after picking up False PHD.
---
--- If the pill wouldn't transform, it returns the same pill effect.
---@param pillEffect PillEffect
---@return PillEffect
function TSIL.Pills.GetFalsePHDPillEffect(pillEffect)
end

--- Helper function to get the `PillEffectType` of a given pill effect.
---
--- Due to API limitations, it'll returns `PillEffectType.MODDED` for modded pills.
---@param pillEffect PillEffect
---@return PillEffectType
function TSIL.Pills.GetPillEffectType(pillEffect)
end

--- Helper function to get the corresponding horse pill color from a normal pill color
---@param pillColor PillColor
---@return PillColor
function TSIL.Pills.GetHorsePillCollor(pillColor)
end

--- Helper function to get the corresponding normal pill color from a horse pill color
---@param pillColor PillColor
---@return PillColor
function TSIL.Pills.GetNormalPillColorFromHorsePill(pillColor)
end

--- Helper function to check if a pill color corresponds to a horse pill.
---@param pillColor PillColor
---@return boolean
function TSIL.Pills.IsHorsePill(pillColor)
end

--- Returns the combined value of all of the player's red hearts, soul/black hearts, and bone hearts,
--- minus the value of the player's rotten hearts.
---
--- This is equivalent to the number of hits that the player can currently take, but does not take
--- into account double damage from champion enemies and/or being on later floors. (For example, on
--- Womb 1, players who have 1 soul heart remaining would die in 1 hit to anything, even though this
--- function would report that they have 2 hits remaining.)
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetPlayerNumHitsRemaining(player)
end

--- Helper function to get the player from a tear, laser, bomb, etc. Returns nil if the entity
--- does not correspond to any particular player.
---
--- This function works by looking at the `Parent` and the `SpawnerEntity` fields (in that order).
--- As a last resort, it will attempt to use the `Entity.ToPlayer` method on the entity itself.
---@param entity Entity
---@return EntityPlayer?
function TSIL.Players.GetPlayerFromEntity(entity)
end

--- Returns the n closest players to a certain point.
--- The players are ordered by their distance.
---@param center Vector
---@param numberOfPlayers? integer @Default : 1
---@return EntityPlayer[]
function TSIL.Players.GetClosestPlayers(center, numberOfPlayers)
end

--- Returns a list of all players that have a certain item
---@param collectibleId CollectibleType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByCollectible(collectibleId)
end

--- Returns all the players that have a certain trinket
---@param trinketId TrinketType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersByTrinket(trinketId)
end

--- Returns all the players of a given type.
---@param playerType PlayerType
---@return EntityPlayer[]
function TSIL.Players.GetPlayersOfType(playerType)
end

--- Returns all the players corresponding to a controller index.
---@param controllerIndex integer
---@return EntityPlayer[]
function TSIL.Players.GetPlayersWithControllerIndex(controllerIndex)
end

---Helper function to get the parent of a given sub player.
---@param subPlayer EntityPlayer
---@return EntityPlayer?
function TSIL.Players.GetSubPlayerParent(subPlayer)
end

--- Returns the maximum heart containers that the provided character can have. Normally, this is 12,
--- but with Keeper it is 3, and with Tainted Keeper it is 2. This does not account for Birthright or
--- Mother's Kiss; use the `GetPlayerMaxHeartContainers` helper function for that.
---@param character PlayerType
---@return integer
function TSIL.Players.GetCharacterMaxHeartContainers(character)
end

---Helper function to get the max amount of heart containers a player
---can have.
---@param player EntityPlayer
function TSIL.Players.GetPlayerMaxHeartContainers(player)
end

---Returns the number of red hearts that the player has, excluding any rotten hearts. For example,
---if the player has one full black heart, one full soul heart, and one half black heart, this
---function returns 3.
---
---This is different from the `EntityPlayer.GetHearts` method, since that returns a value that
---includes rotten hearts.
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetHearts(player)
end

--- Returns the number of soul hearts that the player has, excluding any black hearts. For example,
--- if the player has one full black heart, one full soul heart, and one half black heart, this
--- function returns 2.
---
--- This is different from the `EntityPlayer.GetSoulHearts` method, since that returns the combined
--- number of soul hearts and black hearts.
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetSoulHearts(player)
end

--- Returns the number of black hearts that the player has, excluding any soul hearts. For example,
--- if the player has one full black heart, one full soul heart, and one half black heart, this
--- function returns 3.
---
--- This is different from the `EntityPlayer.GetBlackHearts` method, since that returns a bitmask.
---@param player EntityPlayer
---@return integer
function TSIL.Players.GetBlackHeartsNum(player)
end

---Helper function to get the amount of a given health type a player has.
---@param player EntityPlayer
---@param healthType PlayerHeartType
function TSIL.Players.GetPlayerHealthType(player, healthType)
end

--- Returns `true` if the player has one or more of the provided collectibles
---
--- This function is variadic, meaning that you can specify as many collectible types that you want
--- to check for.
---@param player EntityPlayer
---@vararg CollectibleType
function TSIL.Players.PlayerHasCollectible(player, ...)
end

---Helper function to detect if a player is a "child player", meaning they
---have a defined `Parent` field (i.e. Strawman players)
---@param player EntityPlayer
function TSIL.Players.IsChildPlayer(player)
end

---Helper function to check if a player is either Keeper of T.Keeper.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsKeeper(player)
end

---Helper function to check if a player is any form of Tainted Lazarus.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsTaintedLazarus(player)
end

---Helper function to check if a player is The Lost or T.The Lost.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsTheLost(player)
end

---Helper function to check if a player is Bethany or T.Bethany.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsBethany(player)
end

---Helper function to check if a player is either Jacob or Esau. Note that
---this will only be true for the non tainted versions.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsJacobOrEsau(player)
end

---@class PlayerIndex : integer


--- Returns a given player's index. Useful for storing unique data per player.
---@param player EntityPlayer
---@param differentiateSoulAndForgotten? boolean
---@return PlayerIndex
function TSIL.Players.GetPlayerIndex(player, differentiateSoulAndForgotten)
end

--- Returns a player given its index.
---@param playerIndex PlayerIndex
---@return EntityPlayer?
function TSIL.Players.GetPlayerByIndex(playerIndex)
end

--- Removes a costume from the provided player.
---@param player EntityPlayer
---@param collectible CollectibleType
function TSIL.Players.RemoveCollectibleCostume(player, collectible)
end

--- Returns wether the given form of tainted lazarus is the active one.
--- If the given player is not tainted lazarus, it'll always return false.
--- 
--- Accounts for when the player has Birthright.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsActiveTaintedLazForm(player)
end

--- Returns the number of trinkets a player has smelted.
--- Won't count the trinkets they're currently holding.
---@param player EntityPlayer
---@param trinket TrinketType
---@return integer
function TSIL.Players.GetSmeltedTrinketMultiplier(player, trinket)
end

---@class TrinketSituation
---@field TrinketTypeRemoved TrinketType
---@field TrinketType1 TrinketType
---@field TrinketType2 TrinketType
---@field NumSmeltedTrinkets integer


--- Helper function to temporarily remove a specific kind of trinket from the player. Use this in
--- combination with the `giveTrinketsBack` function to take away and give back a trinket on the same
--- frame. This function correctly handles multiple trinket slots and ensures that all copies of the
--- trinket are removed, including smelted trinkets.
---
--- Note that one smelted golden trinket is the same as two smelted normal trinkets.
---@param player EntityPlayer
---@param trinketType TrinketType
---@return TrinketSituation?
function TSIL.Players.TemporarilyRemoveTrinket(player, trinketType)
end

--- Helper function to temporarily removes a player's held trinkets, if any. This will not remove any
--- smelted trinkets. Use this in combination with the `giveTrinketsBack` function to take away and
--- give back trinkets on the same frame.
---@param player EntityPlayer
---@return TrinketSituation?
function TSIL.Players.TemporarilyRemoveTrinkets(player)
end

--- Helper function to restore the player's trinkets back to the way they were before the
--- `temporarilyRemoveTrinket` function was used. It will re-smelt any smelted trinkets that were
--- removed.
---@param player EntityPlayer
---@param trinketSituation TrinketSituation?
function TSIL.Players.GiveTrinketsBack(player, trinketSituation)
end

---Uses the player's current health and other miscellaneous things to determine if incoming damage
---will be fatal.
---@param player EntityPlayer
---@param amount number
---@param source EntityRef
---@param lastDamageGameFrame integer?
---@return boolean
function TSIL.Players.IsDamageToPlayerFatal(player, amount, source, lastDamageGameFrame)
end

--- Assuming that we are on the frame of fatal damage, this function returns whether or not
--- Mysterious Paper would rotate to Missing Poster on the frame that the "Game Over" screen would
--- appear (which would subsequently save the player from fatal damage).
---
--- Mysterious Paper rotates between the 4 items on every frame, in order. The formula for whether
--- Mysterious Paper be Missing Power is: `gameFrameCount % 4 === 3`
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillMysteriousPaperRevive(player)
end

--- The `EntityPlayer.WillPlayerRevive` method does not properly account for Mysterious Paper, so use
--- this helper function instead for more robust revival detection.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillPlayerRevive(player)
end

--- Helper function to determine if the player will be revived by the Heartbreak collectible if they
--- take fatal damage. This is contingent on the character that they are playing as and the amount of
--- broken hearts that they already have.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillReviveFromHeartbreak(player)
end

--- Helper function to determine if the Spirit Shackles item is in an enabled state. (It can be
--- either enabled or disabled.)
---@param player EntityPlayer
---@return boolean
function TSIL.Players.WillReviveFromSpiritShackles(player)
end

---This returns a random float between 0 and 1. It is inclusive on the low end, but exclusive on the
---high end. (This is because the `RNG.RandomFloat` method will never return a value of exactly 1.)
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@return number
function TSIL.Random.GetRandom(seedOrRNG)
end

---This returns a random float between min and max.
---@param min number The lower bound for the random number (inclusive).
---@param max number The upper bound for the random number (exclusive)
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@return number
function TSIL.Random.GetRandomFloat(min, max, seedOrRNG)
end

---This returns a random integer between min and max. It is inclusive on both ends.
---Note that this function will run the `Next` method on the `RNG` object before returning the
---random number.
---@param min integer The lower bound for the random number (inclusive).
---@param max integer The upper bound for the random number (inclusive)
---@param seedOrRNG number | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@param exceptions integer[]? Optional. An array of elements that will be skipped over when getting the random integer. For example, a min of 1, a max of 4, and an exceptions array of `[2]` woudl cause the function to return either 1, 3, or 4. Default is an empty array.
---@return integer
function TSIL.Random.GetRandomInt(min, max, seedOrRNG, exceptions)
end

--- Returns n randomly selected elements from a table.
---@generic T any
---@param toChoose T[]
---@param numberOfElements? integer @Default: 1
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@return T[]
function TSIL.Random.GetRandomElementsFromTable(toChoose, numberOfElements, seedOrRNG)
end

--- Returns a random value from a weighted list of possibilities.
--- Each choice must be given as a pair of chance and value.
--- 
--- `{chance = x, value = y}`
---@generic T any
---@param seedOrRNG integer | RNG
---@param possibles {chance : number, value : T}[]
---@return T
function TSIL.Random.GetRandomElementFromWeightedList(seedOrRNG, possibles)
end

---Copies an `RNG` object
---@param rng RNG
---@return RNG
function TSIL.RNG.CopyRNG(rng)
end

---Helper function to get a random `Seed` value to be used in spawning entities and so on. Use this
---instead of calling the `Random` function directly since that can return a value of 0 and crash
---the game.
---@return integer
function TSIL.RNG.GetRandomSeed()
end

---Helper function to initialize an RNG object using Blade's recommended shift index.
---@param seed integer? The seed to initialize it with. Default is `TSIL.RNG.GetRandomSeed`
---@return RNG
function TSIL.RNG.NewRNG(seed)
end

--- Helper function to set a seed to an RNG object using Blade's recommended shift index.
---@param rng RNG
---@param seed integer
function TSIL.RNG.SetSeed(rng, seed)
end

---Helper function to remove all naturally spawning entities and grid entities from a room.
---Notably, this will not remove players, tears, familiars, lasers, knives, projectiles,
---blacklisted NPCs such as Dark Esau, charmed NPCs, friendly NPCs, persistent NPCs, most effects,
---doors, and walls.
function TSIL.Rooms.EmptyRoom()
end

--- Helper function to get the width of the grid in a given room shape.
---@param shape RoomShape
---@return integer
function TSIL.Rooms.GetRoomShapeGridWidth(shape)
end

--- Helper function to check if the current room is a boss room for a particular boss. This will only
--- work for bosses that have dedicated boss rooms in the "00.special rooms.stb" file.
---@param bossID BossID
---@return boolean
function TSIL.Rooms.InBossRoomOf(bossID)
end

--- Helper function to check if a grid index is valid in a certain room shape.
--- 
--- Doesn't account for being out of bounds (less than 0 or greater than the grid size).
--- For that use `TSIL.Rooms.IsGridIndexInRoom`
---@param gridIndex integer
---@param roomShape RoomShape
---@return boolean
function TSIL.Rooms.IsGridIndexInRoomShape(gridIndex, roomShape)
end

--- Helper function to check if a grid index is inside a room, including walls.
--- Accounts for room shape.
---@param gridIndex integer
---@return boolean
function TSIL.Rooms.IsGridIndexInRoom(gridIndex)
end

--- Alias for the `Level.GetCurrentRoomDesc` method. Use this to make it more clear what type of
--- `RoomDescriptor` object that you are retrieving.
---@return RoomDescriptor
function TSIL.Rooms.GetRoomDescriptorReadOnly()
end

--- Helper function to get the grid index of the current room.
---
--- - If the current room is inside of the grid, this function will return the `SafeGridIndex` from
---   the room descriptor. (The safe grid index is defined as the top-left 1x1 section that the room
---   overlaps with, or the top-right 1x1 section of a `RoomType.SHAPE_LTL` room.)
--- - If the current room is outside of the grid, it will return the index from the
---   `Level.GetCurrentRoomIndex` method (since `SafeGridIndex` is bugged for these cases).
---
--- Use this function instead of the `Level.GetCurrentRoomIndex` method directly because the latter
--- will return the specific 1x1 quadrant that the player entered the room at. For most situations,
--- using the safe grid index is more reliable than this.
---
--- Data structures that store data per room should use the room's `ListIndex` instead of
--- `SafeGridIndex`, since the former is unique across different dimensions.
---@return integer
function TSIL.Rooms.GetRoomGridIndex()
end

--- Helper function to get the descriptor for a room.
---@param roomGridIndex integer? @Leave nil to get the current room descriptor.
---@return RoomDescriptor
function TSIL.Rooms.GetRoomDescriptor(roomGridIndex)
end

--- Helper function to get the room data for the provided room.
---@param roomGridIndex integer? @Leave nil to get the current room data.
---@return RoomConfig_Room? @Can be nil if the room index doesn't correspond to a real room.
function TSIL.Rooms.GetRoomData(roomGridIndex)
end

--- Helper function to get the stage ID for a room from the XML/STB data. The room stage ID will
--- correspond to the first number in the filename of the XML/STB file. For example, a Depths room
--- would have a stage ID of 7.
---@param roomGridIndex integer? @Leave nil to get the current room stage ID.
---@return integer
function TSIL.Rooms.GetRoomStageID(roomGridIndex)
end

--- Helper function to get the sub-type for a room from the XML/STB data. The room sub-type will
--- correspond to different things depending on what XML/STB file it draws from. For example, in the
--- "00.special rooms.stb" file, an Angel Room with a sub-type of 0 will correspond to a normal Angel
--- Room and a sub-type of 1 will correspond to an Angel Room shop for The Stairway.
---@param roomGridIndex integer? @Leave nil to get the current room subtype.
---@return integer
function TSIL.Rooms.GetRoomSubType(roomGridIndex)
end

---@class RoomHistoryData
---@field Stage LevelStage
---@field StageType StageType
---@field RoomType RoomType
---@field StageID StageID
---@field Dimension Dimension
---@field RoomVariant integer
---@field RoomSubType integer
---@field RoomName string
---@field RoomGridIndex integer
---@field RoomListIndex integer
---@field RoomVisitedCount integer


---Helper function to get information about all of the rooms that a player has visited thus far on this run.
---@return RoomHistoryData[]
function TSIL.Rooms.GetRoomHistory()
end

--- Helper function to get information about the room that was previously visited.
---
--- In the special case of only one room having been visited thus far (i.e. the starting room of
--- the run), the starting room will be returned.
---@return RoomHistoryData
function TSIL.Rooms.GetPreviousRoomDescription()
end

--- Helper function to get information about the most recent room that is stored in the room
--- history array.
---
--- This is useful in the `POST_ENTITY_REMOVE` callback; see the `isLeavingRoom` function.
---
--- Note that this function can return nil in the case where it is called on the first room
--- of the run.
---@return RoomHistoryData
function TSIL.Rooms.GetLatestRoomDescription()
end

--- Helper function to detect if the game is in the state where the room index has changed to a new
--- room, but the entities from the previous room are currently in the process of despawning. (At
--- this point, the `POST_NEW_ROOM` callback and the `POST_NEW_ROOM_EARLY` callback will not have
--- fired yet, and there will not be an entry in the room history array for the current room.)
---
--- This function is intended to be used in the `POST_ENTITY_REMOVE` callback to detect when an
--- entity is despawning.
---@return boolean
function TSIL.Rooms.IsLeavingRoom()
end

--- Helper function to trigger a room update without affecting entity positions or velocities.
function TSIL.Rooms.UpdateRoom()
end

---Helper function to check if the players are in the beast room.
---@return boolean
function TSIL.RoomSpecific.InBeastRoom()
end

---Helper function for determining whether the current room is a crawl space. Use this function over
---comparing to `RoomType.DUNGEON` or `GridRoom.DUNGEON_IDX` since there is a special case of the
---player being in a boss fight that take place in a dungeon.
---@return boolean
function TSIL.RoomSpecific.InCrawlSpace()
end

---Helper function to detect if the current room is one of the rooms in the Death Certificate area.
---@return boolean
function TSIL.RoomSpecific.InDeathCertificateArea()
end

---Helper function to check if the players are in a devils crown treasure room.
---@return boolean
function TSIL.RoomSpecific.InDevilsCrownTreasureRoom()
end

---Helper function to check if the players are in the genesis room.
---@return boolean
function TSIL.RoomSpecific.InGenesisRoom()
end

---Helper function to check if the players are in any of the home closets.
---@return boolean
function TSIL.RoomSpecific.InHomeCloset()
end

---Helper function to check if the players are in the Mega Satan room.
---@return boolean
function TSIL.RoomSpecific.InMegaSatanRoom()
end

---Helper function to determine if the current room is part of the Repentance "escape sequence" in
---the Mines/Ashpit.
---@return boolean
function TSIL.RoomSpecific.InMineShaft()
end

---Helper function for checking if the current room is a secret exit that leads to a Repentance
---floor.
---@return boolean
function TSIL.RoomSpecific.InSecretExit()
end

--- Helper function for checking if the current room is a secret shop (from the Member Card
--- collectible).
---
--- Secret shops are simply copies of normal shops, but with the backdrop of a secret room. In other
--- words, they will have the same room type, room variant, and room sub-type of a normal shop. Thus,
--- the only way to detect them is by using the grid index.
---@return boolean
function TSIL.RoomSpecific.InSecretShop()
end

---Helper function to determine whether or not the current room is the starting room of a floor. It
---only returns true for the starting room of the primary dimension (meaning that being in the
---starting room of the mirror world does not count).
---@return boolean
function TSIL.RoomSpecific.InStartingRoom()
end

---Helper function to check if the current run is a greed run.
---@return boolean
function TSIL.Run.IsGreedMode()
end

---Helper function to check if the current run can unlock achievements.
---
---Done by trying to spawn a greed donation machine and checking if it
---actually spawn.
function TSIL.Run.CanRunUnlockAchievements()
end

--- Adds a variable to the save manager.
--- The variable name must be unique within your mod.
---@param mod table
---@param variableName string
---@param value any
---@param persistenceMode VariablePersistenceMode
---@param ignoreGlowingHourglass? boolean @Default: false
---@param conditionalSave? fun(): boolean
function TSIL.SaveManager.AddPersistentVariable(mod, variableName, value, persistenceMode, ignoreGlowingHourglass, conditionalSave)
end

--- Gets a variable from the save manager.
---@param mod table
---@param variableName string
---@return any
function TSIL.SaveManager.GetPersistentVariable(mod, variableName)
end

--- Removes a variable from the save manager.
---@param mod table
---@param variableName string
function TSIL.SaveManager.RemovePersistentVariable(mod, variableName)
end

--- Resets a variable to its default value in the save manager.
---@param mod table
---@param variableName string
function TSIL.SaveManager.ResetPersistentVariable(mod, variableName)
end

--- Sets a variable from the save manager.
---@param mod table
---@param variableName string
---@param newValue any
---@param overrideType? boolean @default: false
function TSIL.SaveManager.SetPersistentVariable(mod, variableName, newValue, overrideType)
end

---@param saveKey "run"|"level"|"room"
function TSIL.SaveManager.RestoreDefaultsForAllFeaturesKey(saveKey)
end

---@param modPersistentData ModPersistentData
---@param saveDataKey "run"|"level"|"room"
function TSIL.SaveManager.RestoreDefaultForFeatureKey(modPersistentData, saveDataKey)
end

---@param modPersistentData ModPersistentData
---@param saveDataKey "run"|"level"|"room"
function TSIL.SaveManager.RemoveVariablesForFeatureKey(modPersistentData, saveDataKey)
end

---Helper function to convert a serialized object to a normal `BitSet128` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param bitSet128 table<unknown, unknown>
---@return BitSet128
function TSIL.Serialize.DeserializeBitSet128(bitSet128)
end

---Used to determine is the given table is a serialized `BitSet128` object created by the `deepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedBitSet128(object)
end

---Helper function to convert a `BitSet128` object to a serialized version.
---@param bitSet128 BitSet128
---@return unknown
function TSIL.Serialize.SerializeBitSet128(bitSet128)
end

---Helper function to convert a serialized object to a normal `Color` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param color table<unknown, unknown>
---@return Color
function TSIL.Serialize.DeserializeColor(color)
end

---Used to determine is the given table is a serialized `Color` object created by the `deepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedColor(object)
end

---Helper function to convert a `Color` object to a serialized version.
---@param color Color
---@return unknown
function TSIL.Serialize.SerializeColor(color)
end

---Helper function to convert a serialized object to a normal `KColor` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param kColor table<unknown, unknown>
---@return KColor
function TSIL.Serialize.DeserializeKColor(kColor)
end

---Used to determine is the given table is a serialized `KColor` object created by the `deepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedKColor(object)
end

---Helper function to convert a `KColor` object to a serialized version.
---@param kColor KColor
---@return unknown
function TSIL.Serialize.SerializeKColor(kColor)
end

---Helper function to convert a serialized object to a normal `RNG` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param rng table<unknown, unknown>
---@return RNG
function TSIL.Serialize.DeserializeRNG(rng)
end

---Used to determine is the given table is a serialized `RNG` object created by the `DeepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedRNG(object)
end

---Helper function to convert a `RNG` object to a serialized version.
---@param rng RNG
---@return unknown
function TSIL.Serialize.SerializeRNG(rng)
end

---Helper function to generically check if a given Lua table is a serialized Isaac API class. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedIsaacAPIClass(object)
end

---Helper function to generically deserialize an Isaac API class without knowing what specific type
---of class it is. (This is used by the save data manager when reading data from the "save#.dat"
---file.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param serializedIsaacAPIClass unknown
---@return unknown
function TSIL.Serialize.DeserializeIsaacAPIClass(serializedIsaacAPIClass)
end

---In order to find out what type of serialized Isaac API class this is, we search through the
---serialized table for brands.
---@param key unknown
---@return boolean
function TSIL.Serialize.IsSerializationBrand(key)
end

---Helper function to generically check if a given object is a copyable Isaac API class. (This is
---used by the save data manager when determining what is safe to copy.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsCopyableIsaacAPIClass(object)
end

---Helper function to generically copy an Isaac API class without knowing what specific type of
---class it is. (This is used by the save data manager.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@generic T
---@param class T
---@return T
function TSIL.Serialize.CopyIsaacAPIClass(class)
end

---Helper function to generically serialize an Isaac API class without knowing what specific type of
---class it is. (This is used by the save data manager when writing data to the "save#.dat" file.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param class unknown
---@return unknown
function TSIL.Serialize.SerializeIsaacAPIClass(class)
end

---Helper function to convert a serialized object to a table with number keys. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param tableWithNumberKeys table<unknown, unknown>
---@return table
function TSIL.Serialize.DeserializeTableWithNumberKeys(tableWithNumberKeys)
end

---Used to determine is the given table is a serialized table with number keys object created by the `DeepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedTableWithNumberKeys(object)
end

---Helper function to convert a table with number keys object to a serialized version.
---
---This is useful since parsing a table with non consecutive number keys will result in
---unexpect values being saved.
---@param tableWithNumberKeys table
---@return unknown
function TSIL.Serialize.SerializeTableWithNumberKeys(tableWithNumberKeys)
end

---Helper function to convert a serialized object to a normal `Vector` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param vector table<unknown, unknown>
---@return Vector
function TSIL.Serialize.DeserializeVector(vector)
end

---Used to determine is the given table is a serialized `Vector` object created by the `deepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedVector(object)
end

---Helper function to convert a `Vector` object to a serialized version.
---@param vector Vector
---@return unknown
function TSIL.Serialize.SerializeVector(vector)
end

---Creates a new shockwave with the given params.
---
---Returns the spawned shockwave. If it can't spawn it, returns nil.
---@param source Entity
---@param position Vector
---@param customShockwaveParams CustomShockwaveParams
---@return Entity?
function TSIL.ShockWaves.CreateShockwave(source, position, customShockwaveParams)
end

---Creates a shockwave ring with the given properties.
---
---Returns the spawned shockwaves. If multiple rings are set to spawn, returns only
---the shockwaves spawned in the first ring.
---@param source Entity
---@param center Vector
---@param radius number
---@param customShockwaveParams CustomShockwaveParams
---@param direction Vector? @ Default: Vector(0, -1)
---@param angleWidth number? @ Default: 360
---@param spacing number? @ Default: 35 * customShockwaveParams.Size
---@param numRings integer? @ Default: 1
---@param ringSpacing number? @ Default: 35 * customShockwaveParams.Size
---@param ringDelay integer? @ Default: 5
---@return Entity[]
function TSIL.ShockWaves.CreateShockwaveRing(source, center, radius, customShockwaveParams, direction, angleWidth, spacing, numRings, ringSpacing, ringDelay)
end

---Creates a shockwave line with the given properties.
---
---Returns only the first shockwave spawned.
---@param source Entity
---@param center Vector
---@param direction Vector
---@param customShockwaveParams CustomShockwaveParams
---@param spacing number? @ Default: 35 * customShockwaveParams.Size
---@param delay integer? @ Default: 1
---@param numShockwaves integer? @ Default: -1 | Which makes the line travel until it hits an obstacle it can't break
---@return Entity?
function TSIL.ShockWaves.CreateShockwaveLine(source, center, direction, customShockwaveParams, spacing, delay, numShockwaves)
end

---Creates a shockwave line with the given properties. Each shockwave is spawned with a random offset.
---
---Returns only the first shockwave spawned.
---@param source Entity
---@param center Vector
---@param direction Vector
---@param customShockwaveParams CustomShockwaveParams
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@param randomOffset integer? @ Default: 60
---@param spacing number? @ Default: 35 * customShockwaveParams.Size
---@param delay integer? @ Default: 1
---@param numShockwaves integer? @ Default: -1 | Which makes the line travel until it hits an obstacle it can't break
---@return Entity?
function TSIL.ShockWaves.CreateShockwaveRandomLine(source, center, direction, customShockwaveParams, seedOrRNG, randomOffset, spacing, delay, numShockwaves)
end

---Helper function to check whether a given entity is a custom shockwave.
---@param entity Entity
---@return boolean
function TSIL.ShockWaves.IsCustomShockwave(entity)
end

---Helper function to get a custom shockwave's data.
---@param entity Entity
---@return table?
function TSIL.ShockWaves.GetCustomShockwaveData(entity)
end

---@class CustomShockwaveParams
---@field Duration integer
---@field Size number
---@field Damage number
---@field SelfDamage boolean
---@field DamagePlayers boolean
---@field DestroyGrid boolean
---@field GoOverPits boolean
---@field Color Color
---@field SpriteSheet string
---@field Sound SoundEffect
---@field SoundMode ShockwaveSoundMode


---Creates a new `CustomShockwaveParams` object.
---@return CustomShockwaveParams
function TSIL.ShockWaves.CustomShockwaveParams()
end

---Helper function to get the last frame of a certain animation.
---@param sprite Sprite
---@param animation string? @Leave nil to get the last frame of the current animation
---@return integer
function TSIL.Sprites.GetLastFrameOfAnimation(sprite, animation)
end

--- Helper function to check if two texels on a sprite are equivalent to each other.
---@param sprite1 Sprite
---@param sprite2 Sprite
---@param position Vector
---@param layer integer
---@return boolean
function TSIL.Sprites.TexelEquals(sprite1, sprite2, position, layer)
end

--- Helper function to check if two sprite layers have the same sprite sheet by using the
--- `Sprite.GetTexel` method.
---
--- Since checking every single texel in the entire sprite is very expensive, this function
--- requires you to specify the range of texels to check.
---@param sprite1 Sprite
---@param sprite2 Sprite
---@param layer integer
---@param xStart integer
---@param xFinish integer
---@param xIncrement integer
---@param yStart integer
---@param yFinish integer
---@param yIncrement integer
---@return boolean
function TSIL.Sprites.SpriteEquals(sprite1, sprite2, layer, xStart, xFinish, xIncrement, yStart, yFinish, yIncrement)
end

--- Helper function that calculates what the StageType should be for the provided LevelStage in the current run. This
--- emulates what the game's internal code does.
---@param stage LevelStage
---@return StageType
function TSIL.Stage.CalculateStageType(stage)
end

--- Helper function that calculates what the Repentance StageType should be for the provided LevelStage.
--- This emulates what the game's internal code does.
---@param stage LevelStage
---@return StageType
function TSIL.Stage.CalculateStageTypeRepentance(stage)
end

---Helper function to account for Repentance floors being offset by 1. For example, Downpour 2 is
---the third level of the run, but the game considers it to have a stage of 2. This function will
---consider Downpour 2 to have a stage of 3.
---@return integer
function TSIL.Stage.GetEffectiveStage()
end

---Helper function to check if the appropiate ascent flag is set.
---@return boolean
function TSIL.Stage.OnAscent()
end

---Returns whether or not the player is on the first floor of the particular run.
---
---This is tricky to determine because we have to handle the cases of Downpour/Dross 1 not being the
---first floor and The Ascent.
---@return boolean
function TSIL.Stage.OnFirstFloor()
end

--- Helper function to check if the current stage type is equal to `StageType.STAGETYPE_REPENTANCE` or `StageType.STAGETYPE_REPENTANCE_B`
---@return boolean
function TSIL.Stage.OnRepentanceStage()
end

---Helper function to check if a given trinket type corresponds to a golden trinket.
---@param trinketType TrinketType
---@return boolean
function TSIL.Trinkets.IsGoldenTrinket(trinketType)
end

---Helper function to get the golden trinket type corresponding to a normal trinket type.
---@param trinketType TrinketType
---@return integer
function TSIL.Trinkets.GetGoldenTrinketType(trinketType)
end

---Helper function to get the normal trinket type corresponding to a golden trinket type.
---@param trinketType any
---@return integer
function TSIL.Trinkets.GetNormalTrinketTypeFromGoldenTrinketType(trinketType)
end

--- Returns how many hearts that are being displayed on the provided player's UI
---@param player EntityPlayer
---@return integer
function TSIL.UI.GetVisibleHearts(player)
end

--- Returns how many hearts that are being displayed in a row. If the player has more than 6
--- hearts, then this function will return 6 due to the hearts wrapping into rows.
---@param player EntityPlayer
---@return integer
function TSIL.UI.GetHeartRowLength(player)
end

---@return Vector
function TSIL.UI.GetScreenBottomCenterPosition()
end

---@return Vector
function TSIL.UI.GetScreenBottomLeftPosition()
end

---@return Vector
function TSIL.UI.GetScreenBottomRightPosition()
end

---@return Vector
function TSIL.UI.GetScreenCenterPosition()
end

---@return Vector
function TSIL.UI.GetScreenTopCenterPosition()
end

---@return Vector
function TSIL.UI.GetScreenTopLeftPos()
end

---@return Vector
function TSIL.UI.GetScreenTopRightPos()
end

---A semi-generic deep cloner. It will recursively copy all of the values so that none
---of the nested references remain.
---
---Supports the following object types:
---
---* Primitives (i.e, strings, numbers, and booleans)
---* Tables
---* Dictionaries
---* BitSet128 objects
---* Color objects
---* KColor objects
---* RNG objects
---* Vector objects
---
---It does not support:
---
---* Dictionaries with values of nil
---* Other Isaac API classes such as `EntityPtr`
---@generic T
---@param value T
---@param serializationType SerializationType
---@return T
function TSIL.Utils.DeepCopy.DeepCopy(value, serializationType, copies)
end

--- Check https://easings.net/#easeInSine
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInSine(x)
end

--- Check https://easings.net/#easeOutSine
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutSine(x)
end

--- Check https://easings.net/#easeInOutSine
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutSine(x)
end

--- Check https://easings.net/#easeInQuad
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInQuad(x)
end

--- Check https://easings.net/#easeOutQuad
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutQuad(x)
end

--- Check https://easings.net/#easeInOutQuad
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutQuad(x)
end

--- Check https://easings.net/#easeInCubic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInCubic(x)
end

--- Check https://easings.net/#easeOutCubic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutCubic(x)
end

--- Check https://easings.net/#easeInOutCubic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutCubic(x)
end

--- Check https://easings.net/#easeInQuart
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInQuart(x)
end

--- Check https://easings.net/#easeOutQuart
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutQuart(x)
end

--- Check https://easings.net/#easeInOutQuart
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutQuart(x)
end

--- Check https://easings.net/#easeInQuint
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInQuint(x)
end

--- Check https://easings.net/#easeOutQuint
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutQuint(x)
end

--- Check https://easings.net/#easeInOutQuint
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutQuint(x)
end

--- Check https://easings.net/#easeInExpo
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInExpo(x)
end

--- Check https://easings.net/#easeOutExpo
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutExpo(x)
end

--- Check https://easings.net/#easeInOutExpo
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutExpo(x)
end

--- Check https://easings.net/#easeInCirc
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInCirc(x)
end

--- Check https://easings.net/#easeOutCirc
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutCirc(x)
end

--- Check https://easings.net/#easeInOutCirc
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutCirc(x)
end

--- Check https://easings.net/#easeInBack
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInBack(x)
end

--- Check https://easings.net/#easeOutBack
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutBack(x)
end

--- Check https://easings.net/#easeInOutBack
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutBack(x)
end

--- Check https://easings.net/#easeInElastic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInElastic(x)
end

--- Check https://easings.net/#easeOutElastic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutElastic(x)
end

--- Check https://easings.net/#easeInOutElastic
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutElastic(x)
end

--- Check https://easings.net/#easeInBounce
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInBounce(x)
end

--- Check https://easings.net/#easeOutBounce
---@param x number
---@return number
function TSIL.Utils.Easings.EaseOutBounce(x)
end

--- Check https://easings.net/#easeInOutBounce
---@param x number
---@return number
function TSIL.Utils.Easings.EaseInOutBounce(x)
end

--- Adds the given flag to another one.
---@param flags integer
---@param ... integer
---@return integer
function TSIL.Utils.Flags.AddFlags(flags, ...)
end

---Helper function to count all the set bits in a mask
---@param mask integer
---@return integer
function TSIL.Utils.Flags.CountBits(mask)
end

--- Checks whether a given flag has all of the other given flags.
---@param flags integer
---@param ... integer
---@return boolean
function TSIL.Utils.Flags.HasFlags(flags, ...)
end

--- Removes the given flags from another one.
---@param flags integer
---@param ... integer
---@return integer
function TSIL.Utils.Flags.RemoveFlags(flags, ...)
end

--- Runs a function the next time a callback is triggered. After it gets called once, it is removed
---@param mod table
---@param callback ModCallbacks | CustomCallback
---@param funct function
---@param optionalParam any?
function TSIL.Utils.Functions.RunNextCallback(mod, callback, funct, optionalParam)
end

--- Runs a given function on the next `POST_NEW_LEVEL` callback.
---@param funct function
---@param ... any
function TSIL.Utils.Functions.RunNextLevel(funct, ...)
end

--- Runs a given function on the next `POST_NEW_ROOM` callback.
---@param funct function
---@param ... any
function TSIL.Utils.Functions.RunNextRoom(funct, ...)
end

--- Runs a function in a given number of frames.
---@param funct function
---@param frames integer
---@param ... any
function TSIL.Utils.Functions.RunInFrames(funct, frames, ...)
end

--- Runs a function in a given number of frames.
--- 
--- Unlike `TSIL.Utils.Functions.RunInFrames` this will not persist when moving to a different room.
---@param funct function
---@param frames integer
---@param ... any
function TSIL.Utils.Functions.RunInFramesTemporary(funct, frames, ...)
end

--- Returns whether a given rectangle is intersecting a given circle.
---@param RectPos Vector @Center of the rectangle
---@param RectSize Vector
---@param CirclePos Vector @Center of the circle
---@param CircleSize number
---@return boolean
function TSIL.Utils.Math.IsCircleIntersectingWithRectangle(RectPos, RectSize, CirclePos, CircleSize)
end

--- Helper function to clamp a number into a range.
---@param a number
---@param min number
---@param max number
---@return number
function TSIL.Utils.Math.Clamp(a, min, max)
end

---Helper function to check if a point is inside a rectangle.
---
---Also works with rotated rectangles.
---@param pos Vector
---@param topLeft Vector
---@param topRight Vector
---@param bottomRight Vector
---@return boolean
function TSIL.Utils.Math.IsInRectangle(pos, topLeft, topRight, bottomRight)
end

--- Helper function to lineally interpolate between two numbers.
---@param a number
---@param b number
---@param t number
---@return number
function TSIL.Utils.Math.Lerp(a, b, t)
end

--- Rounds a number to the closest number of decimal places given.
--- 
--- Defaults to rounding to the nearest integer.
---@param n number
---@param decimalPlaces integer? @Default: 0
---@return number
function TSIL.Utils.Math.Round(n, decimalPlaces)
end

---Helper function to get the scalar product of 2 vectors.
---
---The scalar product is defined as `v1.X * v2.X + v1.Y * v2.Y`
---@param v1 Vector
---@param v2 Vector
---@return number
function TSIL.Utils.Math.ScalarProduct(v1, v2)
end

---Helper function to check if a string ends  with a given suffix.
---@param s string
---@param suffix string
---@return boolean
function TSIL.Utils.String.EndsWith(s, suffix)
end

---Helper function that splits a string into parts based on the given separator.
---
---For example, splitting the string "Hello there, world!" with separator " " will return ["Hello", "there,", "world!"]
---@param s string
---@param separator string
---@return string[]
function TSIL.Utils.String.Split(s, separator)
end

---Helper function to check if a string starts with a given prefix.
---@param s string
---@param prefix string
---@return boolean
function TSIL.Utils.String.StartsWith(s, prefix)
end

---Helper function to remove a given prefix from a string.
---@param s string
---@param prefix string
---@return string
function TSIL.Utils.String.TrimPrefix(s, prefix)
end

--- Helper function to check if all the elements of a table match a given predicate.
---@generic T:any
---@param toCheck T[]
---@param predicate fun(key: integer | string, value: T): boolean
---@return boolean
function TSIL.Utils.Tables.All(toCheck, predicate)
end

---Constructs a dictionary from a table. Note that the value of each key is set to true.
---@generic T
---@param oldTable T[]
---@return table<T, boolean>
function TSIL.Utils.Tables.ConstructDictionaryFromTable(oldTable)
end

--- Returns a safe copy of a table.
--- 
--- It copies the tables inside it recursively.
---@param toCopy table
---@return table
function TSIL.Utils.Tables.Copy(toCopy)
end

---Helper function to copy specific values from a userdata to a table.
---@param object unknown
---@param keys string[]
---@param map table<string, unknown>
function TSIL.Utils.Tables.CopyUserdataValuesToTable(object, keys, map)
end

--- Counts how many elements are on a given table that match a predicate.
--- 
--- If no predicate is given, it'll count all the elements.
---@generic T:any
---@param toCount T[]
---@param predicate fun(key: integer | string, value: T): boolean @Default: foo() -> true
---@return integer
function TSIL.Utils.Tables.Count(toCount, predicate)
end

--- Helper function for determining if two arrays contain the exact same elements. 
---@generic T: any
---@param table1 T[]
---@param table2 T[]
---@return boolean
function TSIL.Utils.Tables.Equals(table1, table2)
end

--- Filters a table given a predicate
---@generic T:any
---@param toFilter T[]
---@param predicate fun(key: integer | string, value: T): boolean
---@return T[]
function TSIL.Utils.Tables.Filter(toFilter, predicate)
end

--- Returns the first value of a table that matches a given predicate.
--- 
--- If it doesn't find any, it returns nil.
---@generic T : any
---@param toFind T[]
---@param predicate fun(key: integer | string, value: T): boolean
---@return T?
function TSIL.Utils.Tables.FindFirst(toFind, predicate)
end

--- Executes a function for each key-value pair of a table
---@generic T:any
---@param toIterate T[] 
---@param funct fun(index: string|integer, value:T)
function TSIL.Utils.Tables.ForEach(toIterate, funct)
end

---Returns a list of keys a dictionary has.
---@generic K
---@generic V
---@param dictionary table<K, V>
---@return K[]
function TSIL.Utils.Tables.GetDictionaryKeys(dictionary)
end

---Helper function to safely get number values from specific keys on a Lua table. Will throw an
---error if the specific value does not exist on the table or if it cannot be converted to a number.
---
---This function is variadic, meaning that you can specify N arguments to get N values.
---@param map table<string, unknown>
---@param objectName string
---@vararg string
---@return number[]
function TSIL.Utils.Tables.GetNumbersFromTable(map, objectName, ...)
end

---Helper function to check if the given object is a table with non
---consecutive number keys.
---
---This is useful since this kind of table doesn't get properly serialized 
---by the save manager.
---@param object unknown
---@return boolean
function TSIL.Utils.Tables.HasNonConsecutiveNumberKeys(object)
end

--- Returns if the provided table is an array. This is a workaround as Lua has no formal way to differentiate between a normal array and a map.
---@param object unknown
---@return boolean
function TSIL.Utils.Tables.IsArray(object)
end

---Helper function to check if a table is empty. Use this instead of checking for
---a size of 0 with the `#` operator since this will take into account dictionaries.
---@param map table
---@return boolean
function TSIL.Utils.Tables.IsEmpty(map)
end

--- Returns whether a given element is on a table
---@generic T:any
---@param list T[]
---@param element T
---@return boolean
function TSIL.Utils.Tables.IsIn(list, element)
end

---Helper function to iterate over a table deterministically. This is useful because by default, the
---`pairs` function will return the keys of a Lua table in a random order.
---
---This function will sort the table entries based on the value of the key.
---
---This function will only work on tables that have number keys or string keys. It will throw a
---run-time error if it encounters a key of another type.
---@generic K
---@generic V
---@param map table<K, V> @The table to iterate over
---@param func fun(key: K, value: V) @The function to run for each iteration 
---@param inOrder? boolean @Default: true | Whether to iterate in order. You can dynamically set to false in situations where iterating randomly would not matter and you need the extra performance.
function TSIL.Utils.Tables.IterateTableInOrder(map, func, inOrder)
end

--- Creates a new table where each element is the result of applying
--- a given function to each element of the provided list.
---@generic T any
---@generic S any
---@param list T[]
---@param funct fun(index: string|integer, value:T) : S
---@return S[]
function TSIL.Utils.Tables.Map(list, funct)
end

---Takes the values from a new table and recursively merges them into an old object (while
---performing appropriate deserialization).
---
---This function is used to merge incoming data from the "save#.dat" file into a mod's variables.
---Merging is useful instead of blowing away a table entirely because mod code often relies on the
---local table/object references.
---deserialization on the objects within. In other words, unlike the `DeepCopy` function, the
---This function always assumes that the new table is serialized data and will attempt to perform
---`Merge` function will always operates in the mode of `SerializationType.DESERIALIZE`. For the
---types of objects that will be deserialized, see the documentation for the `DeepCopy` function.
---
---This function does not iterate over the old object, like you would naively expect. This is
---because it is common for a variable to have a type of `something | nil`. If this is the case,
---the key would not appear when iterating over the old object. Thus, we must instead iterate over the new
---object and copy the values backwards. The consequence of this is that `Merge` can copy over old
---variables that are no longer used in the code, or copy over old variables of a different type,
---which can cause run-time errors. In such cases, users will have to manually delete their save
---data.
---@param oldObject table<any, unknown> @The old table to merge the values into.
---@param newTable table<any, unknown> @The new table to merge the values from. This must be a Lua table that represents serialized data. In other words, it should be created with the `DeepCopy` function using `SerializationType.SERIALIZE`.
function TSIL.Utils.Tables.Merge(oldObject, newTable)
end

--- Shallow copies and removes the specified element(s) from the table. Returns the copied table. If
--- the specified element(s) are not found in the table, it will simply return a shallow copy of the
--- table.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
--- 
--- If there is more than one matching element in the table, this function will only remove the first
--- matching element. If you want to remove all of the elements, use the `RemoveAll` function
--- instead.
---@generic T 
---@param originalTable T[]
---@vararg any
---@return T[]
function TSIL.Utils.Tables.Remove(originalTable, ...)
end

--- Shallow copies and removes the specified element(s) from the table. Returns the copied table. If
--- the specified element(s) are not found in the table, it will simply return a shallow copy of the
--- table.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
--- 
--- If there is more than one matching element in the table, this function will remove every matching
--- element. If you want to only remove the first matching element, use the `Remove` function instead.
---@generic T 
---@param originalTable T[]
---@vararg any
---@return T[]
function TSIL.Utils.Tables.RemoveAll(originalTable, ...)
end

--- Removes all of the specified element(s) from the table. If the specified element(s) are not found
--- in the table, this function will do nothing.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
--- 
--- If there is more than one matching element in the table, this function will remove every matching
--- element. If you want to only remove the first matching element, use the `RemoveInPlace`
--- function instead.
---@generic T 
---@param originalTable T[]
---@vararg any
---@return boolean # True if one or more elements were removed, false otherwise. 
function TSIL.Utils.Tables.RemoveAllInPlace(originalTable, ...)
end

--- Removes the specified element(s) from the table. If the specified element(s) are not found in the
--- table, this function will do nothing.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
---  
--- If there is more than one matching element in the table, this function will only remove the first
--- matching element. If you want to remove all of the elements, use the `RemoveAllInPlace` function
--- instead.
---@param originalTable any
---@vararg any
---@return boolean @True if one or more elements were removed, false otherwise. 
function TSIL.Utils.Tables.RemoveInPlace(originalTable, ...)
end

--- Runs the provided callback for the provided table. Returns true if the callback returns true for
--- at least one element in the table.
---@generic K
---@generic V
---@param tbl table<K, V>
---@param predicate fun(value: V, index: K, tbl: table<K, V>): boolean
---@return boolean
function TSIL.Utils.Tables.Some(tbl, predicate)
end

---Helper function to check if a Lua table has all of the provided keys.
---This function is variadic, meaning that you can specify as many arguments as you want to check for.
---@param map table<any, unknown>
---@vararg string
function TSIL.Utils.Tables.TableHasKeys(map, ...)
end

---Helper function to copy a `Vector` Isaac API class.
---@param vector Vector
---@return Vector
function TSIL.Vector.CopyVector(vector)
end

---Helper function to check if two vectors are exactly equal.
---@param v1 Vector
---@param v2 Vector
---@return boolean
function TSIL.Vector.VectorEquals(v1, v2)
end

---Helper function to see if two vectors are equal within the given tolerance `epsilon`.
---@param v1 Vector
---@param v2 Vector
---@param epsilon number? @Default: 0.001 | The tolerance to use when comparing the vectors.
---@return boolean
function TSIL.Vector.VectorFuzzyEquals(v1, v2, epsilon)
end

--- Returns a random vector between (-1, -1) and (1, 1). You can get a larger vector by multiplying
--- the returned vector.
---
--- Unlike `RandomVector()`, this function supports seeding.
---@param seedOrRNG? integer | RNG Optional. The seed or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called. Default is `GetRandomSeed`
function TSIL.Vector.GetRandomVector(seedOrRNG)
end

---Helper function to see if a vector has a length greater than zero within the given tolerance `epsilon`.
---@param v Vector
---@param epsilon number? @Default: 0.001 | The tolerance of how close to zero the vector can be.
---@return boolean
function TSIL.Vector.VectorHasLength(v, epsilon)
end

--- Returns a direction corresponding to the direction the provided vector is pointing.
---@param vector Vector
---@return Direction
function TSIL.Vector.VectorToDirection(vector)
end

