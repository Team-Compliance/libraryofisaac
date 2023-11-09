---@type table<CallbackOptionalArgType, fun(param: any, optionalArgs: table)>
local OPTIONAL_PARAMS_PER_OPTIONAL_ARG_TYPE = {
    [TSIL.Enums.CallbackOptionalArgType.GENERIC] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param
    end,

    [TSIL.Enums.CallbackOptionalArgType.NONE] = function() end,

    ---@param param Entity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param.Type
    end,

    ---@param param Entity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param.Type
        optionalArgs[#optionalArgs + 1] = param.Variant
    end,

    ---@param param Entity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.ENTITY_TYPE_VARIANT_SUBTYPE] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param.Type
        optionalArgs[#optionalArgs + 1] = param.Variant
        optionalArgs[#optionalArgs + 1] = param.SubType
    end,

    ---@param param Entity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.ENTITY_VARIANT_SUBTYPE] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param.Variant
        optionalArgs[#optionalArgs + 1] = param.SubType
    end,

    ---@param param Entity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.ENTITY_SUBTYPE] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param.SubType
    end,

    ---@param param GridEntity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.GRID_TYPE] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param:GetType()
    end,

    ---@param param GridEntity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.GRID_TYPE_VARIANT] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param:GetType()
        optionalArgs[#optionalArgs + 1] = param:GetVariant()
    end,

    ---@param param GridEntity
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.GRID_VARIANT] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param:GetVariant()
    end,

    ---@param param EntityPlayer
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param:GetPlayerType()
        optionalArgs[#optionalArgs + 1] = param.Variant
    end,

    ---@param param EntityPlayer
    ---@param optionalArgs table
    [TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE] = function(param, optionalArgs)
        optionalArgs[#optionalArgs + 1] = param:GetPlayerType()
    end,
}


---@param functionParams table
---@param optionalArgTypes CallbackOptionalArgType[]
---@return table
local function GetOptionalParams(functionParams, optionalArgTypes)
    local optionalArgs = {}

    for index, optionalArgType in ipairs(optionalArgTypes) do
        OPTIONAL_PARAMS_PER_OPTIONAL_ARG_TYPE[optionalArgType](functionParams[index], optionalArgs)
    end

    return optionalArgs
end


---@param param1 any
---@param param2 any
---@return boolean
local function CompareParams(param1, param2)
    return param1 == nil or param2 == nil or param1 == param2
end


---@param param any
---@param optionalParams table
---@return boolean
local function CheckOptionalParams(param, optionalParams)
    if type(param) ~= "table" then
        return CompareParams(optionalParams[1], param)
    end

    for index, targetParam in ipairs(optionalParams) do
        if not CompareParams(targetParam, param[index]) then
            return false
        end
    end

    return true
end


---Registers a new custom callback.
---
---Each `CallbackOptionalArgType` refers to one argument passed
---by the callback, so a callback with params:
---```lua
---(player: EntityPlayer, name: string, num: integer)
---```
---To allow the user to filter by player type and the `num` param
---you'd need to use the following `CallbackOptionalArgType`:
---```lua
---CallbackOptionalArgType.PLAYER_TYPE,
---CallbackOptionalArgType.NONE, --We need to skip the `name` argument
---CallbackOptionalArgType.GENERIC
---```
---@param callback CustomCallback
---@param returnMode? CallbackReturnMode @Default: CallbackReturnMode.NONE
---@param ... CallbackOptionalArgType
function TSIL.__RegisterCustomCallback(callback, returnMode, ...)
    local optionalArgTypes = { ... }
    local CallbackReturnMode = TSIL.Enums.CallbackReturnMode

    if returnMode == nil then
        returnMode = CallbackReturnMode.NONE
    end

    local registeredCustomCallbacks = TSIL.__VERSION_PERSISTENT_DATA.RegisteredCustomCallbacks

    local foundRegistered = registeredCustomCallbacks[callback]

    if foundRegistered and foundRegistered.Version >= TSIL.__LOCAL_VERSION then
        return
    end

    local newRegistered = {
        Version = TSIL.__LOCAL_VERSION,
        Trigger = function(...)
            local functionParams = { ... }
            local optionalParams = GetOptionalParams(functionParams, optionalArgTypes)

            --Vanilla RunCallback prevents the execution of all the other functions if one has an error.
            --To prevent this we manually loop through each callback, which allows us to use pcall.

            local callbacks = Isaac.GetCallbacks(callback)
            -- ---@type CallbackEntry[]
            -- local filteredCallbacks = {}

            -- for _, callbackEntry in ipairs(callbacks) do
            --     local param = callbackEntry.Param

            --     if (param == nil or #optionalParams == 0) or
            --         CheckOptionalParams(param, optionalParams) then
            --         filteredCallbacks[#filteredCallbacks + 1] = callbackEntry
            --     end
            -- end

            -- if #filteredCallbacks == 0 then return end

            local finalReturn

            for _, callbackEntry in ipairs(callbacks) do
                local param = callbackEntry.Param

                if (param == nil or #optionalParams == 0)
                or CheckOptionalParams(param, optionalParams) then
                    local status, returnValue = pcall(callbackEntry.Function, callbackEntry.Mod, ...)

                    if not status then
                        print(returnValue)
                    elseif returnValue ~= nil then
                        if returnMode == CallbackReturnMode.SKIP_NEXT then
                            return returnValue
                        elseif returnMode == CallbackReturnMode.LAST_WINS then
                            finalReturn = returnValue
                        elseif returnMode == CallbackReturnMode.NEXT_ARGUMENT then
                            finalReturn = returnValue

                            if type(returnValue) == "table" then
                                for i, n in ipairs(returnValue) do
                                    functionParams[i] = n
                                end
                            else
                                functionParams[1] = returnValue
                            end
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
