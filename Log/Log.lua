--- Helper function to avoid typing out `Isaac.DebugString()`.
---
--- If you have the "--luadebug" launch flag turned on, then this
--- function will also prepend the function name and the line number before the string.
---@param message string
function TSIL.Log.Log(message)
    local parentFunctionDescription = TSIL.Log.GetParentFunctionDescription()

    if not parentFunctionDescription then
        Isaac.DebugString(message)
    else
        Isaac.DebugString(parentFunctionDescription .. " - " .. message)
    end
end