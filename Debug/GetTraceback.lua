---Helper function to get a stack trace.
---
---This will only work if the `--luadebug` launch option is enabled.
---@return string
function TSIL.Debug.GetTraceback()
    if debug ~= nil then
        return debug.traceback()
    else
        return 'stack traceback:\n(the "--luadebug" flag is not enabled)'
    end
end
