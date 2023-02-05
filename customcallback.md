# CustomCallback

## Calbacks

### ENTITY_TAKE_DMG_FILTER

Works exactly the same as the regular `ENTITY_TAKE_DMG` callback but let's you specify more arguments for filtering. 
Return true or nil to sustain the damage. Return false to ignore it. 

#### Callback parameters

| Name | Type |
| - | - |
| tookDamage | Entity |
| amount | number |
| source | EntityRef |
| countdown | integer |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### POST_AMBUSH_FINISHED

Called whenever on the first frame a challenge room or a boss rush is started. Internally it's called the first frame `Room.IsAmbushDone` is true. 

#### Callback parameters

| Name | Type |
| - | - |
| ambushType | AmbushType |

#### Optional arguments

| Name | Type |
| - | - |
| ambushType | AmbushType |


### POST_AMBUSH_STARTED

Called whenever on the first frame a challenge room or a boss rush is started. Internally it's called the first frame `Room.IsAmbushDone` is true. 

#### Callback parameters

| Name | Type |
| - | - |
| ambushType | AmbushType |

#### Optional arguments

| Name | Type |
| - | - |
| ambushType | AmbushType |


### POST_BOMB_EXPLODED

Called when a bomb explodes. More specifically, this is called whenever a bomb plays it's `Explode` animation. 

#### Callback parameters

| Name | Type |
| - | - |
| bomb | EntityBomb |

#### Optional arguments

| Name | Type |
| - | - |
| bombVariant | BombVariant |
| bombSubType | integer |


### POST_BOMB_INIT_LATE

Called the first frame a bomb is available. This is useful since the `POST_BOMB_INIT` callback doesn't let you access all of the bomb's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| bomb | EntityBomb |

#### Optional arguments

| Name | Type |
| - | - |
| bombVariant | BombVariant |
| bombSubType | integer |


### POST_BONE_SWING

Called whenever a bone club (EntityType.ENTITY_KNIFE, KnifeVariant.BONE_CLUB) plays any of it's swing animations. 

#### Callback parameters

| Name | Type |
| - | - |
| boneClub | EntityKnife |


### POST_COLLECTIBLE_EMPTY

Called the first frame a pedestal is empty. 

#### Callback parameters

| Name | Type |
| - | - |
| pedestal | EntityPickup |
| oldCollectibleType | CollectibleType |

#### Optional arguments

| Name | Type |
| - | - |
| collectibleType | CollectibleType |


### POST_COLLECTIBLE_INIT_FIRST

Called from the `POST_PICKUP_INIT` the first time a pedestal is encountered. 
This is useful since pickups trigger the `POST_PICKUP_INIT` callback when they respawn when room is reentered and, when playing T.Isaac, everytime they shift 

#### Callback parameters

| Name | Type |
| - | - |
| collectible | EntityPickup |

#### Optional arguments

| Name | Type |
| - | - |
| collectibleType | CollectibleType |


### POST_DICE_ROOM_ACTIVATED

Called when a player enters the radius of activation of a dice floor. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| diceFloorType | DiceFloorSubType |

#### Optional arguments

| Name | Type |
| - | - |
| diceFloorType | DiceFloorSubType |


### POST_DOOR_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each door. 

#### Callback parameters

| Name | Type |
| - | - |
| door | GridEntityDoor |

#### Optional arguments

| Name | Type |
| - | - |
| doorVariant | DoorVariant |


### POST_DOOR_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each door. 

#### Callback parameters

| Name | Type |
| - | - |
| door | GridEntityDoor |

#### Optional arguments

| Name | Type |
| - | - |
| doorVariant | DoorVariant |


### POST_EFFECT_INIT_LATE

Called the first frame an effect entity is available. This is useful since the `POST_EFFECT_INIT` callback doesn't let you access all of the effect's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| effect | EntityEffect |

#### Optional arguments

| Name | Type |
| - | - |
| effectVariant | EffectVariant |
| effectSubType | integer |


### POST_EFFECT_STATE_CHANGED

Called everytime an effect entity's state changes. 

