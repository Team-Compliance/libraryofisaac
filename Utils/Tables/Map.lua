--- Creates a new table where each element is the result of applying
--- a given function to each element of the provided list.
---@generic T any
---@generic S any
---@param list T[]
---@param funct fun(index: string|integer, value:T) : S
---@return S[]
function TSIL.Utils.Tables.Map(list, funct)
    local mapped = {}

    for key, value in pairs(list) do
        mapped[key] = funct(key, value)
    end

    return mapped
end