--- @param id string
--- @param callback ModCallbacks | CustomCallback
--- @param funct function
--- @param priority integer | CallbackPriority?
--- @param optionalParam? integer
function TSIL.__AddInternalCallback(id, callback, funct, priority, optionalParam)
	if priority == nil then
		priority = CallbackPriority.DEFAULT
	end

	local foundInternalCallback = nil

	for _, internalVanillaCallback in ipairs(TSIL.__INTERNAL_CALLBACKS) do
		if internalVanillaCallback.Id == id then
			foundInternalCallback = internalVanillaCallback
		end
	end

	if foundInternalCallback then
		if TSIL.__LOCAL_VERSION < foundInternalCallback.Version then return end

		foundInternalCallback.Callback = callback
		foundInternalCallback.Funct = funct
		foundInternalCallback.Priority = priority
		foundInternalCallback.OptionalParam = optionalParam
	else
		foundInternalCallback = {
			Id = id,
			Version = TSIL.__LOCAL_VERSION,
			Callback = callback,
			Funct = funct,
			Priority = priority,
			OptionalParam = optionalParam
		}
		table.insert(TSIL.__INTERNAL_CALLBACKS, foundInternalCallback)
	end
end