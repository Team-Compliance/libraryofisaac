--- Returns a random vector between (-1, -1) and (1, 1). You can get a larger vector by multiplying
--- the returned vector.
---
--- Unlike `RandomVector()`, this function supports seeding.
---@param seedOrRNG? integer | RNG Optional. The seed or `RNG` object to use. If an `RNG` object is provided, the `RNG:Next` method will be called. Default is `GetRandomSeed`
function TSIL.Vector.GetRandomVector(seedOrRNG)
	local rng

	if TSIL.IsaacAPIClass.IsRNG(seedOrRNG) then
		rng = seedOrRNG
	else
		---@diagnostic disable-next-line: param-type-mismatch
		rng = TSIL.RNG.NewRNG(seedOrRNG)
	end

	local x = TSIL.Random.GetRandom(rng)
	local y = TSIL.Random.GetRandom(rng)

	return Vector(x, y)
end
