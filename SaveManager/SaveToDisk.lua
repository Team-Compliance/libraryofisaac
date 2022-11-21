local function getAllSaveDataToWriteToDisk()
    local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData
    local allSaveData = {}

    TSIL.Utils.Tables.IterateTableInOrder(PersistentData, function(_, modPersistentData)
        local modSaveData = {}

        TSIL.Utils.Tables.IterateTableInOrder(modPersistentData.variables, function(_, variable)
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

            modSaveData[#modSaveData+1] = variable
        end)

        if TSIL.Utils.Tables.IsEmpty(modSaveData) then
            return
        end

        local safeCopy = TSIL.Utils.DeepCopy.DeepCopy(modSaveData, TSIL.Enums.SerializationType.SERIALIZE)
        allSaveData[modPersistentData.mod] = safeCopy
    end)

    return allSaveData
end


function TSIL.SaveManager.SaveToDisk()
    TSIL.Log.Log("Saving to disk")
    local allSaveData = getAllSaveDataToWriteToDisk()
    local jsonString = TSIL.JSON.Encode(allSaveData)
    TSIL.__MOD:SaveData(jsonString)
end