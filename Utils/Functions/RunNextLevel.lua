local FunctionsToRun = {}

local function OnNewLevel()
    TSIL.Utils.Tables.ForEach(FunctionsToRun, function (_, functionToRun)
        functionToRun.funct(table.unpack(functionToRun.params))
    end)

    FunctionsToRun = {}
end
TSIL.__AddInternalVanillaCallback(
    "RUN_NEXT_LEVEL_POST_NEW_LEVEL",
    ModCallbacks.MC_POST_NEW_LEVEL,
    OnNewLevel,
    TSIL.Enums.CallbackPriority.MEDIUM
)

---Runs a given function on the next level
---@param funct function
---@param ... any
function TSIL.Utils.Functions.RunNextLevel(funct, ...)
    local args = {...}

    table.insert(FunctionsToRun, {funct = funct, params = args})
end