local VanillaCallbacksList = TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList

---@param mod table
---@param callback ModCallbacks
---@param funct function
function TSIL.RemoveCustomCallback(mod, callback, funct)
    if not VanillaCallbacksList then return end

    ---@type {Callback : ModCallbacks, Functions : TSILVanillaCallback[]}
    local foundCallbacksFunctions = nil

    for _, vanillaCallback in ipairs(VanillaCallbacksList) do
        if vanillaCallback.Callback == callback then
            foundCallbacksFunctions = vanillaCallback
            break
        end
    end

    if not foundCallbacksFunctions then return end

    for index, callbackFunct in ipairs(foundCallbacksFunctions.Functions) do
        if mod.Name == callbackFunct.Mod.Name and funct == callbackFunct.Funct then
            table.remove(foundCallbacksFunctions.Functions, index)
        end
    end
    --Should be in order but just in case
    table.sort(foundCallbacksFunctions.Functions, function (a, b)
        return a.Priority > b.Priority
    end)
end