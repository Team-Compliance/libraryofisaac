local KEYBOARD_TO_STRING = {
    [Keyboard.SPACE] = {" ", " "},
    [Keyboard.APOSTROPHE] = {"'", '"'},
    [Keyboard.COMMA] = {",", "<"},
    [Keyboard.MINUS] = {"-", "_"},
    [Keyboard.PERIOD] = {".", ">"},
    [Keyboard.SLASH] = {"/", "?"},
  
    [Keyboard.ZERO] = {"0", ")"},
    [Keyboard.ONE] = {"1", "!"},
    [Keyboard.TWO] = {"2", "@"},
    [Keyboard.THREE] = {"3", "#"},
    [Keyboard.FOUR] = {"4", "$"},
    [Keyboard.FIVE] = {"5", "%"},
    [Keyboard.SIX] = {"6", "^"},
    [Keyboard.SEVEN] = {"7", "&"},
    [Keyboard.EIGHT] = {"8", "*"},
    [Keyboard.NINE] = {"9", "("},
  
    [Keyboard.SEMICOLON] = {";", ":"},
    [Keyboard.EQUAL] = {"=", "+"},
  
    [Keyboard.A] = {"a", "A"},
    [Keyboard.B] = {"b", "B"},
    [Keyboard.C] = {"c", "C"},
    [Keyboard.D] = {"d", "D"},
    [Keyboard.E] = {"e", "E"},
    [Keyboard.F] = {"f", "F"},
    [Keyboard.G] = {"g", "G"},
    [Keyboard.H] = {"h", "H"},
    [Keyboard.I] = {"i", "I"},
    [Keyboard.J] = {"j", "J"},
    [Keyboard.K] = {"k", "K"},
    [Keyboard.L] = {"l", "L"},
    [Keyboard.M] = {"m", "M"},
    [Keyboard.N] = {"n", "N"},
    [Keyboard.O] = {"o", "O"},
    [Keyboard.P] = {"p", "P"},
    [Keyboard.Q] = {"q", "Q"},
    [Keyboard.R] = {"r", "R"},
    [Keyboard.S] = {"s", "S"},
    [Keyboard.T] = {"t", "T"},
    [Keyboard.U] = {"u", "U"},
    [Keyboard.V] = {"v", "V"},
    [Keyboard.W] = {"w", "W"},
    [Keyboard.X] = {"x", "X"},
    [Keyboard.Y] = {"y", "Y"},
    [Keyboard.Z] = {"z", "Z"},
  
    [Keyboard.KP_0] = {"0", "0"},
    [Keyboard.KP_1] = {"1", "1"},
    [Keyboard.KP_2] = {"2", "2"},
    [Keyboard.KP_3] = {"3", "3"},
    [Keyboard.KP_4] = {"4", "4"},
    [Keyboard.KP_5] = {"5", "5"},
    [Keyboard.KP_6] = {"6", "6"},
    [Keyboard.KP_7] = {"7", "7"},
    [Keyboard.KP_8] = {"8", "8"},
    [Keyboard.KP_9] = {"9", "9"},
  
    [Keyboard.KP_DECIMAL] = {".", "."},
    [Keyboard.KP_DIVIDE] = {"/", "/"},
    [Keyboard.KP_MULTIPLY] = {"*", "*"},
    [Keyboard.KP_SUBTRACT] = {"-", "-"},
    [Keyboard.KP_ADD] = {"+", "+"},
  
    [Keyboard.LEFT_BRACKET] = {"[", "{"},
    [Keyboard.BACKSLASH] = {"\\", "|"},
    [Keyboard.RIGHT_BRACKET] = {"]", "}"},
    [Keyboard.GRAVE_ACCENT] = {"`", "~"},
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