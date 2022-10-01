---@param id string
---@param callback ModCallbacks
---@param funct function
---@param priority integer | CallbackPriority
---@param optionalParam? integer
function TSIL.__AddInternalVanillaCallback(id, callback, funct, priority, optionalParam)
    local foundInternalCallback = nil

    for _, internalVanillaCallback in ipairs(TSIL.__INTERNAL_VANILLA_CALLBACKS) do
        if internalVanillaCallback.Id == id then
            foundInternalCallback = internalVanillaCallback
        end
    end

    if foundInternalCallback then
        foundInternalCallback.Callback = callback
        foundInternalCallback.Funct = funct
        foundInternalCallback.Priority = priority
        ---@diagnostic disable-next-line: assign-type-mismatch
        foundInternalCallback.OptionalParam = optionalParam
    else
        foundInternalCallback = {
            Id = id,
            Callback = callback,
            Funct = funct,
            Priority = priority,
            OptionalParam = optionalParam
        }
        table.insert(TSIL.__INTERNAL_VANILLA_CALLBACKS, foundInternalCallback)
    end
end


---@param id string
---@param callback CustomCallback
---@param funct function
---@param priority integer | CallbackPriority
---@param ... integer
function TSIL.__AddInternalCustomCallback(id, callback, funct, priority, ...)
    local foundInternalCallback = nil

    for _, internalCustomCallback in ipairs(TSIL.__INTERNAL_CUSTOM_CALLBACKS) do
        if internalCustomCallback.Id == id then
            foundInternalCallback = internalCustomCallback
        end
    end

    if foundInternalCallback then
        foundInternalCallback.Callback = callback
        foundInternalCallback.Funct = funct
        foundInternalCallback.Priority = priority
        foundInternalCallback.OptionalParam = {...}
    else
        foundInternalCallback = {
            Id = id,
            Callback = callback,
            Funct = funct,
            Priority = priority,
            OptionalParam = {...}
        }
        table.insert(TSIL.__INTERNAL_CUSTOM_CALLBACKS, foundInternalCallback)
    end
end