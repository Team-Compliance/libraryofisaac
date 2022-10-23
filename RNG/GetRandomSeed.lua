---Helper function to get a random `Seed` value to be used in spawning entities and so on. Use this
---instead of calling the `Random` function directly since that can return a value of 0 and crash
---the game.
---@return integer
function TSIL.RNG.GetRandomSeed()
    local randomNumber = Random()
    local safeRandomNumber = math.max(1, randomNumber) -- Ensure the seed can never be 0.
    return safeRandomNumber
end