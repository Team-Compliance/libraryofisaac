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