#### Callback parameters

| Name | Type |
| - | - |
| effect | EntityEffect |
| oldState | integer |
| newState | integer |

#### Optional arguments

| Name | Type |
| - | - |
| effectVariant | EffectVariant |
| effectSubType | integer |


### POST_ESAU_JR

Called whenever a player transforms into esau jr. 
This is useful because the player doesn't actually tranform into esau jr. until the next frame of using the item. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_FAMILIAR_INIT_LATE

Called the first frame a familiar is available. This is useful since the `POST_FAMILIAR_INIT` callback doesn't let you access all of the familiar's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| familiar | EntityFamiliar |

#### Optional arguments

| Name | Type |
| - | - |
| familiarVariant | FamiliarVariant |
| familiarSubType | integer |


### POST_FAMILIAR_STATE_CHANGED

Called everytime a familiar's state changes. 

#### Callback parameters

| Name | Type |
| - | - |
| familiar | EntityFamiliar |
| oldState | integer |
| newState | integer |

#### Optional arguments

| Name | Type |
| - | - |
| familiarVariant | FamiliarVariant |
| familiarSubType | integer |


### POST_FIRST_ESAU_JR

Called the first time a player transforms into esau jr in a run. 
This is useful because the esau jr.'s entity player is not accessible before it is created. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_FIRST_FLIP

Called the first time a T.Lazarus player uses flip on a run. 
This is useful because there is no way of getting the flipped player entity before actually using the Flip item. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_FLIP

Called whenever a T.Lazarus player uses flip. 
This is useful because the unlike the `POST_USE_ITEM` callback, this provides the new lazarus player. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_GAME_STARTED_REORDERED

Similar to the vanilla `POST_GAME_STARTED` callback, but fires in the expected order in relation to the new level/room callbacks. 
GAME_STARTED_REORDERED -> NEW_LEVEL_REORDERED -> NEW_ROOM_REORDERED 

#### Callback parameters

| Name | Type |
| - | - |
| isContinued | boolean |


### POST_GAME_STARTED_REORDERED_LAST

Fires last in relation to the other reordered callbacks, so you can execute code after all other run initialization code has finished. 

#### Callback parameters

| Name | Type |
| - | - |
| isContinued | boolean |


### POST_GREED_MODE_WAVE

Called whenever the greed wave counter increases. 

#### Callback parameters

| Name | Type |
| - | - |
| oldWave | integer |
| newWave | integer |


### POST_GRID_COLLISION

Called whenever an entity collides with a Grid Entity. 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntity | GridEntity |
| collider | Entity |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |
| colliderType | EntityType |
| colliderVariant | integer |
| colliderSubType | integer |


### POST_GRID_ENTITY_BROKEN

Called when a Grid Entity changes into an state that represents it's broken. 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntity | GridEntity |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |


### POST_GRID_ENTITY_INIT

Called when a new Grid Entity is created, either from the `NEW_ROOM_REORDERED` callback or from the `POST_UPDATE` callback, when a new Grid Entity is created mid-way through the room 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntity | GridEntity |
| createdMidWay | boolean |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |


### POST_GRID_ENTITY_REMOVED

Called when a Grid Entity is removed. 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |
| gridIndex | integer |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |


### POST_GRID_ENTITY_RENDER

Called from the `POST_RENDER` callback for each Grid Entity in the room. 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntity | GridEntity |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |


### POST_GRID_ENTITY_STATE_CHANGED

Called whenever a Grid Entity's state changes. 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntity | GridEntity |
| oldState | integer |
| newState | integer |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |


### POST_GRID_ENTITY_UPDATE

Called from the `POST_UPDATE` callback for each Grid Entity in the room. 

#### Callback parameters

| Name | Type |
| - | - |
| gridEntity | GridEntity |

#### Optional arguments

| Name | Type |
| - | - |
| gridEntityType | GridEntityType |
| gridEntityVariant | integer |


### POST_HOLY_MANTLE_REMOVED

Called whenever a player's holy mantle effect count decreases. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| oldHolyMantleNum | integer |
| newHolyMantleNum | integer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


