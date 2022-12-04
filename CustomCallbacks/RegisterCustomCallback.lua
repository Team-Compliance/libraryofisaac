---@param callback CustomCallback
---@param returnMode? CallbackReturnMode @Default: CallbackReturnMode.NONE
---@param canExecute? fun(functionParams: table, optionalParams: table) : boolean
function TSIL.__RegisterCustomCallback(callback, returnMode, canExecute)
    local CallbackReturnMode = TSIL.Enums.CallbackReturnMode

    if returnMode == nil then
        returnMode = CallbackReturnMode.NONE
    end

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
                ---@diagnostic disable-next-line: need-check-nil
                if canExecute(params, callbackFunction.OptionalParam) then
                    filteredFunctions[#filteredFunctions+1] = callbackFunction
                end
            end

            if #filteredFunctions == 0 then return end

            local finalReturn

            for _, filteredFunction in ipairs(filteredFunctions) do
                local returnValue = filteredFunction.Funct(filteredFunction.Mod, table.unpack(params))

                if returnValue ~= nil then
                    if returnMode == CallbackReturnMode.SKIP_NEXT then
                        return returnValue
                    elseif returnMode == CallbackReturnMode.LAST_WINS then
                        finalReturn = returnValue
                    elseif returnMode == CallbackReturnMode.NEXT_ARGUMENT then
                        finalReturn = returnValue

                        if type(returnValue) == "table" then
                            for i, n in ipairs(returnValue) do
                                params[i] = n
                            end
                        else
                            params[1] = returnValue
                        end
                    end
                end
            end

            return finalReturn
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
---@return unknown?
function TSIL.__TriggerCustomCallback(callback, ...)
    local registeredCustomCallbacks = TSIL.__VERSION_PERSISTENT_DATA.RegisteredCustomCallbacks

    local foundRegistered = registeredCustomCallbacks[callback]

    if not foundRegistered then return end

    return foundRegistered.Trigger(...)
end