local KEYS = {"seed"}
local OBJECT_NAME = "RNG"

---Helper function to convert a serialized object to a normal `RNG` object. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---@param rng table<unknown, unknown>
---@return RNG
function TSIL.Serialize.DeserializeRNG(rng)
    if type(rng) ~= "table" then
        error("Failed to deserialize a " .. OBJECT_NAME .. " object since the provided object was not a table")
    end

    local numbers = TSIL.Utils.Tables.GetNumbersFromTable(rng, OBJECT_NAME, table.unpack(KEYS))

    if numbers[1] == nil then
        error("Failed to deserialize a " .. OBJECT_NAME .. " as the provided object did not have a value for: seed")
    end

    return TSIL.RNG.NewRNG(numbers[1])
end


---Used to determine is the given table is a serialized `RNG` object created by the `DeepCopy`
---function.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedRNG(object)
    if type(object) ~= "table" then
        return false
    end

    return TSIL.Utils.Tables.TableHasKeys(object, table.unpack(KEYS)) and object[TSIL.Enums.SerializationBrand.RNG] ~= nil
end


---Helper function to convert a `RNG` object to a serialized version.
---@param rng RNG
---@return unknown
function TSIL.Serialize.SerializeRNG(rng)
    if not TSIL.IsaacAPIClass.IsRNG(rng) then
        error("Failed to serialize a " .. OBJECT_NAME .. " object since the provided object was not a userdata " .. OBJECT_NAME .. " class.")
    end

    local rngTable = {}
    TSIL.Utils.Tables.CopyUserdataValuesToTable(rng, KEYS, rngTable)
    rngTable[TSIL.Enums.SerializationBrand.RNG] = ""
    return rngTable
end