### POST_ITEM_DISCHARGE

Called whenever a player loses charge on their active item. 
This is useful because throwable items don't actually discharge until they are thrown. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| collectibleType | CollectibleType |
| activeSlot | ActiveSlot |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| collectibleType | CollectibleType |


### POST_ITEM_PICKUP

Called whenever an item exits a player's item queue. i.e. when it enters the player inventory 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| itemID | CollectibleType | TriketType |
| itemType | InventoryType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| itemID | CollectibleType | TriketType |
| itemType | InventoryType |


### POST_KNIFE_INIT_LATE

Called the first frame a knife is available. This is useful since the `POST_KNIFE_INIT` callback doesn't let you access all of the knife's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| knife | EntityKnife |

#### Optional arguments

| Name | Type |
| - | - |
| knifeVariant | KnifeVariant |
| knifeSubType | integer |


### POST_LASER_INIT_LATE

Called the first frame a laser is available. This is useful since the `POST_LASER_INIT` callback doesn't let you access all of the laser's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| laser | EntityLaser |

#### Optional arguments

| Name | Type |
| - | - |
| laserVariant | LaserVariant |
| laserSubType | integer |


### POST_NEW_LEVEL_REORDERED

Similar to the vanilla `POST_NEW_LEVEL` callback, but fires in the expected order in relation to the new game/room callbacks. 
GAME_STARTED_REORDERED -> NEW_LEVEL_REORDERED -> NEW_ROOM_REORDERED 

### POST_NEW_ROOM_EARLY

Called from the `POST_NEW_ROOM` or `PRE_ENTITY_SPAWN` callback where being in a new room is detected. 
This is useful because the `POST_NEW_ROOM` callback only gets called after all the entities have been updated once. 

### POST_NEW_ROOM_REORDERED

Similar to the vanilla `POST_NEW_ROOM` callback, but fires in the expected order in relation to the new game/level callbacks. 
GAME_STARTED_REORDERED -> NEW_LEVEL_REORDERED -> NEW_ROOM_REORDERED 

### POST_NPC_DEATH_FILTER

Works exactly the same as the regular `POST_NPC_DEATH` callback but let's you specify more arguments for filtering. 

#### Callback parameters

| Name | Type |
| - | - |
| entity | EntityNPC |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### POST_NPC_INIT_FILTER

Works exactly the same as the regular `POST_NPC_INIT` callback but let's you specify more arguments for filtering. 

#### Callback parameters

| Name | Type |
| - | - |
| entity | EntityNPC |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### POST_NPC_INIT_LATE

Called the first frame an npc is available. This is useful since the `POST_NPC_INIT` callback doesn't let you access all of the npc's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| npc | EntityNPC |

#### Optional arguments

| Name | Type |
| - | - |
| npcType | EntityType |
| npcVariant | integer |
| npcSubType | integer |


### POST_NPC_RENDER_FILTER

Works exactly the same as the regular `POST_NPC_RENDER` callback but let's you specify more arguments for filtering. 

#### Callback parameters

| Name | Type |
| - | - |
| entity | EntityNPC |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### POST_NPC_STATE_CHANGED

Called whenever an npc's state changes. 

#### Callback parameters

| Name | Type |
| - | - |
| npc | EntityNPC |
| oldState | integer |
| newState | integer |

#### Optional arguments

| Name | Type |
| - | - |
| npcType | EntityType |
| npcVariant | integer |
| npcSubType | integer |


### POST_NPC_UPDATE_FILTER

Works exactly the same as the regular `POST_NPC_UPDATE` callback but let's you specify more arguments for filtering. 

#### Callback parameters

| Name | Type |
| - | - |
| entity | EntityNPC |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### POST_PEFFECT_UPDATE_REORDERED

Similar to the vanilla `POST_PEFFECT_UPDATE` callback but only gets called after the run initialization callbacks have been executed. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_PICKUP_COLLECT

Called the first frame a pickup starts playing it's `Collect` animation. 

#### Callback parameters

