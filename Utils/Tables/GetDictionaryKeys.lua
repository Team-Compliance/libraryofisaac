---Returns a list of keys a dictionary has.
---@generic K
---@generic V
---@param dictionary table<K, V>
---@return K[]
function TSIL.Utils.Tables.GetDictionaryKeys(dictionary)
    local result = {}
    for i in pairs(dictionary) do
        table.insert(result, i)
    end
    return result
end