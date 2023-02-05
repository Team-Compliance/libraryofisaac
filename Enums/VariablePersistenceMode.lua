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