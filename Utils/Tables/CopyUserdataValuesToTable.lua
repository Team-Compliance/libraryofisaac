---Helper function to copy specific values from a userdata to a table.
---@param object unknown
---@param keys string[]
---@param map table<string, unknown>
function TSIL.Utils.Tables.CopyUserdataValuesToTable(object, keys, map)
    assert(type(object) == "userdata", "Failed to copy an object values to a table, since the object was of type " .. type(object))

    for _, key in pairs(keys) do
        local value = object[key]
        map[key] = value
    end
end