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
}


--To make sure our callbacks are named uniquely
local UNIQUE_PREFFIX = "TSIL_CUSTOM_CB_"
for key, value in pairs(TSIL.Enums.CustomCallback) do
	if value:sub(1, #UNIQUE_PREFFIX) == UNIQUE_PREFFIX then
		TSIL.Enums.CustomCallback[key] = UNIQUE_PREFFIX .. value
	end
end
