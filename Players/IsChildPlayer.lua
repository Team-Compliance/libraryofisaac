---Helper function to detect if a player is a "child player", meaning they
---have a defined `Parent` field (i.e. Strawman players)
---@param player EntityPlayer
function TSIL.Players.IsChildPlayer(player)
    return player.Parent ~= nil
end