| Name | Type |
| - | - |
| pickup | EntityPickup |

#### Optional arguments

| Name | Type |
| - | - |
| pickupVariant | PickupVariant |
| pickupSubType | integer |


### POST_PICKUP_INIT_FIRST

Called from the `POST_PICKUP_INIT` the first time a pickup is encountered 
This is useful since pickups respawn every time a room is reentered and trigger the `POST_PICKUP_INIT` callback. 

#### Callback parameters

| Name | Type |
| - | - |
| pickup | EntityPickup |

#### Optional arguments

| Name | Type |
| - | - |
| pickupVariant | PickupVariant |
| pickupSubType | integer |


### POST_PICKUP_INIT_LATE

Called the first frame a familiar is available. This is useful since the `POST_FAMILIAR_INIT` callback doesn't let you access all of the familiar's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| pickup | EntityPickup |

#### Optional arguments

| Name | Type |
| - | - |
| pickupVariant | PickupVariant |
| pickupSubType | integer |


### POST_PICKUP_STATE_CHANGED

Called everytime an entity pickup's state changes. 

#### Callback parameters

| Name | Type |
| - | - |
| pickup | EntityPickup |
| oldState | integer |
| newState | integer |

#### Optional arguments

| Name | Type |
| - | - |
| pickupVariant | PickupVariant |
| pickupSubType | integer |


### POST_PIT_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each pit. 

#### Callback parameters

| Name | Type |
| - | - |
| pit | GridEntityPit |

#### Optional arguments

| Name | Type |
| - | - |
| pitVariant | integer |


### POST_PIT_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each pit. 

#### Callback parameters

| Name | Type |
| - | - |
| pit | GridEntityPit |

#### Optional arguments

| Name | Type |
| - | - |
| pitVariant | integer |


### POST_PLAYER_COLLECTIBLE_ADDED

Called whenever an item is added to a player's inventory. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| collectibleType | CollectibleType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| collectibleType | CollectibleType |


### POST_PLAYER_COLLECTIBLE_REMOVED

Called whenever an item is removed from a player's inventory. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| collectibleType | CollectibleType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| collectibleType | CollectibleType |


### POST_PLAYER_FATAL_DAMAGE

Called from the `ENTITY_TAKE_DMG` callback when a player takes damage that would kill them. 
This function takes into account vanilla revive items and using The Bible on Satan. 
Return false to avoid the fatal damage. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| amount | number |
| damageFlags | DamageFlag |
| source | EntityRef |
| countdown | integer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


### POST_PLAYER_GULPED_TRINKET_ADDED

Called whenever a trinket is gulped to a player's inventory. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| trinketType | TrinketType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| trinketType | TrinketType |


### POST_PLAYER_GULPED_TRINKET_REMOVED

Called whenever a gulped trinket is removed from a player's inventory. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| trinketType | TrinketType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| trinketType | TrinketType |


### POST_PLAYER_HEALTH_CHANGED

Called whenever the player's health changes. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| healthType | HealthType |
| oldAmount | integer |
| newAmount | integer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| healthType | HealthType |


### POST_PLAYER_INIT_FIRST

Called from the `POST_PLAYER_INIT` callback, the first time it's called for each player. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


### POST_PLAYER_INIT_LATE

Called the first frame a player is available. This is useful since the `POST_PLAYER_INIT` callback doesn't let you access all of the player's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


### POST_PLAYER_RENDER_REORDERED

Similar to the vanilla `POST_PLAYER_RENDER` callback but only gets called after the run initialization callbacks have been executed. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_PLAYER_TYPE_CHANGED

Called whenever the player's type changes, via the Clicker item for example. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| oldPlayerType | PlayerType |
| newPlayerType | PlayerType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| oldPlayerType | PlayerType |


### POST_PLAYER_UPDATE_REORDERED

Similar to the vanilla `POST_PLAYER_UPDATE` callback but only gets called after the run initialization callbacks have been executed. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### POST_POOP_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each poop. 

#### Callback parameters

| Name | Type |
| - | - |
| poop | GridEntityPoop |

#### Optional arguments

