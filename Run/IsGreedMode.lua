---Helper function to check if the current run is a greed run.
---@return boolean
function TSIL.Run.IsGreedMode()
    local difficulty = Game().Difficulty

    return difficulty == Difficulty.DIFFICULTY_GREED or
    difficulty == Difficulty.DIFFICULTY_GREEDIER
end