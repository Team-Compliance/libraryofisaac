---Copies a color.
---@param color Color
---@return Color
function TSIL.Color.CopyColor(color)
    if not TSIL.IsaacAPIClass.IsColor(color) then
        error("Failed to copy a Color object since the provided object was not a userdata Color class.")
    end

    local tint = color:GetTint()
    local offset = color:GetOffset()
    local colorize = color:GetColorize()

    return Color(
        tint.R,
        tint.G,
        tint.B,
        tint.A,
        offset.R,
        offset.G,
        offset.B,
        colorize.R,
        colorize.G,
        colorize.B,
        colorize.A
    )
end


---Helper function to copy a `KColor` Isaac API class.
---@param kColor KColor
---@return KColor
function TSIL.Color.CopyKColor(kColor)
    if not TSIL.IsaacAPIClass.IsKColor(kColor) then
        error("Failed to copy a KColor object since the provided object was not a userdata KColor class.")
    end

    return KColor(
        kColor.Red,
        kColor.Green,
        kColor.Blue,
        kColor.Alpha
    )
end