---Sets a variable from the save manager.
---@param mod table
---@param variableName string
---@param newValue any
function TSIL.SaveManager.GetPersistentVariable(mod, variableName, newValue)
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

    local foundVariable = tables.FindFirst(modVariables, function (_, modVariable)
        return modVariable.name == variableName
    end)

    if foundVariable == nil then
        --The variable doesn't exists
        return
    end

    foundVariable.value = newValue
end