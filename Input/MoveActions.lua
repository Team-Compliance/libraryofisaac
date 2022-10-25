--- Helper function to check if a given Button Action corresponds to movement.
---@param buttonAction ButtonAction
---@return boolean
function TSIL.Input.IsMoveAction(buttonAction)
    local moveActions = TSIL.Input.GetMoveActions()
    return TSIL.Utils.Tables.IsIn(moveActions, buttonAction)
end


--- Helper function to check if a move action is being pressed in any controller.
---@return boolean
function TSIL.Input.IsMoveActionPressedOnAnyInput()
    local moveActions = TSIL.Input.GetMoveActions()

    for _, action in ipairs(moveActions) do
        if TSIL.Input.IsActionPressedOnAnyInput(action) then
            return true
        end
    end

    return false
end


--- Helper function to check if a move action is being triggered in any controller.
---@return boolean
function TSIL.Input.IsMoveActionTriggeredOnAnyInput()
    local moveActions = TSIL.Input.GetMoveActions()

    for _, action in ipairs(moveActions) do
        if TSIL.Input.IsActionTriggeredOnAnyInput(action) then
            return true
        end
    end

    return false
end