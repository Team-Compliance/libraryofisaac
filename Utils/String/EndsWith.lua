---Helper function to check if a string ends  with a given suffix.
---@param s string
---@param suffix string
---@return boolean
function TSIL.Utils.String.EndsWith(s, suffix)
    return string.sub(s, (#s - #suffix) + 1) == suffix
end