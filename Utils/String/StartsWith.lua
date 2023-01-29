---Helper function to check if a string starts with a given prefix.
---@param s string
---@param prefix string
---@return boolean
function TSIL.Utils.String.StartsWith(s, prefix)
    return s:sub(1, #prefix) == prefix
end