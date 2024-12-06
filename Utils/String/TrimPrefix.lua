---Helper function to remove a given prefix from a string.
---@param s string
---@param prefix string
---@return string
function TSIL.Utils.String.TrimPrefix(s, prefix)
    if s:sub(1, #prefix) ~= prefix then
        return s
    end

    return s:sub(#prefix + 1)
end