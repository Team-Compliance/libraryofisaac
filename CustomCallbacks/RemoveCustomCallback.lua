local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList

--- @param mod table
--- @param callback CustomCallback
--- @param funct function
function TSIL.RemoveCustomCallback(mod, callback, funct)
	if not CustomCallbacksList then return end

	--- @type {Callback : ModCallbacks, Functions : TSILCustomCallback[]}
	local foundCallbacksFunctions = nil

	for _, customCallback in ipairs(CustomCallbacksList) do
		if customCallback.Callback == callback then
			foundCallbacksFunctions = customCallback
			break
		end
	end

	if not foundCallbacksFunctions then return end

	for index, callbackFunct in ipairs(foundCallbacksFunctions.Functions) do
		if mod.Name == callbackFunct.Mod.Name and funct == callbackFunct.Funct then
			table.remove(foundCallbacksFunctions.Functions, index)
		end
	end
	--Should be in order but just in case
	table.sort(foundCallbacksFunctions.Functions, function (a, b)
		return a.Priority > b.Priority
	end)
end