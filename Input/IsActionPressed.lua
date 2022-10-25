--- Helper function to check if a given Button Action is being pressed in any controller.
---@param action ButtonAction
---@return boolean
function TSIL.Input.IsActionPressedOnAnyInput(action)
    for controllerIndex = 0, 3, 1 do
        if Input.IsButtonPressed(action, controllerIndex) then
            return true
        end
    end

    return false
end


--- Helper function to check if a given Button Action is being triggered in any controller.
---@param action ButtonAction
---@return boolean
function TSIL.Input.IsActionTriggeredOnAnyInput(action)
    for controllerIndex = 0, 3, 1 do
        if Input.IsButtonTriggered(action, controllerIndex) then
            return true
        end
    end

    return false
end