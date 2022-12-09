--- Helper function to get all familiars that belong to a given player.
---@param player EntityPlayer
---@return EntityFamiliar[]
function TSIL.Familiars.GetPlayerFamiliars(player)
    local playerPtrHash = GetPtrHash(player)
    local familiars = TSIL.EntitySpecific.GetFamiliars()

    return TSIL.Utils.Tables.Filter(familiars, function (_, familiar)
        local familiarPlayerPtrHash = GetPtrHash(familiar.Player)
        return playerPtrHash == familiarPlayerPtrHash
    end)
end