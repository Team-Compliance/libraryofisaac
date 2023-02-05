---This returns a random float between min and max.
---@param min number The lower bound for the random number (inclusive).
---@param max number The upper bound for the random number (exclusive)
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@return number
function TSIL.Random.GetRandomFloat(min, max, seedOrRNG)
    if min > max then
        local oldMin = min
        local oldMax = max
        min = oldMax
        max = oldMin
    end

    return min + TSIL.Random.GetRandom(seedOrRNG) * (max - min)
end