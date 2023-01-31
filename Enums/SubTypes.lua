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
