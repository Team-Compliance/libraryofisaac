---Returns a list of all players.
---@param ignoreCoopBabies? boolean @default: true
---@return EntityPlayer[]
function TSIL.Players.GetPlayers(ignoreCoopBabies)
    if ignoreCoopBabies == nil then
        ignoreCoopBabies = true
    end

    local players = {}

    for i = 0, Game():GetNumPlayers() - 1, 1 do
        local player = Game():GetPlayer(i)

        if not ignoreCoopBabies or player.Variant ~= 1 then
            table.insert(players, player)
        end
    end

    return players
end