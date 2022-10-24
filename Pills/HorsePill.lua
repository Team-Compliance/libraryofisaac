--- Helper function to get the corresponding horse pill color from a normal pill color
---@param pillColor PillColor
---@return PillColor
function TSIL.Pills.GetHorsePillCollor(pillColor)
    ---@diagnostic disable-next-line: return-type-mismatch
    return pillColor | PillColor.PILL_COLOR_MASK
end


--- Helper function to get the corresponding normal pill color from a horse pill color
---@param pillColor PillColor
---@return PillColor
function TSIL.Pills.GetNormalPillColorFromHorsePill(pillColor)
    ---@diagnostic disable-next-line: return-type-mismatch
    return TSIL.Utils.Flags.RemoveFlags(pillColor, PillColor.PILL_COLOR_MASK)
end


--- Helper function to check if a pill color corresponds to a horse pill.
---@param pillColor PillColor
---@return boolean
function TSIL.Pills.IsHorsePill(pillColor)
    return TSIL.Utils.Flags.HasFlags(pillColor, PillColor.PILL_COLOR_MASK)
end