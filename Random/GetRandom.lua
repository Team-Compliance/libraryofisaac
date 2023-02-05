---This returns a random float between 0 and 1. It is inclusive on the low end, but exclusive on the
---high end. (This is because the `RNG.RandomFloat` method will never return a value of exactly 1.)
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@return number
function TSIL.Random.GetRandom(seedOrRNG)
    ---@type RNG
    local rng

    if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
        ---@cast seedOrRNG RNG
        rng = seedOrRNG
    else
        ---@cast seedOrRNG number | nil
        rng = TSIL.RNG.NewRNG(seedOrRNG)
    end

    return rng:RandomFloat()
end