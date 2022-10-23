---Constructs a dictionary from a table. Note that the value of each key is set to true.
---@generic T
---@param oldTable T[]
---@return table<T, boolean>
function TSIL.Utils.Tables.ConstructDictionaryFromTable(oldTable)
    local dictionary = {}

    for _, v in pairs(oldTable) do
        dictionary[v] = true
    end

    return dictionary
end
