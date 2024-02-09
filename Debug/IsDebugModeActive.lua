---Helper function to check if a debug mode is active.
---@param mode DebugFlag
---@return boolean
function TSIL.Debug.IsDebugModeActive(mode)
    local debugFlags = Game():GetDebugFlags()

    return TSIL.Utils.Flags.HasFlags(debugFlags, mode)
end