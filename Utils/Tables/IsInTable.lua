---Returns whether a given element is on a table
---@generic T:any
---@param list T[]
---@param element T
---@return boolean
function TSIL.Utils.Tables.IsIn(list, element)
    local found = TSIL.Utils.Tables.FindFirst(list, function (_, value)
        return element == value
    end)

    return found ~= nil
end