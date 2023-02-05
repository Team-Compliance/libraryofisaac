--- Helper function to get the name and the line number of the current calling function.
---
--- For this function to work properly, the "--luadebug" flag must be enabled. Otherwise, it will
--- always return undefined.
---@param levels number? @Default: 3 | The amount of levels to look backwards in the call stack. Default is 3 because the first level is the function, the second level is the calling function, and the third level is the parent of the calling function.
---@return string?
function TSIL.Log.GetParentFunctionDescription(levels)
    levels = levels or 3
    
    if debug == nil then
        return
    end

    local debugTable = debug.getinfo(levels)
    if debugTable ~= nil then
        return debugTable.name .. ":" .. debugTable.linedefined
    end
end