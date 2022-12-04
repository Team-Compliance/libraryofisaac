local DEFAULT_MOD_DATA = "{}"

---@param oldSaveData PersistentVariable[]
---@param newSaveData PersistentVariable[]
local function mergeSaveData(oldSaveData, newSaveData)
    TSIL.Utils.Tables.IterateTableInOrder(newSaveData, function (_, persistentVariable)
        for i, oldPersistentVariable in ipairs(oldSaveData) do
            if oldPersistentVariable.name == persistentVariable.name then
                oldSaveData[i] = TSIL.Utils.DeepCopy.DeepCopy(persistentVariable, TSIL.Enums.SerializationType.NONE)
                return
            end
        end

        oldSaveData[#oldSaveData+1] = TSIL.Utils.DeepCopy.DeepCopy(persistentVariable, TSIL.Enums.SerializationType.NONE)
    end)
end

local function readSaveDatFile()
    local ok, jsonStringOrErrMsg = pcall(function()
        return TSIL.__MOD:LoadData()
    end)

    if not ok then
        print([[Failed to read from the "save#.dat" file: ]] .. jsonStringOrErrMsg)
        return DEFAULT_MOD_DATA
    end

    if jsonStringOrErrMsg == nil then
        return DEFAULT_MOD_DATA
    end

    local jsonStringTrimmed = string.gsub(jsonStringOrErrMsg, " ", "")

    if jsonStringOrErrMsg == "" then
        return DEFAULT_MOD_DATA
    end

    return jsonStringTrimmed
end

function TSIL.SaveManager.LoadFromDisk()
    local oldSavedata = TSIL.__VERSION_PERSISTENT_DATA.PersistentData
    if not TSIL.__MOD:HasData() then
        -- There is no "save#.dat" file for this save slot.
        return
    end

    -- First, read the "save#.dat" file into a Lua table.
    local jsonString = readSaveDatFile()
    ---@type table<string, PersistentVariable[]>
    local newSaveData = TSIL.JSON.Decode(jsonString)

    -- Second, iterate over all the fields of the new table.)
    TSIL.Utils.Tables.IterateTableInOrder(newSaveData, function(modName, persistentVariables)
        -- All elements of loaded save data should have keys that are strings equal to the name of the
        -- subscriber/feature. Ignore elements with other types of keys.
        if type(modName) ~= "string" then
            return
        end

        -- All elements of loaded save data should be tables that contain fields corresponding to the
        -- `SaveData` class. Ignore elements that are not tables.
        if type(oldSavedata) ~= "table" then
            return
        end

        local newModData = {}

        TSIL.Utils.Tables.IterateTableInOrder(persistentVariables, function(_, variable)
            newModData[#newModData+1] = variable
        end)

        local oldSaveDataForSubscriber = TSIL.Utils.Tables.FindFirst(oldSavedata, function (_, oldModPersistentData)
            return oldModPersistentData.mod == modName
        end)

        -- Ignore elements that represent subscriptions that no longer exist in the current save data.
        if oldSaveDataForSubscriber == nil then
            return
        end

        -- We do not want to blow away the child tables of the existing map, because save data could
        --contain out-of-date fields. Instead, merge it one field at a time in a recursive way
        --TSIL.Utils.Tables.Merge(oldSaveDataForSubscriber.variables, newModData)
        --oldSaveDataForSubscriber.variables = TSIL.Utils.DeepCopy.DeepCopy(newModData, TSIL.Enums.SerializationType.NONE)
        mergeSaveData(oldSaveDataForSubscriber.variables, persistentVariables)
    end)
end