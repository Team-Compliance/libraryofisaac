---@enum PitState
TSIL.Enums.PitState = {
	NORMAL = 0,

	--- Pits can become filled when nearby rocks are bombed into them.
	---
	--- Note that the ladder collectible does not change the state to this.
	FILLED = 1,
}
