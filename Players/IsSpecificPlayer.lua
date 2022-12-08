---Helper function to check if a player is either Keeper of T.Keeper.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsKeeper(player)
    return player:GetPlayerType() == PlayerType.PLAYER_KEEPER or
    player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B
end