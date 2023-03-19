local OBJECT_NAME = "Table with number keys"

---Helper function to convert a serialized object to a table with number keys. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param tableWithNumberKeys table<unknown, unknown>
---@return table
function TSIL.Serialize.DeserializeTableWithNumberKeys(tableWithNumberKeys)
    if type(tableWithNumberKeys) ~= "table" then
        error("Failed to deserialize a " .. OBJECT_NAME .. " object since the provided object was not a table")
    end

    local deserializedTable = {}

    for index, value in pairs(tableWithNumberKeys) do
        if index ~= TSIL.Enums.SerializationBrand.TABLE_WITH_NUMBER_KEYS then
            local numberIndex = tonumber(index)

            if numberIndex == nil then
                error("Failed to deserialize a " .. OBJECT_NAME .. " object since not all keys are integers")
            end

            deserializedTable[numberIndex] = value
        end
    end

    return deserializedTable
end


---Used to determine is the given table is a serialized table with number keys object created by the `DeepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedTableWithNumberKeys(object)
    if type(object) ~= "table" then
        return false
    end

    return object[TSIL.Enums.SerializationBrand.TABLE_WITH_NUMBER_KEYS] ~= nil
end


---Helper function to convert a table with number keys object to a serialized version.
---
---This is useful since parsing a table with non consecutive number keys will result in
---unexpect values being saved.
---@param tableWithNumberKeys table
---@return unknown
function TSIL.Serialize.SerializeTableWithNumberKeys(tableWithNumberKeys)
    if not type(tableWithNumberKeys) == "table" then
        error("Failed to serialize a " .. OBJECT_NAME .. " object since the provided object was not a table")
    end

    local serializedTable = {}
    for index, value in pairs(tableWithNumberKeys) do
        serializedTable[tostring(index)] = value
    end
    serializedTable[TSIL.Enums.SerializationBrand.TABLE_WITH_NUMBER_KEYS] = ""
    return serializedTable
end