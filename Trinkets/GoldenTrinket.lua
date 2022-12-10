---Helper function to check if a given trinket type corresponds to a golden trinket.
---@param trinketType TrinketType
---@return boolean
function TSIL.Trinkets.IsGoldenTrinket(trinketType)
    return TSIL.Utils.Flags.HasFlags(trinketType, TrinketType.TRINKET_GOLDEN_FLAG)
end


---Helper function to get the golden trinket type corresponding to a normal trinket type.
---@param trinketType TrinketType
---@return integer
function TSIL.Trinkets.GetGoldenTrinketType(trinketType)
    return TSIL.Utils.Flags.AddFlags(trinketType, TrinketType.TRINKET_GOLDEN_FLAG)
end


---Helper function to get the normal trinket type corresponding to a golden trinket type.
---@param trinketType any
---@return integer
function TSIL.Trinkets.GetNormalTrinketTypeFromGoldenTrinketType(trinketType)
    return TSIL.Utils.Flags.RemoveFlags(trinketType, TrinketType.TRINKET_GOLDEN_FLAG)
end