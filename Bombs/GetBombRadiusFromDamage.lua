---Helper function to find out how large a bomb explosion is based on the damage inflicted.
---@param damage number
---@return number
function TSIL.Bombs.GetBombRadiusFromDamage(damage)
    if damage > 175 then
        return 105
    elseif damage <= 140 then
        return 75
    else
        return 90
    end
end