--- Returns the maximum heart containers that the provided character can have. Normally, this is 12,
--- but with Keeper it is 3, and with Tainted Keeper it is 2. This does not account for Birthright or
--- Mother's Kiss; use the `GetPlayerMaxHeartContainers` helper function for that.
---@param character PlayerType
---@return integer
function TSIL.Players.GetCharacterMaxHeartContainers(character)
    -- 14
    if character == PlayerType.PLAYER_KEEPER then
        return 3
    end

    -- 16
    if character == PlayerType.PLAYER_THEFORGOTTEN then
        return 6
    end

    -- 17
    if character == PlayerType.PLAYER_THESOUL then
        return 6
    end

    -- 33
    if character == PlayerType.PLAYER_KEEPER_B then
        return 2
    end

    return 12
end


---Helper function to get the max amount of heart containers a player
---can have.
---@param player EntityPlayer
function TSIL.Players.GetPlayerMaxHeartContainers(player)
    local character = player:GetPlayerType()
    local characterMaxHeartContainers = TSIL.Players.GetCharacterMaxHeartContainers(character)

    -- 1
    -- Magdalene can increase her maximum heart containers with Birthright.
    if character == PlayerType.MAGDALENE and player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
        local extraMaxHeartContainersFromBirthright = 6
        return characterMaxHeartContainers + extraMaxHeartContainersFromBirthright
    end

    -- 14, 33
    -- Keeper and Tainted Keeper can increase their coin containers with Mother's Kiss and Greed's
    -- Gullet.
    if TSIL.Players.IsKeeper(player) then
        local numMothersKisses = player:GetTrinketMultiplier(TrinketType.MOTHERS_KISS)
        local hasGreedsGullet = player:HasCollectible(CollectibleType.GREEDS_GULLET)
        local coins = player:GetNumCoins()
        local greedsGulletCoinContainers = 0

        if hasGreedsGullet then
            greedsGulletCoinContainers = math.floor(coins / 25)
        end

        return characterMaxHeartContainers +
            numMothersKisses +
            greedsGulletCoinContainers
    end

    return characterMaxHeartContainers
end