| Name | Type |
| - | - |
| poopVariant | PoopGridEntityVariant |


### POST_POOP_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each poop. 

#### Callback parameters

| Name | Type |
| - | - |
| poop | GridEntityPoop |

#### Optional arguments

| Name | Type |
| - | - |
| poopVariant | PoopGridEntityVariant |


### POST_PRESSURE_PLATE_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each pressure plate. 

#### Callback parameters

| Name | Type |
| - | - |
| pressurePlate | GridEntityPressurePlate |

#### Optional arguments

| Name | Type |
| - | - |
| pressurePlateVariant | PressurePlateVariant |


### POST_PRESSURE_PLATE_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each pressure plate. 

#### Callback parameters

| Name | Type |
| - | - |
| pressurePlate | GridEntityPressurePlate |

#### Optional arguments

| Name | Type |
| - | - |
| pressurePlateVariant | PressurePlateVariant |


### POST_PROJECTILE_INIT_LATE

Called the first frame a projectile is available. This is useful since the `POST_PROJECTILE_INIT` callback doesn't let you access all of the projectile's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| projectile | EntityProjectile |

#### Optional arguments

| Name | Type |
| - | - |
| projectileVariant | ProjectileVariant |
| projectileSubType | integer |


### POST_PURCHASE

Called whenever the player purchases an item. 
Internally this detects whenever a player starts holding an item and searches for any pickups with a non-zero price that no longer exist. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| purchasedPickup | EntityPickup |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| pickupVariant | PickupVariant |
| pickupSubType | integer |


### POST_ROCK_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each rock. 

#### Callback parameters

| Name | Type |
| - | - |
| rock | GridEntityRock |

#### Optional arguments

| Name | Type |
| - | - |
| rockType | GridEntityType |
| rockVariant | integer |


### POST_ROCK_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each rock. 

#### Callback parameters

| Name | Type |
| - | - |
| rock | GridEntityRock |

#### Optional arguments

| Name | Type |
| - | - |
| rockType | GridEntityType |
| rockVariant | integer |


### POST_ROOM_CLEAR_CHANGED

Called whenever the clear state of a room changes. 

#### Callback parameters

| Name | Type |
| - | - |
| isClear | boolean |

#### Optional arguments

| Name | Type |
| - | - |
| clear | boolean |


### POST_SACRIFICE

Called whenever a player uses the spikes in a sacrifice room. 
Return false to avoid the damage. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| numSacrifices | integer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


### POST_SLOT_ANIMATION_CHANGED

Called whenever an slot's animation changes. 
Params 
 * slot - Entity  * oldAnimation - string  * newAnimation - string 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |


### POST_SLOT_DESTROYED

Called whenever an slot is destroyed. 
This can happen when a slot is destroyed by an explosion or when a slot pays out with an item. 
Params 
 * slot - Entity  * isPayingOut - boolean 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |


### POST_SLOT_INIT

Called the first frame a slot is available. 
Params 
 * slot - Entity 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |


### POST_SLOT_PRIZE

Called whenever an slot's sprite triggers its `Prize` or `Disappear` events. 
`Prize` is triggered by slot machines and beggars and `Disappear` is only triggered by beggars when they pay out their item. 
Params 
 * slot - Entity  * isDisappear - boolean 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |


### POST_SLOT_RENDER

Called from the `POST_RENDER` callback for every slot in the room. 
Params 
 * slot - Entity 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |


### POST_SLOT_UPDATE

Called from the `POST_UPDATE` callback for every slot in the room. 
Params 
 * slot - Entity 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |


### POST_SPIKES_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each spike. 

#### Callback parameters

| Name | Type |
| - | - |
| spikes | GridEntitySpikes |

#### Optional arguments

| Name | Type |
| - | - |
| spikesVariant | integer |


### POST_SPIKES_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each spike. 

#### Callback parameters

| Name | Type |
| - | - |
| spikes | GridEntitySpikes |

#### Optional arguments

| Name | Type |
| - | - |
| spikesVariant | integer |


### POST_TEAR_INIT_LATE

