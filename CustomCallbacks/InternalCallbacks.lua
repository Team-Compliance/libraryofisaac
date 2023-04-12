---Similar to the vanilla `AddCallback` but newer versions will	
---override older versions.
---@param id string @Must be unique. Usually they are named `FEATURE_NAME_CALLBACK_NAME`.
---@param callback ModCallbacks | CustomCallback
---@param funct function
---@param priority integer | CallbackPriority?
---@param optionalParam? integer
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
		if TSIL.__LOCAL_VERSION <= foundInternalCallback.Version then return end

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
			OptionalParam = optionalParam,
			Enabled = false
		}
		table.insert(TSIL.__INTERNAL_CALLBACKS, foundInternalCallback)
	end
end


---Enables an internal callback and allows it to run.
---@param id string @The internal callback id.
function TSIL.__EnableInternalCallback(id)
	local foundInternalCallback = nil

	for _, internalVanillaCallback in ipairs(TSIL.__INTERNAL_CALLBACKS) do
		if internalVanillaCallback.Id == id then
			foundInternalCallback = internalVanillaCallback
		end
	end

	if not foundInternalCallback then return end
	if foundInternalCallback.Enabled then return end

	foundInternalCallback.Enabled = true
	TSIL.__MOD:AddPriorityCallback(
		foundInternalCallback.Callback,
		foundInternalCallback.Priority - 10000,
		foundInternalCallback.Funct,
		foundInternalCallback.OptionalParam
	)
end


---Disables an internal callback and disallows it from running.
---@param id string @The internal callback id.
function TSIL.__DisableInternalCallback(id)
	local foundInternalCallback = nil

	for _, internalVanillaCallback in ipairs(TSIL.__INTERNAL_CALLBACKS) do
		if internalVanillaCallback.Id == id then
			foundInternalCallback = internalVanillaCallback
		end
	end

	if not foundInternalCallback then return end
	if not foundInternalCallback.Enabled then return end

	foundInternalCallback.Enabled = false
	TSIL.__MOD:RemoveCallback(
		foundInternalCallback.Callback,
		foundInternalCallback.Funct
	)
end