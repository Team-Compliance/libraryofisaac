---Helper function to check if a debug mode is active.
---@param mode DebugMode
---@return boolean
function TSIL.Debug.IsDebugModeActive(mode)
    local cmd = "debug " .. mode

    local result = Isaac.ExecuteCommand(cmd)
    Isaac.ExecuteCommand(cmd)

    return result == "Disabled debug flag."
end