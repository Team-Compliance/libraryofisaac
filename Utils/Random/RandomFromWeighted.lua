---Returns a random value from a weighted list of possibilities.
---Each value must be given as a pair of chance and value.
---
---`{chance = x, value = y}`
---@param rngOrSeed RNG | integer
---@param ... {chance : integer, value : any}
---@return any
function TSIL.Utils.Random.GetRandomElementFromWeightedList(rngOrSeed, ...)
    local rng

    if type(rngOrSeed) == "number" then
        rng = RNG()
        rng:SetSeed(rngOrSeed, 35)
    else
        rng = rngOrSeed
    end

    local possibles = {...}

    local totalChance = 0
    for _, possibility in ipairs(possibles) do
        totalChance = totalChance + possibility.chance
    end

    local randomChance = rng:RandomInt(totalChance)
    local cumulativeChance = 0
    local result = nil

    for _, possibility in ipairs(possibles) do
        local chance = possibility.chance + cumulativeChance

        if chance < randomChance then
            result = possibility.value
            break
        end

        cumulativeChance = cumulativeChance + possibility.chance
    end

    return result
end