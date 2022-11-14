---Helper function to remove a given prefix from a string.
---@param s string
---@param prefix string
---@return string
function TSIL.Utils.String.TrimPrefix(s, prefix)
    if s:sub(1, #s) ~= prefix then
        return s
    end

    return s:sub(#prefix)
end