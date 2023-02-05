local FunctionsToRun = {}

local function OnNewLevel()
	TSIL.Utils.Tables.ForEach(FunctionsToRun, function (_, functionToRun)
		functionToRun.funct(table.unpack(functionToRun.params))
	end)

	FunctionsToRun = {}
end
TSIL.__AddInternalCallback(
	"RUN_NEXT_LEVEL_POST_NEW_LEVEL",
	ModCallbacks.MC_POST_NEW_LEVEL,
	OnNewLevel
)

--- Runs a given function on the next `POST_NEW_LEVEL` callback.
---@param funct function
---@param ... any
function TSIL.Utils.Functions.RunNextLevel(funct, ...)
	local args = {...}

	table.insert(FunctionsToRun, {funct = funct, params = args})
end