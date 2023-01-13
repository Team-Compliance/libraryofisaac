---Helper function to check if a player is either Keeper of T.Keeper.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsKeeper(player)
    return player:GetPlayerType() == PlayerType.PLAYER_KEEPER or
    player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B
end


---Helper function to check if a player is any form of tainted lazarus.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsTaintedLazarus(player)
    return player:GetPlayerType() == PlayerType.PLAYER_LAZARUS2 or
    player:GetPlayerType() == PlayerType.PLAYER_LAZARUS2_B
end