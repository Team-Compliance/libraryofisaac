--- Returns n randomly selected elements from a table.
---@generic T any
---@param toChoose T[]
---@param numberOfElements? integer @Default: 1
---@param seedOrRNG integer | RNG? @Default: `TSIL.RNG.GetRandomSeed()` | The `Seed` or `RNG` object to use. If an `RNG` object is provided, the `RNG.Next` method will be called.
---@return T[]
function TSIL.Random.GetRandomElementsFromTable(toChoose, numberOfElements, seedOrRNG)
	---@type RNG
    local rng
    
    if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
        ---@cast seedOrRNG RNG
        rng = seedOrRNG
    else
        ---@cast seedOrRNG number | nil
        rng = TSIL.RNG.NewRNG(seedOrRNG)
    end

	if numberOfElements == nil then
		numberOfElements = 1
	end

	local tableSize = TSIL.Utils.Tables.Count(toChoose, function (_, _)
		return true
	end)

	local leftInTable = tableSize
	local leftToChoose = numberOfElements

	local choices = {}

	for index, value in pairs(toChoose) do
		if rng:RandomFloat() < leftToChoose/leftInTable then
			table.insert(choices, value)
			leftToChoose = leftToChoose - 1
		end

		leftInTable = leftInTable - 1
	end

	return choices
end