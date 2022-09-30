---Removes a variable from the save manager.
---@param mod table
---@param variableName string
function TSIL.SaveManager.GetPersistentVariable(mod, variableName)
    local PersistentData = TSIL.VERSION_PERSISTENT_DATA.PersistentData

    local tables = TSIL.Utils.Tables

    local modPersistentData = tables.FindFirst(PersistentData, function (_, modPersistentData)
        return modPersistentData.mod == mod
    end)

    if modPersistentData == nil then
        --The mod doesn't have any persistent data
        return
    end

    local modVariables = modPersistentData.variables

    for index, modVariable in ipairs(modVariables) do
        if modVariable.name == variableName then
            table.remove(modVariables, index)
            break
        end
    end
end