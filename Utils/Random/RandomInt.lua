---Returns a random integer between 2 others.
---Inclusive in the low end and exclusive in the high end.
---@param rngOrSeed RNG | integer
---@param max integer
---@param min? integer @default: 0
---@return integer
function TSIL.Utils.Random.GetRandomIntInRange(rngOrSeed, max, min)
    local rng

    if type(rngOrSeed) == "number" then
        rng = RNG()
        rng:SetSeed(rngOrSeed, 35)
    else
        rng = rngOrSeed
    end

    if min == nil then
        min = 0
    end

    local maxForRNG = max - min

    local chosenNumber = rng:RandomInt(maxForRNG)

    return chosenNumber + min
end