--- Returns a random value from a weighted list of possibilities.
--- Each choice must be given as a pair of chance and value.
--- 
--- `{chance = x, value = y}`
---@generic T any
---@param seedOrRNG integer | RNG
---@param possibles {chance : number, value : T}[]
---@return T
function TSIL.Random.GetRandomElementFromWeightedList(seedOrRNG, possibles)
	---@type RNG
	local rng

	if type(seedOrRNG) == "number" then
		rng = RNG()
		rng:SetSeed(seedOrRNG, 35)
	else
		---@cast seedOrRNG RNG
		rng = seedOrRNG
	end

	local totalChance = 0
	for _, possibility in ipairs(possibles) do
		totalChance = totalChance + possibility.chance
	end

	local randomChance = TSIL.Random.GetRandomFloat(0, totalChance, rng)
	local cumulativeChance = 0
	local result = nil

	for _, possibility in ipairs(possibles) do
		cumulativeChance = cumulativeChance + possibility.chance

		if cumulativeChance > randomChance then
			result = possibility.value
			break
		end
	end

	return result
end