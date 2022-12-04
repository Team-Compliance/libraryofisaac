local ISAAC_API_CLASS_TYPE_TO_BRAND = {
    [TSIL.Enums.CopyableIsaacAPIClassType.BIT_SET_128] = TSIL.Enums.SerializationBrand.BIT_SET_128,
    [TSIL.Enums.CopyableIsaacAPIClassType.COLOR] = TSIL.Enums.SerializationBrand.COLOR,
    [TSIL.Enums.CopyableIsaacAPIClassType.K_COLOR] = TSIL.Enums.SerializationBrand.K_COLOR,
    [TSIL.Enums.CopyableIsaacAPIClassType.RNG] = TSIL.Enums.SerializationBrand.RNG,
    [TSIL.Enums.CopyableIsaacAPIClassType.VECTOR] = TSIL.Enums.SerializationBrand.VECTOR,
}

---@param serializedIsaacAPIClass unknown
local function getSerializedTableType(serializedIsaacAPIClass)
    for i, v in pairs(ISAAC_API_CLASS_TYPE_TO_BRAND) do
        if serializedIsaacAPIClass[v] ~= nil then
            return i
        end
    end
end

---Helper function to generically check if a given Lua table is a serialized Isaac API class. (This
---is used by the save data manager when reading data from the "save#.dat" file.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsSerializedIsaacAPIClass(object)
    return TSIL.Serialize.IsSerializedBitSet128(object) or
    TSIL.Serialize.IsSerializedColor(object) or
    TSIL.Serialize.IsSerializedKColor(object) or
    TSIL.Serialize.IsSerializedRNG(object) or
    TSIL.Serialize.IsSerializedVector(object)
end

---Helper function to generically deserialize an Isaac API class without knowing what specific type
---of class it is. (This is used by the save data manager when reading data from the "save#.dat"
---file.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param serializedIsaacAPIClass unknown
---@return unknown
function TSIL.Serialize.DeserializeIsaacAPIClass(serializedIsaacAPIClass)
    if type(serializedIsaacAPIClass) ~= "table" then
        error("Failed to deserialize an Isaac API class since the provided object was of type: " .. type(serializedIsaacAPIClass))
    end

    local copyableIsaacAPIClassType = getSerializedTableType(serializedIsaacAPIClass)

    if copyableIsaacAPIClassType == nil then
        error("Failed to deserialize an Isaac API class since a valid class type brand was not found.")
    end

    if copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.VECTOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.DeserializeVector(serializedIsaacAPIClass)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.BIT_SET_128 then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.DeserializeBitSet128(serializedIsaacAPIClass)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.COLOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.DeserializeColor(serializedIsaacAPIClass)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.K_COLOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.DeserializeKColor(serializedIsaacAPIClass)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.RNG then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.DeserializeRNG(serializedIsaacAPIClass)
    end

    error("Failed to deserialize an Isaac API class since the associated functions were not found for class type: " .. copyableIsaacAPIClassType)
end

---In order to find out what type of serialized Isaac API class this is, we search through the
---serialized table for brands.
---@param key unknown
---@return boolean
function TSIL.Serialize.IsSerializationBrand(key)
    if type(key) ~= "string" then
        return false
    end

    return TSIL.Enums.SerializationBrand[key] ~= nil
end

---Helper function to generically check if a given object is a copyable Isaac API class. (This is
---used by the save data manager when determining what is safe to copy.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param object unknown
---@return boolean
function TSIL.Serialize.IsCopyableIsaacAPIClass(object)
    return TSIL.IsaacAPIClass.IsBitSet128(object) or
    TSIL.IsaacAPIClass.IsColor(object) or
    TSIL.IsaacAPIClass.IsKColor(object) or
    TSIL.IsaacAPIClass.IsRNG(object) or
    TSIL.IsaacAPIClass.IsVector(object)
end

---Helper function to generically copy an Isaac API class without knowing what specific type of
---class it is. (This is used by the save data manager.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@generic T
---@param class T
---@return T
function TSIL.Serialize.CopyIsaacAPIClass(class)
    if type(class) ~= "userdata" then
        error("Failed to copy an ISaac API class since the provided object was of type: " .. type(class))
    end

    local isaacAPIClassType = TSIL.IsaacAPIClass.GetIsaacAPIClassName(class)

    if isaacAPIClassType == nil then
        error("Failed to copy an Isaac API class since it does not have a class type.")
    end

    local copyableIsaacAPIClassType = isaacAPIClassType

    if copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.VECTOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Vector.CopyVector(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.BIT_SET_128 then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.BitSet128.CopyBitSet128(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.COLOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Color.CopyColor(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.K_COLOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Color.CopyKColor(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.RNG then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.RNG.CopyRNG(class)
    end

    error("Failed to copy an Isaac API class since the associated functions were not found for Isaac API class type: " .. copyableIsaacAPIClassType)
end

---Helper function to generically serialize an Isaac API class without knowing what specific type of
---class it is. (This is used by the save data manager when writing data to the "save#.dat" file.)
---
---For the list of supported classes, see the `CopyableIsaacAPIClassType` enum.
---@param class unknown
---@return unknown
function TSIL.Serialize.SerializeIsaacAPIClass(class)
    if type(class) ~= "userdata" then
        error("Failed to serialize an Isaac API class since the provided object was of type: " .. type(class))
    end

    local isaacAPIClassType = TSIL.IsaacAPIClass.GetIsaacAPIClassName(class)

    if isaacAPIClassType == nil then
        error("Failed to serialize an Isaac API class since it does not have a class type.")
    end

    local copyableIsaacAPIClassType = isaacAPIClassType

    ---@diagnostic disable-next-line: param-type-mismatch
    if copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.VECTOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.SerializeVector(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.BIT_SET_128 then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.SerializeBitSet128(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.COLOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.SerializeColor(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.K_COLOR then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.SerializeKColor(class)
    elseif copyableIsaacAPIClassType == TSIL.Enums.CopyableIsaacAPIClassType.RNG then
        ---@diagnostic disable-next-line: param-type-mismatch\
        return TSIL.Serialize.SerializeRNG(class)
    end

    error("Failed to serialize an Isaac API class since the associated functions were not found for Isaac API class type: " .. copyableIsaacAPIClassType)
end