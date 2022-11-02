local HEX_STRING_LENGTH = 6

---@param hex string
---@return integer
---@return integer
---@return integer
local function HexToRGB(hex)
    hex = hex:gsub("%#", "")

    if hex:len() ~= HEX_STRING_LENGTH then
        return 0, 0, 0
    end

    local rString = hex:sub(1, 2)
    local r = tonumber("0x" .. rString)
    if r == nil then
        return 0, 0, 0
    end

    local gString = hex:sub(3, 4)
    local g = tonumber("0x" .. gString)
    if g == nil then
        return 0, 0, 0
    end

    local bString = hex:sub(5, 6)
    local b = tonumber("0x" .. bString)
    if b == nil then
        return 0, 0, 0
    end

    return r, g, b
end


---Converts a hex string like "#33aa33" to a Color object.
---@param hex string
---@param alpha number
---@return Color
function TSIL.Color.HexToColor(hex, alpha)
    local r, g, b = HexToRGB(hex)
    return Color(r/255, g/255, b/255, alpha)
end


---Converts a hex string like "#33aa33" to a KColor object.
---@param hex string
---@param alpha number
---@return KColor
function TSIL.Color.HexToKColor(hex, alpha)
    local r, g, b = HexToRGB(hex)
    return KColor(r/255, g/255, b/255, alpha)
end