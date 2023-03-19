---@param modPersistentData ModPersistentData
---@return table
local function getSaveDataForMod(modPersistentData)
    local saveData = {}

    TSIL.Utils.Tables.IterateTableInOrder(modPersistentData.variables, function(variableName, variable)
        -- Handle the feature of the save data manager where certain mod features can conditionally
        -- write their data to disk.
        local conditionalFunc = variable.conditionalSave

        if conditionalFunc ~= nil then
            local shouldSave = conditionalFunc()
            if not shouldSave then
                return
            end
        end

        ---Strip out the room part of the save data (and any other arbitrary fields that they might
        ---have added).
        if variable.persistenceMode == TSIL.Enums.VariablePersistenceMode.REMOVE_ROOM or
        variable.persistenceMode == TSIL.Enums.VariablePersistenceMode.RESET_ROOM then
            return
        end

        saveData[variableName] = variable
    end)

    local safeCopy = TSIL.Utils.DeepCopy.DeepCopy(saveData, TSIL.Enums.SerializationType.SERIALIZE)
    return safeCopy
end


function TSIL.SaveManager.SaveToDisk()
    TSIL.Log.Log("Saving to disk")

    local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData

    --First get the save data for the library
    local libraryPersistentData = PersistentData["TSIL_MOD"]
    local librarySaveData = getSaveDataForMod(libraryPersistentData)

    TSIL.Utils.Tables.IterateTableInOrder(PersistentData, function (modName, modPersistentData)
        --We skip the library data, since we don't need to save it separately
        --If we did save it separately it'd override the data of the mod that's running it
        if modName == "TSIL_MOD" then
            return
        end

        local saveData = getSaveDataForMod(modPersistentData)

        --We need to save the library data with the mod data so it doesnt override it
        local modAndLibraryData = {
            TSIL_DATA = librarySaveData,
            MOD_DATA = saveData
        }

        local jsonString = TSIL.JSON.Encode(modAndLibraryData)

        --We save each mod's save data in their own mod, so the data doesn't get
        --lost if the library was running in a different mod folder
        modPersistentData.mod:SaveData(jsonString)
    end)
end