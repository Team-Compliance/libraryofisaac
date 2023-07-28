---Players can boot the game with an launch option called "--luadebug", which will enable additional
---functionality that is considered to be unsafe. For more information about this flag, see the
---wiki: https://bindingofisaacrebirth.fandom.com/wiki/Launch_Options
---
---When this flag is enabled, the global environment will be slightly different. The differences are
---documented here: https://wofsauge.github.io/IsaacDocs/rep/Globals.html
---
---This function uses the `package` global variable as a proxy to determine if the "--luadebug" flag
---is enabled or not.
---@return boolean
function TSIL.Debug.IsLuaDebugEnabled()
    return not not _LUADEBUG
end