Called the first frame a tear is available. This is useful since the `POST_TEAR_INIT` callback doesn't let you access all of the tear's attributes. 

#### Callback parameters

| Name | Type |
| - | - |
| tear | EntityTear |

#### Optional arguments

| Name | Type |
| - | - |
| tearVariant | TearVariant |
| tearSubType | integer |


### POST_TEAR_INIT_VERY_LATE

Called the second frame a tear is available. This is useful since incubus tears are not distinguishable until the second frame. 

#### Callback parameters

| Name | Type |
| - | - |
| tear | EntityTear |

#### Optional arguments

| Name | Type |
| - | - |
| tearVariant | TearVariant |
| tearSubType | integer |


### POST_TNT_RENDER

Called from the `GRID_ENTITY_RENDER` callback for each TNT. 

#### Callback parameters

| Name | Type |
| - | - |
| tnt | GridEntityTNT |

#### Optional arguments

| Name | Type |
| - | - |
| tntVariant | integer |


### POST_TNT_UPDATE

Called from the `GRID_ENTITY_UPDATE` callback for each TNT. 

#### Callback parameters

| Name | Type |
| - | - |
| tnt | GridEntityTNT |

#### Optional arguments

| Name | Type |
| - | - |
| tntVariant | integer |


### POST_TRANSFORMATION_GAINED

Called whenever a player gains a transformation. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| transformation | PlayerForm |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| transformation | PlayerForm |


### POST_TRANSFORMATION_LOST

Called whenever a player loses a transformation. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| transformation | PlayerForm |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| transformation | PlayerForm |


### POST_TSIL_LOAD

Called whenever an instance of the library is finished loading. 
Used internally to make sure all of the library features are loaded 

### PRE_BERSERK_DEATH

Called when a player is about to exit the berserk state and will die when it ends. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


### PRE_GET_PEDESTAL

Called from the `PRE_PICKUP_COLLISION` whenever a player touches a pedestal and can collect it. 
Return true to ignore collision, false to collide but not execute internal code and nil to continue with internal code 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| collectible | EntityPickup |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| collectibleType | CollectibleType |


### PRE_ITEM_PICKUP

Called whenever an item enters a player's item queue. i.e. when they begin holding it. 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |
| itemID | CollectibleType | TriketType |
| itemType | InventoryType |

#### Optional arguments

| Name | Type |
| - | - |
| playerType | PlayerType |
| playerVariant | PlayerVariant |
| itemID | CollectibleType | TriketType |
| itemType | InventoryType |


### PRE_NEW_LEVEL

Called from the `POST_RENDER` callback, when a player is about to enter a trapdoor/heaven door. 
Doesn't get called when reloading the current room (Forget Me Now) or on the first floor of the run 

#### Callback parameters

| Name | Type |
| - | - |
| player | EntityPlayer |


### PRE_NPC_COLLISION_FILTER

Works exactly the same as the regular `PRE_NPC_COLLISION` callback but let's you specify more arguments for filtering. 
Return true to ignore collision, false to collide but not execute internal code and nil to continue with internal code 

#### Callback parameters

| Name | Type |
| - | - |
| entity | EntityNPC |
| collider | Entity |
| isLow | boolean |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### PRE_NPC_UPDATE_FILTER

Works exactly the same as the regular `PRE_NPC_UPDATE` callback but let's you specify more arguments for filtering. 
Return true to ignore internal AI. Return nil or false otherwise 

#### Callback parameters

| Name | Type |
| - | - |
| entity | EntityNPC |

#### Optional arguments

| Name | Type |
| - | - |
| entityType | EntityType |
| entityVariant | integer |
| entitySubType | integer |


### PRE_SLOT_COLLISION

Called from the `PRE_PLAYER_COLLISION` callback whenever the player collides with a slot. 
Params 
 * slot - Entity  * player - EntityPlayer 

#### Optional arguments

| Name | Type |
| - | - |
| slotVariant | SlotVariant |
| slotSubType | integer |
| playerType | PlayerType |
| playerVariant | PlayerVariant |


