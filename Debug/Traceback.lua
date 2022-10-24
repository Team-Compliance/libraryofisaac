---Helper function to print a stack trace to the "log.txt" file, similar to JavaScript's
---`console.trace` function.
---This will only work if the `--luadebug` launch option is enabled
function TSIL.Debug.Traceback()
    local tracebackOutput = TSIL.Debug.GetTraceback()
    TSIL.Log.Log(tracebackOutput)
end