---@class TrinketSituation
---@field TrinketTypeRemoved TrinketType
---@field TrinketType1 TrinketType
---@field TrinketType2 TrinketType
---@field NumSmeltedTrinkets integer


--- Helper function to temporarily remove a specific kind of trinket from the player. Use this in
--- combination with the `giveTrinketsBack` function to take away and give back a trinket on the same
--- frame. This function correctly handles multiple trinket slots and ensures that all copies of the
--- trinket are removed, including smelted trinkets.
---
--- Note that one smelted golden trinket is the same as two smelted normal trinkets.
---@param player EntityPlayer
---@param trinketType TrinketType
---@return TrinketSituation?
function TSIL.Players.TemporarilyRemoveTrinket(player, trinketType)
    if not player:HasTrinket(trinketType) then
        return nil
    end

    local trinketType1 = player:GetTrinket(0)
    local trinketType2 = player:GetTrinket(1)

    local numTrinkets = 0
    while player:HasTrinket(trinketType) do
        player:TryRemoveTrinket(trinketType)
        numTrinkets = numTrinkets + 1
    end

    local numSmeltedTrinkets = numTrinkets
    local trinketWasInSlot1 = trinketType1 == trinketType or
        trinketType1 == TSIL.Trinkets.GetGoldenTrinketType(trinketType)
    if trinketWasInSlot1 then
        numSmeltedTrinkets = numSmeltedTrinkets - 1
    end

    local trinketWasInSlot2 = trinketType2 == trinketType or
        trinketType2 == TSIL.Trinkets.GetGoldenTrinketType(trinketType)
    if trinketWasInSlot2 then
        numSmeltedTrinkets = numSmeltedTrinkets - 1
    end

    return {
        TrinketTypeRemoved = trinketType,
        TrinketType1 = trinketType1,
        TrinketType2 = trinketType2,
        NumSmeltedTrinkets = numSmeltedTrinkets,
    }
end


--- Helper function to temporarily removes a player's held trinkets, if any. This will not remove any
--- smelted trinkets. Use this in combination with the `giveTrinketsBack` function to take away and
--- give back trinkets on the same frame.
---@param player EntityPlayer
---@return TrinketSituation?
function TSIL.Players.TemporarilyRemoveTrinkets(player)
    local trinketType1 = player:GetTrinket(0)
    local trinketType2 = player:GetTrinket(1)

    if trinketType1 == TrinketType.TRINKET_NULL and trinketType2 == TrinketType.TRINKET_NULL then
        return nil
    end

    if trinketType1 ~= TrinketType.TRINKET_NULL then
        player:TryRemoveTrinket(trinketType1)
    end

    if trinketType2 ~= TrinketType.TRINKET_NULL then
        player:TryRemoveTrinket(trinketType2)
    end

    return {
        TrinketTypeRemoved = TrinketType.TRINKET_NULL,
        TrinketType1 = trinketType1,
        TrinketType2 = trinketType2,
        NumSmeltedTrinkets = 0,
    }
end


--- Helper function to restore the player's trinkets back to the way they were before the
--- `temporarilyRemoveTrinket` function was used. It will re-smelt any smelted trinkets that were
--- removed.
---@param player EntityPlayer
---@param trinketSituation TrinketSituation?
function TSIL.Players.GiveTrinketsBack(player, trinketSituation)
    -- A trinket situation of undefined signifies that we did not have to remove the trinket. If this
    -- is the case, we do not have to give anything back.
    if trinketSituation == nil then
        return
    end

    local trinketType1 = player:GetTrinket(0)
    local trinketType2 = player:GetTrinket(1)

    -- Remove any existing trinkets.
    if trinketType1 ~= TrinketType.TRINKET_NULL then
        player:TryRemoveTrinket(trinketType1)
    end

    if trinketType2 ~= TrinketType.TRINKET_NULL then
        player:TryRemoveTrinket(trinketType2)
    end

    -- First, add the smelted trinkets back.
    for _ = 1, trinketSituation.NumSmeltedTrinkets, 1 do
        TSIL.Players.AddSmeltedTrinket(player, trinketSituation.TrinketTypeRemoved)
    end

    -- Second, add back the stored trinkets.
    if trinketSituation.TrinketType1 ~= TrinketType.TRINKET_NULL then
        player:AddTrinket(trinketSituation.TrinketType1, false)
    end
    if trinketSituation.TrinketType2 ~= TrinketType.TRINKET_NULL then
        player:AddTrinket(trinketSituation.TrinketType2, false)
    end
end
