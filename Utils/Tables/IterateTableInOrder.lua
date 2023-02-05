---Helper function to iterate over a table deterministically. This is useful because by default, the
---`pairs` function will return the keys of a Lua table in a random order.
---
---This function will sort the table entries based on the value of the key.
---
---This function will only work on tables that have number keys or string keys. It will throw a
---run-time error if it encounters a key of another type.
---@generic K
---@generic V
---@param map table<K, V> @The table to iterate over
---@param func fun(key: K, value: V) @The function to run for each iteration 
---@param inOrder? boolean @Default: true | Whether to iterate in order. You can dynamically set to false in situations where iterating randomly would not matter and you need the extra performance.
function TSIL.Utils.Tables.IterateTableInOrder(map, func, inOrder)
    if inOrder == nil then
        inOrder = true
    end

    -- First, handle the trivial case of a non-deterministic iteration.
    if not inOrder then
        for key, value in pairs(map) do
            func(key, value)
        end
        return
    end

    local keys = TSIL.Utils.Tables.GetDictionaryKeys(map)
    local hasAllNumberKeys = TSIL.Utils.Tables.All(keys, function(_, key)
        return type(key) == "number"
    end)
    local hasAllStringKeys = TSIL.Utils.Tables.All(keys, function(_, key)
        return type(key) == "string"
    end)

    if not hasAllNumberKeys and not hasAllStringKeys then
        -- Since the table has non-homogenous keys, we won't be able to sort it. Revert to non-deterministic iteration in this case.
        for key, value in pairs(map) do
            func(key, value)
        end
        return
    end

    table.sort(keys)

    for _, key in pairs(keys) do
        local value = map[key]
        if value ~= nil then
            func(key, value)
        end
    end
end