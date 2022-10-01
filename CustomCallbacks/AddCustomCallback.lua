---@class TSILCustomCallback
---@field Mod table
---@field Funct function
---@field Priority integer | CallbackPriority
---@field OptionalParam integer[]

local CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList


---Registers a function to be called by a custom TSIL callback.
---
---Functions with higher priority will be caller earlier.
---@param mod table
---@param callback CustomCallback
---@param funct function
---@param priority integer | CallbackPriority
---@param ... integer
function TSIL.AddCustomCallback(mod, callback, funct, priority, ...)
    if not CustomCallbacksList then
        TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList = {}
        CustomCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList
    end

    local foundCallbacksFunctions = nil

    for _, customCallback in ipairs(CustomCallbacksList) do
        if customCallback.Callback == callback then
            foundCallbacksFunctions = customCallback
            break
        end
    end

    if not foundCallbacksFunctions then
        foundCallbacksFunctions = {Callback = callback, Functions = {}}
        table.insert(CustomCallbacksList, foundCallbacksFunctions)
    end

    ---@type TSILCustomCallback
    local newFunction = {}
    newFunction.Mod = mod
    newFunction.Funct = funct
    newFunction.Priority = priority
    newFunction.OptionalParam = {...}

    table.insert(foundCallbacksFunctions.Functions, newFunction)
    table.sort(foundCallbacksFunctions.Functions, function (a, b)
        return a.Priority > b.Priority
    end)
end