local FunctionsToRun = {}

local function OnNewRoom()
    TSIL.Utils.Tables.ForEach(FunctionsToRun, function (_, functionToRun)
        functionToRun.funct(table.unpack(functionToRun.params))
    end)

    FunctionsToRun = {}
end
TSIL.CALLBACKS["RUN_NEXT_ROOM_POST_NEW_ROOM"] =
{callback = ModCallbacks.MC_POST_NEW_ROOM, funct = OnNewRoom}

---Runs a given function on the next room
---@param funct function
---@param ... any
function TSIL.Utils.Functions.RunNextRoom(funct, ...)
    local args = {...}

    table.insert(FunctionsToRun, {funct = funct, params = args})
end