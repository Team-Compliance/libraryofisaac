local RECOMMENDED_SHIFT_IDX = 35

--- Helper function to set a seed to an RNG object using Blade's recommended shift index.
---@param rng RNG
---@param seed integer
function TSIL.RNG.SetSeed(rng, seed)
    assert(seed ~= 0, "You cannot set an RNG object to a seed of 0 or the game will crash.")
    rng:SetSeed(seed, RECOMMENDED_SHIFT_IDX)
end