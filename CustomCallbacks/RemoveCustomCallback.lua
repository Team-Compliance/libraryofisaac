local CustomCallbacksList = TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList

---@param mod table
---@param callback CustomCallback
---@param funct function
function TSIL.RemoveCustomCallback(mod, callback, funct)
    for index, customCallback in ipairs(CustomCallbacksList) do
        if mod == customCallback.mod and callback == customCallback.callback and funct == customCallback.funct then
            table.remove(CustomCallbacksList, index)
            break
        end
    end
end