---@param value unknown
---@param serializationType SerializationType
local function deepCopyUserdata(value, serializationType)
    local classType = TSIL.IsaacAPIClass.GetIsaacAPIClassName(value)
    
    if classType == nil then
        error("The deep copy function was not able to derive the Isaac API class type!")
    end

    if not TSIL.Serialize.IsCopyableIsaacAPIClass(value) then
        error("The deep copy function does not support serializing this, since it is an Isaac API class of type: " .. classType)
    end

    if serializationType == TSIL.Enums.SerializationType.NONE then
        return TSIL.Serialize.CopyIsaacAPIClass(value)
    elseif serializationType == TSIL.Enums.SerializationType.SERIALIZE then
        return TSIL.Serialize.SerializeIsaacAPIClass(value)
    elseif serializationType == TSIL.Enums.SerializationType.DESERIALIZE then
        error("The deep copy can not deserialize this since it is userdata.")
    end
end


---A semi-generic deep cloner. It will recursively copy all of the values so that none
---of the nested references remain.
---
---Supports the following object types:
---
---* Primitives (i.e, strings, numbers, and booleans)
---* Tables
---* Dictionaries
---* BitSet128 objects
---* Color objects
---* KColor objects
---* RNG objects
---* Vector objects
---
---It does not support:
---
---* Dictionaries with values of nil
---* Other Isaac API classes such as `EntityPtr`
---@generic T
---@param value T
---@param serializationType SerializationType
---@return T
function TSIL.Utils.DeepCopy.DeepCopy(value, serializationType, copies)
    copies = copies or {}
    local orig_type = type(value)
    local copy
    if orig_type == 'table' then
        if copies[value] then
            copy = copies[value]
        else
            copy = {}
            if serializationType == TSIL.Enums.SerializationType.SERIALIZE and
            TSIL.Utils.Tables.HasNonConsecutiveNumberKeys(value) then
                local serializedTable = TSIL.Serialize.SerializeTableWithNumberKeys(value)
                copies[value] = serializedTable
                for orig_key, orig_value in next, serializedTable, nil do
                    copy[TSIL.Utils.DeepCopy.DeepCopy(orig_key, serializationType, copies)] = TSIL.Utils.DeepCopy.DeepCopy(orig_value, serializationType, copies)
                end
            else
                copies[value] = copy
                for orig_key, orig_value in next, value, nil do
                    copy[TSIL.Utils.DeepCopy.DeepCopy(orig_key, serializationType, copies)] = TSIL.Utils.DeepCopy.DeepCopy(orig_value, serializationType, copies)
                end
                setmetatable(copy, TSIL.Utils.DeepCopy.DeepCopy(getmetatable(value), serializationType, copies))
            end
        end
    elseif orig_type == "userdata" then
        copy = deepCopyUserdata(value, serializationType)
    else
        copy = value
    end

    return copy
end