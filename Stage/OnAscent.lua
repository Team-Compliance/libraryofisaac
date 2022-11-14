---Helper function to check if the appropiate ascent flag is set.
---@return boolean
function TSIL.Stage.OnAscent()
    return Game():GetStateFlag(GameStateFlag.STATE_BACKWARDS_PATH)
end