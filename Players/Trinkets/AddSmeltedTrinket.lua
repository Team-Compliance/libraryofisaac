---Gives the player an smelted trinket.
---Will not change the player's current held trinkets.
---@param player EntityPlayer
---@param trinketId TrinketType
function TSIL.Players.AddSmeltedTrinket(player, trinketId)
    local heldTrinket = player:GetTrinket(0)
    local heldTrinket2 = player:GetTrinket(1)

    if heldTrinket == 0 then
        --The player has no trinkets
        player:AddTrinket(trinketId, false)
        player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, UseFlag.USE_NOANIM)
    else
        --The player has at least 1 trinket
        if heldTrinket2 ~= 0 then
            player:TryRemoveTrinket(heldTrinket2)
        end

        player:TryRemoveTrinket(heldTrinket)

        player:AddTrinket(trinketId, false)
        player:UseActiveItem(CollectibleType.COLLECTIBLE_SMELTER, UseFlag.USE_NOANIM)

        player:AddTrinket(heldTrinket, false)

        if heldTrinket2 ~= 0 then
            player:AddTrinket(heldTrinket2, false)
        end
    end
end