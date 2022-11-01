--- Helper function to check if a given Button Action corresponds to shooting.
---@param buttonAction ButtonAction
---@return boolean
function TSIL.Input.IsShootAction(buttonAction)
    local shootActions = TSIL.Input.GetShootActions()
    return TSIL.Utils.Tables.IsIn(shootActions, buttonAction)
end


--- Helper function to check if a shoot action is being pressed in any controller.
---@return boolean
function TSIL.Input.IsShootActionPressedOnAnyInput()
    local shootActions = TSIL.Input.GetShootActions()

    for _, action in ipairs(shootActions) do
        if TSIL.Input.IsActionPressedOnAnyInput(action) then
            return true
        end
    end

    return false
end


--- Helper function to check if a shoot action is being triggered in any controller.
---@return boolean
function TSIL.Input.IsShootActionTriggeredOnAnyInput()
    local shootActions = TSIL.Input.GetShootActions()

    for _, action in ipairs(shootActions) do
        if TSIL.Input.IsActionTriggeredOnAnyInput(action) then
            return true
        end
    end

    return false
end