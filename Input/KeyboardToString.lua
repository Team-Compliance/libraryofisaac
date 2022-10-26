local KEYBOARD_TO_STRING = {
    [Keyboard.KEY_SPACE] = { " ", " " },
    [Keyboard.KEY_APOSTROPHE] = { "'", '"' },
    [Keyboard.KEY_COMMA] = { ",", "<" },
    [Keyboard.KEY_MINUS] = { "-", "_" },
    [Keyboard.KEY_PERIOD] = { ".", ">" },
    [Keyboard.KEY_SLASH] = { "/", "?" },

    [Keyboard.KEY_0] = { "0", ")" },
    [Keyboard.KEY_1] = { "1", "!" },
    [Keyboard.KEY_2] = { "2", "@" },
    [Keyboard.KEY_3] = { "3", "#" },
    [Keyboard.KEY_4] = { "4", "$" },
    [Keyboard.KEY_5] = { "5", "%" },
    [Keyboard.KEY_6] = { "6", "^" },
    [Keyboard.KEY_7] = { "7", "&" },
    [Keyboard.KEY_8] = { "8", "*" },
    [Keyboard.KEY_9] = { "9", "(" },

    [Keyboard.KEY_SEMICOLON] = { ";", ":" },
    [Keyboard.KEY_EQUAL] = { "=", "+" },

    [Keyboard.KEY_A] = { "a", "A" },
    [Keyboard.KEY_B] = { "b", "B" },
    [Keyboard.KEY_C] = { "c", "C" },
    [Keyboard.KEY_D] = { "d", "D" },
    [Keyboard.KEY_E] = { "e", "E" },
    [Keyboard.KEY_F] = { "f", "F" },
    [Keyboard.KEY_G] = { "g", "G" },
    [Keyboard.KEY_H] = { "h", "H" },
    [Keyboard.KEY_I] = { "i", "I" },
    [Keyboard.KEY_J] = { "j", "J" },
    [Keyboard.KEY_K] = { "k", "K" },
    [Keyboard.KEY_L] = { "l", "L" },
    [Keyboard.KEY_M] = { "m", "M" },
    [Keyboard.KEY_N] = { "n", "N" },
    [Keyboard.KEY_O] = { "o", "O" },
    [Keyboard.KEY_P] = { "p", "P" },
    [Keyboard.KEY_Q] = { "q", "Q" },
    [Keyboard.KEY_R] = { "r", "R" },
    [Keyboard.KEY_S] = { "s", "S" },
    [Keyboard.KEY_T] = { "t", "T" },
    [Keyboard.KEY_U] = { "u", "U" },
    [Keyboard.KEY_V] = { "v", "V" },
    [Keyboard.KEY_W] = { "w", "W" },
    [Keyboard.KEY_X] = { "x", "X" },
    [Keyboard.KEY_Y] = { "y", "Y" },
    [Keyboard.KEY_Z] = { "z", "Z" },

    [Keyboard.KEY_KP_0] = { "0", "0" },
    [Keyboard.KEY_KP_1] = { "1", "1" },
    [Keyboard.KEY_KP_2] = { "2", "2" },
    [Keyboard.KEY_KP_3] = { "3", "3" },
    [Keyboard.KEY_KP_4] = { "4", "4" },
    [Keyboard.KEY_KP_5] = { "5", "5" },
    [Keyboard.KEY_KP_6] = { "6", "6" },
    [Keyboard.KEY_KP_7] = { "7", "7" },
    [Keyboard.KEY_KP_8] = { "8", "8" },
    [Keyboard.KEY_KP_9] = { "9", "9" },

    [Keyboard.KEY_KP_DECIMAL] = { ".", "." },
    [Keyboard.KEY_KP_DIVIDE] = { "/", "/" },
    [Keyboard.KEY_KP_MULTIPLY] = { "*", "*" },
    [Keyboard.KEY_KP_SUBTRACT] = { "-", "-" },
    [Keyboard.KEY_KP_ADD] = { "+", "+" },

    [Keyboard.KEY_LEFT_BRACKET] = { "[", "{" },
    [Keyboard.KEY_BACKSLASH] = { "\\", "|" },
    [Keyboard.KEY_RIGHT_BRACKET] = { "]", "}" },
    [Keyboard.KEY_GRAVE_ACCENT] = { "`", "~" },
}


--- Helper function to get the string that would be typed if someone pressed the corresponding key.
---@param key Keyboard
---@param shiftPressed boolean
---@return string
function TSIL.Input.KeyboardToString(key, shiftPressed)
    local keyResult = KEYBOARD_TO_STRING[key]

    if shiftPressed then
        return keyResult[2]
    else
        return keyResult[1]
    end
end
