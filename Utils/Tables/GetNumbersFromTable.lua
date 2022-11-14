---Helper function to safely get number values from specific keys on a Lua table. Will throw an
---error if the specific value does not exist on the table or if it cannot be converted to a number.
---
---This function is variadic, meaning that you can specify N arguments to get N values.
---@param map table<string, unknown>
---@param objectName string
---@vararg string
---@return number[]
function TSIL.Utils.Tables.GetNumbersFromTable(map, objectName, ...)
    local keys = {...}
    local numbers = {}

    for _, v in pairs(keys) do
        local value = map[v]

        if value == nil then
            error("Failed to find a value for " .. v .. " in a table representing a " .. objectName .. " object")
        end

        if type(value) == "number" then
            table.insert(numbers, value)
        elseif type(value) == "string" then
            local number = tonumber(value)
            if number == nil then
                error("Failed to convert the " .. v .. " value of a table representing a " .. objectName .. " object to a number: " .. value)
            else
                table.insert(numbers, number)
            end
        else
            error("Failed to get the number for the " .. v .. " value of a table representing a " .. objectName .. " object because the type was " .. type(value))
        end
    end

    return numbers
end