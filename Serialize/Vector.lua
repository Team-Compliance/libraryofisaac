local KEYS = {"X", "Y"}
local OBJECT_NAME = "Vector"

---Helper function to convert a serialized object to a normal `Vector` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param vector table<unknown, unknown>
---@return Vector
function TSIL.Serialize.DeserializeVector(vector)
    local numbers = TSIL.Utils.Tables.GetNumbersFromTable(vector, OBJECT_NAME, table.unpack(KEYS))

    if numbers[1] == nil then
        error("Failed to deserialize Vector as the provided object did not have a value for: X")
    elseif numbers[2] == nil then
        error("Failed to deserialize Vector as the provided object did not have a value for: Y")
    end

    return Vector(numbers[1], numbers[2])
end

---Used to determine is the given table is a serialized `Vector` object created by the `deepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedVector(object)
    if type(object) ~= "table" then
        return false
    end

    return TSIL.Utils.Tables.TableHasKeys(object, table.unpack(KEYS)) and object[TSIL.Enums.SerializationBrand.VECTOR] ~= nil
end

---Helper function to convert a `Vector` object to a serialized version.
---@param vector Vector
---@return unknown
function TSIL.Serialize.SerializeVector(vector)
    if not TSIL.IsaacAPIClass.IsVector(vector) then
        error("Failed to serialize a " .. OBJECT_NAME .. " object since the provided object was not a userdata " .. OBJECT_NAME .. " class.")
    end

    local vectorTable = {}
    TSIL.Utils.Tables.CopyUserdataValuesToTable(vector, KEYS, vectorTable)
    vectorTable[TSIL.Enums.SerializationBrand.VECTOR] = ""
    return vectorTable
end