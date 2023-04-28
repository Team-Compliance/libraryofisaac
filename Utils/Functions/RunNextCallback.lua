--- Runs a function the next time a callback is triggered. After it gets called once, it is removed
---@param mod table
---@param callback ModCallbacks | CustomCallback
---@param funct function
---@param optionalParam any?
function TSIL.Utils.Functions.RunNextCallback(mod, callback, funct, optionalParam)
    local callbackFunct = function (...)
        mod:RemoveCallback(callback, funct)
        return funct(...)
    end

    mod:AddCallback(
        callback,
        callbackFunct,
        optionalParam
    )
end