---Copies an `RNG` object
---@param rng RNG
---@return RNG
function TSIL.RNG.CopyRNG(rng)
    local seed = rng:GetSeed()
    return TSIL.RNG.NewRNG(seed)
end
