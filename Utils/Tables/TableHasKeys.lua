---Helper function to check if a Lua table has all of the provided keys.
---This function is variadic, meaning that you can specify as many arguments as you want to check for.
---@param map table<any, unknown>
---@vararg string
function TSIL.Utils.Tables.TableHasKeys(map, ...)
    local keys = {...}
    for _, v in pairs(keys) do
        if map[v] == nil then
            return false
        end
    end

    return true
end