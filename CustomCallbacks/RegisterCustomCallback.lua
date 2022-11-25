---@param callback CustomCallback
---@param canExecute? fun(functionParams: table, optionalParams: table) : boolean
function TSIL.__RegisterCustomCallback(callback, canExecute)
    if canExecute == nil then
        canExecute = function ()
            return true
        end
    end

    local registeredCustomCallbacks = TSIL.__VERSION_PERSISTENT_DATA.RegisteredCustomCallbacks

    local foundRegistered = registeredCustomCallbacks[callback]

    if foundRegistered and foundRegistered.Version > TSIL.__LOCAL_VERSION then
        return
    end

    local newRegistered = {
        Version = TSIL.__LOCAL_VERSION,
        Trigger = function (...)
            local params = {...}

            local customCallbacks = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList
            ---@type TSILCustomCallback[] | nil
            local callbackFunctions = nil

            for _, customCallback in ipairs(customCallbacks) do
                if customCallback.Callback == callback then
                    callbackFunctions = customCallback.Functions
                    break
                end
            end

            if not callbackFunctions then return end
            if #callbackFunctions == 0 then return end

            ---@type TSILCustomCallback[]
            local filteredFunctions = {}

            for _, callbackFunction in ipairs(callbackFunctions) do
                if canExecute(params, callbackFunction.OptionalParam) then
                    filteredFunctions[#filteredFunctions+1] = callbackFunction
                end
            end

            if #filteredFunctions == 0 then return end

            for _, filteredFunction in ipairs(filteredFunctions) do
                filteredFunction.Funct(filteredFunction.Mod, table.unpack(params))
            end
        end
    }

    registeredCustomCallbacks[callback] = newRegistered
end


---@param param integer?
---@return boolean
function TSIL.__IsDefaultParam(param)
    return param == nil or param == -1
end


---@param callback CustomCallback
---@param ... any
function TSIL.__TriggerCustomCallback(callback, ...)
    local registeredCustomCallbacks = TSIL.__VERSION_PERSISTENT_DATA.RegisteredCustomCallbacks

    local foundRegistered = registeredCustomCallbacks[callback]

    if not foundRegistered then return end

    foundRegistered.Trigger(...)
end