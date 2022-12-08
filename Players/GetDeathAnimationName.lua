local LOST_STYLE_CHARACTERS_SET = {
    [PlayerType.PLAYER_THELOST] = true, -- 10
    [PlayerType.PLAYER_THESOUL] = true, -- 17
    [PlayerType.PLAYER_THELOST_B] = true, -- 31
    [PlayerType.PLAYER_JACOB2_B] = true, -- 39
    [PlayerType.PLAYER_THESOUL_B] = true, -- 40
}

---Helper function to determine which death animation a character will play
--- - Most characters have a 56 frame death animation (i.e. the "Death" animation).
--- - The Lost and Tainted Lost have a 38 frame death animation (i.e. the "LostDeath" animation).
--- - Tainted Forgotten has a 20 frame death animation (i.e. the "ForgottenDeath" animation).
---@param character PlayerType
---@return string
function TSIL.Players.GetCharacterDeathAnimationName(character)
    if LOST_STYLE_CHARACTERS_SET[character] then
        return "LostDeath"
    end

    if character == PlayerType.PLAYER_THEFORGOTTEN_B then
        return "ForgottenDeath"
    end

    return "Death"
end
