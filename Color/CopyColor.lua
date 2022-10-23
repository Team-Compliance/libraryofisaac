---Copies a color
---@param color Color
---@return Color
function TSIL.Color.CopyColor(color)
    return Color(
        color.R,
        color.G,
        color.B,
        color.A,
        color.RO,
        color.GO,
        color.BO
    )
end