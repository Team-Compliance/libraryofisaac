local PILL_EFFECT_NAMES = {
    [PillEffect.PILLEFFECT_BAD_GAS] = "Bad Gas",
    [PillEffect.PILLEFFECT_BAD_TRIP] = "Bad Trip",
    [PillEffect.PILLEFFECT_BALLS_OF_STEEL] = "Balls of Steel",
    [PillEffect.PILLEFFECT_BOMBS_ARE_KEYS] = "Bombs Are Key",
    [PillEffect.PILLEFFECT_EXPLOSIVE_DIARRHEA] = "Explosive Diarrhea",
    [PillEffect.PILLEFFECT_FULL_HEALTH] = "Full Health",
    [PillEffect.PILLEFFECT_HEALTH_DOWN] = "Health Down",
    [PillEffect.PILLEFFECT_HEALTH_UP] = "Health Up",
    [PillEffect.PILLEFFECT_I_FOUND_PILLS] = "I Found Pills",
    [PillEffect.PILLEFFECT_PUBERTY] = "Puberty",
    [PillEffect.PILLEFFECT_PRETTY_FLY] = "Pretty Fly",
    [PillEffect.PILLEFFECT_RANGE_DOWN] = "Range Down",
    [PillEffect.PILLEFFECT_RANGE_UP] = "Range Up",
    [PillEffect.PILLEFFECT_SPEED_DOWN] = "Speed Down",
    [PillEffect.PILLEFFECT_SPEED_UP] = "Speed Up",
    [PillEffect.PILLEFFECT_TEARS_DOWN] = "Tears Down",
    [PillEffect.PILLEFFECT_TEARS_UP] = "Tears Up",
    [PillEffect.PILLEFFECT_LUCK_DOWN] = "Luck Down",
    [PillEffect.PILLEFFECT_LUCK_UP] = "Luck Up",
    [PillEffect.PILLEFFECT_TELEPILLS] = "Telepills",
    [PillEffect.PILLEFFECT_48HOUR_ENERGY] = "48 Hour Energy",
    [PillEffect.PILLEFFECT_HEMATEMESIS] = "Hematemesis",
    [PillEffect.PILLEFFECT_PARALYSIS] = "Paralysis",
    [PillEffect.PILLEFFECT_SEE_FOREVER] = "I can see forever!",
    [PillEffect.PILLEFFECT_PHEROMONES] = "Pheromones",
    [PillEffect.PILLEFFECT_AMNESIA] = "Amnesia",
    [PillEffect.PILLEFFECT_LEMON_PARTY] = "Lemon Party",
    [PillEffect.PILLEFFECT_WIZARD] = "R U a Wizard?",
    [PillEffect.PILLEFFECT_PERCS] = "Percs!",
    [PillEffect.PILLEFFECT_ADDICTED] = "Addicted!",
    [PillEffect.PILLEFFECT_RELAX] = "Re-Lax",
    [PillEffect.PILLEFFECT_QUESTIONMARK] = "???",
    [PillEffect.PILLEFFECT_LARGER] = "One makes you larger",
    [PillEffect.PILLEFFECT_SMALLER] = "One makes you small",
    [PillEffect.PILLEFFECT_INFESTED_EXCLAMATION] = "Infested!",
    [PillEffect.PILLEFFECT_INFESTED_QUESTION] = "Infested?",
    [PillEffect.PILLEFFECT_POWER] = "Power Pill!",
    [PillEffect.PILLEFFECT_RETRO_VISION] = "Retro Vision",
    [PillEffect.PILLEFFECT_FRIENDS_TILL_THE_END] = "Friends Till The End!",
    [PillEffect.PILLEFFECT_X_LAX] = "X-Lax",
    [PillEffect.PILLEFFECT_SOMETHINGS_WRONG] = "Something's wrong...",
    [PillEffect.PILLEFFECT_IM_DROWSY] = "I'm Drowsy...",
    [PillEffect.PILLEFFECT_IM_EXCITED] = "I'm Excited!!!",
    [PillEffect.PILLEFFECT_GULP] = "Gulp!",
    [PillEffect.PILLEFFECT_HORF] = "Horf!",
    [PillEffect.PILLEFFECT_SUNSHINE] = "Feels like I'm walking on sunshine!",
    [PillEffect.PILLEFFECT_VURP] = "Vurp!",
    [PillEffect.PILLEFFECT_SHOT_SPEED_DOWN] = "Shot Speed Down",
    [PillEffect.PILLEFFECT_SHOT_SPEED_UP] = "Shot Speed Up",
    [PillEffect.PILLEFFECT_EXPERIMENTAL] = "Experimental Pill",
}


--- Helper function to get the name of a given pill effect.
--- For modded pill effects it returns the name set in the xml.
---@param pillEffect PillEffect
---@return string
function TSIL.Pills.GetPillEffectName(pillEffect)
    local pillEffectName = PILL_EFFECT_NAMES[pillEffect]

    if pillEffectName then
        return pillEffectName
    end

    local itemConfig = Isaac.GetItemConfig()
    local pillEffectConfig = itemConfig:GetPillEffect(pillEffect)

    return pillEffectConfig.Name
end