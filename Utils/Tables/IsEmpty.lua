---Helper function to check if a table is empty. Use this instead of checking for
---a size of 0 with the `#` operator since this will take into account dictionaries.
---@param map table
---@return boolean
function TSIL.Utils.Tables.IsEmpty(map)
    for _ in pairs(map) do
        return false
    end
    return true
end