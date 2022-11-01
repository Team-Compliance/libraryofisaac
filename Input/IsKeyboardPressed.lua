local MODIFIER_KEYS = {
  Keyboard.KEY_LEFT_SHIFT,
  Keyboard.KEY_LEFT_CONTROL,
  Keyboard.KEY_LEFT_ALT,
  Keyboard.KEY_LEFT_SUPER,
  Keyboard.KEY_RIGHT_SHIFT,
  Keyboard.KEY_RIGHT_CONTROL,
  Keyboard.KEY_RIGHT_ALT,
  Keyboard.KEY_RIGHT_SUPER,
}


--- Helper function to see if any of the given keys are being pressed in the keyboard.
---@param ... Keyboard
---@return boolean
function TSIL.Input.IsKeyboardPressed(...)
    local keys = {...}

    for _, key in ipairs(keys) do
        if Input.IsButtonPressed(key, 0) then
            return true
        end
    end

    return false
end


--- Helper function to get the modifier key that is being pressed in the keyboard
---
--- A modifier key is defined as shift, control, alt, or Windows.
---@return Keyboard? @ The modifier key that's being pressed, or nil if there are none.
function TSIL.Input.GetPressedModifier()
    for _, key in ipairs(MODIFIER_KEYS) do
        if Input.IsButtonPressed(key, 0) then
            return key
        end
    end
end