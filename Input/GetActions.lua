local MOVE_ACTIONS = {
    ButtonAction.ACTION_LEFT,
    ButtonAction.ACTION_UP,
    ButtonAction.ACTION_RIGHT,
    ButtonAction.ACTION_DOWN
}

local SHOOT_ACTIONS = {
    ButtonAction.ACTION_SHOOTLEFT,
    ButtonAction.ACTION_SHOOTUP,
    ButtonAction.ACTION_SHOOTRIGHT,
    ButtonAction.ACTION_SHOOTDOWN
}


--- Helper function to get all the values of the `ButtonAction` enum that correspond to movement.
---@return ButtonAction[]
function TSIL.Input.GetMoveActions()
    return TSIL.Utils.Tables.Copy(MOVE_ACTIONS)
end


--- Helper function to get all the values of the `ButtonAction` enum that correspond to shooting.
---@return ButtonAction[]
function TSIL.Input.GetShootActions()
    return TSIL.Utils.Tables.Copy(SHOOT_ACTIONS)
end