---@enum VariablePersistenceMode
TSIL.Enums.VariablePersistenceMode = {
    NONE = 1,           --The save manager won't do anything with your variable

    RESET_ROOM = 2,     --The save manager will restore the default on a new room
    RESET_LEVEL = 3,    --The save manager will restore the default on a new level
    RESET_RUN = 4,      --The save manager will reset the default on a new run

    REMOVE_ROOM = 5,    --The save manager will remove your variable on a new room
    REMOVE_LEVEL = 6,   --The save manager will remove your varialbe on a new level
    REMOVE_RUN = 7      --The save manager will remove your variable on a new run
}