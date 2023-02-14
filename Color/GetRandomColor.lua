---Helper function to get a random color.
---
---Only randomizes the R, G and B fields.
---@param seedOrRNG? integer | RNG @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called.
---@param alpha number? @Default: 1 | The alpha value to use.
---@return Color
function TSIL.Color.GetRandomColor(seedOrRNG, alpha)
    seedOrRNG = seedOrRNG or TSIL.RNG.GetRandomSeed()

    ---@type RNG
    local rng

    if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
        ---@cast seedOrRNG RNG
        rng = seedOrRNG
    else
        ---@cast seedOrRNG integer?
        rng = TSIL.RNG.NewRNG(seedOrRNG)
    end

    local r = TSIL.Random.GetRandom(rng)
    local g = TSIL.Random.GetRandom(rng)
    local b = TSIL.Random.GetRandom(rng)

    return Color(r, g, b, alpha)
end
