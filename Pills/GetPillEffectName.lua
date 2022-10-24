local PILL_EFFECT_NAMES = {
    [PillEffect.BAD_GAS] = "Bad Gas",
    [PillEffect.BAD_TRIP] = "Bad Trip",
    [PillEffect.BALLS_OF_STEEL] = "Balls of Steel",
    [PillEffect.BOMBS_ARE_KEYS] = "Bombs Are Key",
    [PillEffect.EXPLOSIVE_DIARRHEA] = "Explosive Diarrhea",
    [PillEffect.FULL_HEALTH] = "Full Health",
    [PillEffect.HEALTH_DOWN] = "Health Down",
    [PillEffect.HEALTH_UP] = "Health Up",
    [PillEffect.I_FOUND_PILLS] = "I Found Pills",
    [PillEffect.PUBERTY] = "Puberty",
    [PillEffect.PRETTY_FLY] = "Pretty Fly",
    [PillEffect.RANGE_DOWN] = "Range Down",
    [PillEffect.RANGE_UP] = "Range Up",
    [PillEffect.SPEED_DOWN] = "Speed Down",
    [PillEffect.SPEED_UP] = "Speed Up",
    [PillEffect.TEARS_DOWN] = "Tears Down",
    [PillEffect.TEARS_UP] = "Tears Up",
    [PillEffect.LUCK_DOWN] = "Luck Down",
    [PillEffect.LUCK_UP] = "Luck Up",
    [PillEffect.TELEPILLS] = "Telepills",
    [PillEffect.FORTY_EIGHT_HOUR_ENERGY] = "48 Hour Energy",
    [PillEffect.HEMATEMESIS] = "Hematemesis",
    [PillEffect.PARALYSIS] = "Paralysis",
    [PillEffect.I_CAN_SEE_FOREVER] = "I can see forever!",
    [PillEffect.PHEROMONES] = "Pheromones",
    [PillEffect.AMNESIA] = "Amnesia",
    [PillEffect.LEMON_PARTY] = "Lemon Party",
    [PillEffect.R_U_A_WIZARD] = "R U a Wizard?",
    [PillEffect.PERCS] = "Percs!",
    [PillEffect.ADDICTED] = "Addicted!",
    [PillEffect.RELAX] = "Re-Lax",
    [PillEffect.QUESTION_MARKS] = "???",
    [PillEffect.ONE_MAKES_YOU_LARGER] = "One makes you larger",
    [PillEffect.ONE_MAKES_YOU_SMALL] = "One makes you small",
    [PillEffect.INFESTED_EXCLAMATION] = "Infested!",
    [PillEffect.INFESTED_QUESTION] = "Infested?",
    [PillEffect.POWER] = "Power Pill!",
    [PillEffect.RETRO_VISION] = "Retro Vision",
    [PillEffect.FRIENDS_TILL_THE_END] = "Friends Till The End!",
    [PillEffect.X_LAX] = "X-Lax",
    [PillEffect.SOMETHINGS_WRONG] = "Something's wrong...",
    [PillEffect.IM_DROWSY] = "I'm Drowsy...",
    [PillEffect.IM_EXCITED] = "I'm Excited!!!",
    [PillEffect.GULP] = "Gulp!",
    [PillEffect.HORF] = "Horf!",
    [PillEffect.FEELS_LIKE_IM_WALKING_ON_SUNSHINE] =
      "Feels like I'm walking on sunshine!",
    [PillEffect.VURP] = "Vurp!",
    [PillEffect.SHOT_SPEED_DOWN] = "Shot Speed Down",
    [PillEffect.SHOT_SPEED_UP] = "Shot Speed Up",
    [PillEffect.EXPERIMENTAL] = "Experimental Pill",
}


--- Helper function to get the name of a given pill effect.
--- For modded pill effects it returns the name set in the xml.
---@param pillEffect PillEffect
---@return string
function TSIL.GetPillEffectName(pillEffect)
    local pillEffectName = PILL_EFFECT_NAMES[pillEffect]

    if pillEffectName then
        return pillEffectName
    end

    local itemConfig = Isaac.GetItemConfig()
    local pillEffectConfig = itemConfig:GetPillEffect(pillEffect)

    return pillEffectConfig.Name
end