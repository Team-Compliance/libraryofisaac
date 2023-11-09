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
    local librarySaveData
    if libraryPersistentData then
        librarySaveData = getSaveDataForMod(libraryPersistentData)
    end

    local hasSavedLibraryData = false

    TSIL.Utils.Tables.IterateTableInOrder(PersistentData, function (modName, modPersistentData)
        --We skip the library data, since we don't need to save it separately
        --If we did save it separately it'd override the data of the mod that's running it
        if modName == "TSIL_MOD" then
            return
        end

        hasSavedLibraryData = true

        local saveData = getSaveDataForMod(modPersistentData)

        local shouldOverride = TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.PRE_SAVE_MANAGER_SAVE_TO_DISK,
            modName,
            modPersistentData,
            librarySaveData
        )

        -- The mod wants to skip saving data.
        if shouldOverride then
            return
        end

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

    if not hasSavedLibraryData then
        local hasModSaved = TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.PRE_SAVE_MANAGER_SAVE_TO_DISK,
            nil,
            nil,
            librarySaveData
        )

        -- Some other mod saved the library data
        if hasModSaved then return end

        local modAndLibraryData = {
            TSIL_DATA = librarySaveData,
        }

        local jsonString = TSIL.JSON.Encode(modAndLibraryData)

        --We save each mod's save data in their own mod, so the data doesn't get
        --lost if the library was running in a different mod folder
        TSIL.__MOD:SaveData(jsonString)
    end
end