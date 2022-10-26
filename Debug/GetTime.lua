---Helper function to get the current time for benchmarking / profiling purposes.
---
---The return value will either be in seconds or milliseconds, depending on if the "--luadebug" flag
---is turned on or not.
---
---If the "--luadebug" flag is present, then this function will use the `socket.gettime` method,
---which returns the epoch timestamp in seconds (e.g. "1640320492.5779"). This is preferable over
---the more conventional `Isaac.GetTime` method, since it has one extra decimal point of precision.
---
---If the "--luadebug" flag is not present, then this function will use the `Isaac.GetTime` method,
---which returns the number of milliseconds since the computer's operating system was started (e.g.
---"739454963").
---@return number
function TSIL.Debug.GetTime()
    if TSIL.Debug.IsLuaDebugEnabled() then
        local ok, requiredSocket = pcall(require, "socket")

        if ok then
            return requiredSocket.gettime()
        end
    end

    return Isaac.GetTime()
end