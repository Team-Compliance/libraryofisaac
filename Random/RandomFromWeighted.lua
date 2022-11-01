--- Returns a random value from a weighted list of possibilities.
--- Each choice must be given as a pair of chance and value.
--- 
--- `{chance = x, value = y}`
--- @generic T any
--- @param seedOrRNG integer | RNG
--- @param ... {chance : integer, value : T}
--- @return T
function TSIL.Utils.Random.GetRandomElementFromWeightedList(seedOrRNG, ...)
	local rng

	if type(seedOrRNG) == "number" then
		rng = RNG()
		rng:SetSeed(seedOrRNG, 35)
	else
		rng = seedOrRNG
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