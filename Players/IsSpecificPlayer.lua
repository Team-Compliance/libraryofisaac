---Helper function to check if a player is either Keeper of T.Keeper.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsKeeper(player)
    return player:GetPlayerType() == PlayerType.PLAYER_KEEPER or
    player:GetPlayerType() == PlayerType.PLAYER_KEEPER_B
end


---Helper function to check if a player is any form of Tainted Lazarus.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsTaintedLazarus(player)
    return player:GetPlayerType() == PlayerType.PLAYER_LAZARUS2 or
    player:GetPlayerType() == PlayerType.PLAYER_LAZARUS2_B
end


---Helper function to check if a player is The Lost or T.The Lost.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsTheLost(player)
    return player:GetPlayerType() == PlayerType.PLAYER_THELOST or
    player:GetPlayerType() == PlayerType.PLAYER_THELOST_B
end


---Helper function to check if a player is Bethany or T.Bethany.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsBethany(player)
    return player:GetPlayerType() == PlayerType.PLAYER_BETHANY or
    player:GetPlayerType() == PlayerType.PLAYER_BETHANY_B
end


---Helper function to check if a player is either Jacob or Esau. Note that
---this will only be true for the non tainted versions.
---@param player EntityPlayer
---@return boolean
function TSIL.Players.IsJacobOrEsau(player)
    return player:GetPlayerType() == PlayerType.PLAYER_JACOB or
    player:GetPlayerType() == PlayerType.PLAYER_ESAU
end