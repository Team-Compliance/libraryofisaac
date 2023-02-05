---@param oldArray table<any, unknown> | any[]
---@param newArray table<any, unknown>
local function mergeSerializedArray(oldArray, newArray)
    -- Assume that we should blow away all array values with whatever is present in the incoming array.
    oldArray = {}

    TSIL.Utils.Tables.IterateTableInOrder(newArray, function(key, value)
        local deserializedValue = TSIL.Utils.DeepCopy.DeepCopy(value, TSIL.Enums.SerializationType.DESERIALIZE)
        oldArray[key] = deserializedValue
    end)
end

---@param oldTable table<any, unknown> | any[]
---@param newTable table<any, unknown>
local function mergeSerializedTable(oldTable, newTable)
    TSIL.Utils.Tables.IterateTableInOrder(newTable, function(key, value)
        if TSIL.Serialize.IsSerializationBrand(key) then
            return
        end

        -- Handle the special case of serialized Isaac API classes.
        if TSIL.Serialize.IsSerializedIsaacAPIClass(value) then
            local deserializedObject = TSIL.Serialize.DeserializeIsaacAPIClass(value)
            oldTable[key] = deserializedObject
            return
        end

        if type(value) == "table" then
            local oldValue = oldTable[key]

            if type(oldValue) ~= "table" then
                -- The child table does not exist on the old table. However, we still need to copy over
                -- the new table, because we need to handle data types like "Foo | nil". Thus, set up a
                -- blank sub-table on the old table, and continue to recursively merge..
                oldValue = {}
                oldTable[key] = oldValue
            end

            TSIL.Utils.Tables.Merge(oldValue, value)
        else
            -- Base case: copy the value
            oldTable[key] = value
        end
    end)
end

---Takes the values from a new table and recursively merges them into an old object (while
---performing appropriate deserialization).
---
---This function is used to merge incoming data from the "save#.dat" file into a mod's variables.
---Merging is useful instead of blowing away a table entirely because mod code often relies on the
---local table/object references.
---deserialization on the objects within. In other words, unlike the `DeepCopy` function, the
---This function always assumes that the new table is serialized data and will attempt to perform
---`Merge` function will always operates in the mode of `SerializationType.DESERIALIZE`. For the
---types of objects that will be deserialized, see the documentation for the `DeepCopy` function.
---
---This function does not iterate over the old object, like you would naively expect. This is
---because it is common for a variable to have a type of `something | nil`. If this is the case,
---the key would not appear when iterating over the old object. Thus, we must instead iterate over the new
---object and copy the values backwards. The consequence of this is that `Merge` can copy over old
---variables that are no longer used in the code, or copy over old variables of a different type,
---which can cause run-time errors. In such cases, users will have to manually delete their save
---data.
---@param oldObject table<any, unknown> @The old table to merge the values into.
---@param newTable table<any, unknown> @The new table to merge the values from. This must be a Lua table that represents serialized data. In other words, it should be created with the `DeepCopy` function using `SerializationType.SERIALIZE`.
function TSIL.Utils.Tables.Merge(oldObject, newTable)
    if type(oldObject) ~= "table" then
        error("The first argument given to the merge function is not a table")
    end

    if type(newTable) ~= "table" then
        error("The second argument given to the merge function is not a table.")
    end

    -- Handle the special case of an array with a shallow copy.
    if TSIL.Utils.Tables.IsArray(oldObject) and TSIL.Utils.Tables.IsArray(newTable) then
        mergeSerializedArray(oldObject, newTable)
        return
    end

    mergeSerializedTable(oldObject, newTable)
end