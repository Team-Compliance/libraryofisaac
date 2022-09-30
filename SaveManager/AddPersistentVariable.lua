---Adds a variable to the save manager.
---The variable name must be unique within your mod.
---@param mod table
---@param variableName string
---@param value any
---@param persistenceMode VariablePersistenceMode
function TSIL.SaveManager.AddPersistentVariable(mod, variableName, value, persistenceMode)
    local PersistentData = TSIL.VERSION_PERSISTENT_DATA.PersistentData

    local tables = TSIL.Utils.Tables

    local modPersistentData = tables.FindFirst(PersistentData, function (_, modPersistentData)
        return modPersistentData.mod == mod
    end)

    if modPersistentData == nil then
        modPersistentData = {
            mod = mod,
            variables = {}
        }
        table.insert(PersistentData, modPersistentData)
    end

    local modVariables = modPersistentData.variables

    local foundVariable = tables.FindFirst(modVariables, function (_, modVariable)
        return modVariable.name == variableName
    end)

    if foundVariable ~= nil then
        --The variable already exists
        return
    end

    local newVariable = {
        name = variableName,
        default = value,
        value = value,
        persistenceMode = persistenceMode
    }
    table.insert(modVariables, newVariable)
end