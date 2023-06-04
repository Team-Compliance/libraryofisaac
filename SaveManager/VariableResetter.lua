-- The save data manager has a feature where certain variables are automatically 
--restored to default values at certain times.
local RESETTABLE_SAVE_DATA_KEYS = {
    "run",
    "level",
    "room"
}

local RESET_PERSISTENCE_MODE_PER_RESET_TIME = {
    run = TSIL.Enums.VariablePersistenceMode.RESET_RUN,
    level = TSIL.Enums.VariablePersistenceMode.RESET_LEVEL,
    room = TSIL.Enums.VariablePersistenceMode.RESET_ROOM
}

local REMOVE_PERSISTENCE_MODE_PER_RESET_TIME = {
    run = TSIL.Enums.VariablePersistenceMode.REMOVE_RUN,
    level = TSIL.Enums.VariablePersistenceMode.REMOVE_LEVEL,
    room = TSIL.Enums.VariablePersistenceMode.REMOVE_ROOM
}

---@param variable PersistentVariable
local function ResetVariable(variable)
    if type(variable.value) == "table" and type(variable.default) == "table" then
        -- We update the table instead of assigning it directly so the original table gets updated too
        for key, _ in pairs(variable.value) do
            variable.value[key] = nil
        end

        for key, value in pairs(variable.default) do
            variable.value[key] = TSIL.Utils.DeepCopy.DeepCopy(value, TSIL.Enums.SerializationType.NONE)
        end
    else
        variable.value = TSIL.Utils.DeepCopy.DeepCopy(variable.default, TSIL.Enums.SerializationType.NONE)
    end
end


function TSIL.SaveManager.RestoreDefaultsForAllFeaturesAndKeys()
    for _, saveKey in ipairs(RESETTABLE_SAVE_DATA_KEYS) do
        TSIL.SaveManager.RestoreDefaultsForAllFeaturesKey(saveKey)
    end
end


---@param saveKey "run"|"level"|"room"
function TSIL.SaveManager.RestoreDefaultsForAllFeaturesKey(saveKey)
    TSIL.Utils.Tables.IterateTableInOrder(TSIL.__VERSION_PERSISTENT_DATA.PersistentData, function(_, modPersistentData)
        TSIL.SaveManager.RestoreDefaultForFeatureKey(modPersistentData, saveKey)
        TSIL.SaveManager.RemoveVariablesForFeatureKey(modPersistentData, saveKey)
    end)
end

---@param modPersistentData ModPersistentData
---@param saveDataKey "run"|"level"|"room"
function TSIL.SaveManager.RestoreDefaultForFeatureKey(modPersistentData, saveDataKey)
    if RESET_PERSISTENCE_MODE_PER_RESET_TIME[saveDataKey] == nil then
        error("Failed to restore default values of save data key of " .. saveDataKey .. ", since it is not on the allowed list of resettable save data keys.")
    end

    local persistenceModeToReset = RESET_PERSISTENCE_MODE_PER_RESET_TIME[saveDataKey]

    TSIL.Utils.Tables.IterateTableInOrder(modPersistentData.variables, function(name, variable)
        if variable.persistenceMode ~= persistenceModeToReset then
            return
        end

        ResetVariable(variable)
    end)
end


---@param modPersistentData ModPersistentData
---@param saveDataKey "run"|"level"|"room"
function TSIL.SaveManager.RemoveVariablesForFeatureKey(modPersistentData, saveDataKey)
    if REMOVE_PERSISTENCE_MODE_PER_RESET_TIME[saveDataKey] == nil then
        error("Failed to restore default values of save data key of " .. saveDataKey .. ", since it is not on the allowed list of resettable save data keys.")
    end

    local persistenceModeToRemove = REMOVE_PERSISTENCE_MODE_PER_RESET_TIME[saveDataKey]

    for variableName, variable in pairs(modPersistentData.variables) do
        if variable.persistenceMode == persistenceModeToRemove then
            modPersistentData[variableName] = nil
        end
    end
end