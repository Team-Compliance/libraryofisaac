---Helper function that splits a string into parts based on the given separator.
---
---For example, splitting the string "Hello there, world!" with separator " " will return ["Hello", "there,", "world!"]
---@param s string
---@param separator string
---@return string[]
function TSIL.Utils.String.Split(s, separator)
    local result = {}
    for substring in string.gmatch(s, "([^" .. separator .. "]+)") do
        table.insert(result, substring)
    end

    return result
end