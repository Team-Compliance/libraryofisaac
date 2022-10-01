---@class TSILVanillaCallback
---@field Mod table
---@field Funct function
---@field Priority integer | CallbackPriority
---@field OptionalParam integer

local VanillaCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList


---Registers a function to be triggered by a vanilla callback.
---
---Using this function allows you to use the built-in priority system.
---@param mod table
---@param callback ModCallbacks
---@param funct function
---@param priority integer
---@param optionalParam integer
function TSIL.AddVanillaCallback(mod, callback, funct, priority, optionalParam)
    if not VanillaCallbacksList then
        TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList = {}
        VanillaCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList
    end

    local foundCallbacksFunctions = nil

    for _, vanillaCallback in ipairs(VanillaCallbacksList) do
        if vanillaCallback.Callback == callback then
            foundCallbacksFunctions = vanillaCallback
            break
        end
    end

    if not foundCallbacksFunctions then
        foundCallbacksFunctions = {Callback = callback, Functions = {}}
        table.insert(VanillaCallbacksList, foundCallbacksFunctions)
    end

    ---@type TSILVanillaCallback
    local newFunction = {}
    newFunction.Mod = mod
    newFunction.Funct = funct
    newFunction.Priority = priority
    newFunction.OptionalParam = optionalParam

    table.insert(foundCallbacksFunctions.Functions, newFunction)
    table.sort(foundCallbacksFunctions.Functions, function (a, b)
        return a.Priority > b.Priority
    end)
end