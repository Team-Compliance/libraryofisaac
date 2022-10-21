--- Removes the given flags from another one.
--- @param flags integer
--- @param ... integer
--- @return integer
--- @within TSIL.Utils.Flags
function TSIL.Utils.Flags.RemoveFlags(flags, ...)
	local flagsToRemove = {...}

	for _, flag in ipairs(flagsToRemove) do
		flags = flags & ~flag
	end

	return flags
end