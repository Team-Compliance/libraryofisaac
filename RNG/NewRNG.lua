---Helper function to initialize an RNG object using Blade's recommended shift index.
---@param seed integer? The seed to initialize it with. Default is `TSIL.RNG.GetRandomSeed`
---@return RNG
function TSIL.RNG.NewRNG(seed)
    seed = seed or TSIL.RNG.GetRandomSeed()
    local rng = RNG()
    TSIL.RNG.SetSeed(rng, seed)
    return rng
end
