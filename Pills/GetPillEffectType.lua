local PILL_EFFECT_TYPES = {
    [PillEffect.PILLEFFECT_BAD_GAS] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_BAD_TRIP] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_BALLS_OF_STEEL] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_BOMBS_ARE_KEYS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_EXPLOSIVE_DIARRHEA] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_FULL_HEALTH] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_HEALTH_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_HEALTH_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_I_FOUND_PILLS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_PUBERTY] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_PRETTY_FLY] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_RANGE_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_RANGE_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_SPEED_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_SPEED_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_TEARS_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_TEARS_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_LUCK_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_LUCK_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_TELEPILLS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_48HOUR_ENERGY] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_HEMATEMESIS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_PARALYSIS] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_SEE_FOREVER] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_PHEROMONES] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_AMNESIA] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_LEMON_PARTY] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_WIZARD] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_PERCS] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_ADDICTED] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_RELAX] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_QUESTIONMARK] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_LARGER] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_SMALLER] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_INFESTED_EXCLAMATION] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_INFESTED_QUESTION] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_POWER] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_RETRO_VISION] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_FRIENDS_TILL_THE_END] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_X_LAX] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_SOMETHINGS_WRONG] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_IM_DROWSY] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_IM_EXCITED] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_GULP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_HORF] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PILLEFFECT_SUNSHINE] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_VURP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_SHOT_SPEED_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PILLEFFECT_SHOT_SPEED_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PILLEFFECT_EXPERIMENTAL] = TSIL.Enums.PillEffectType.NEUTRAL,
}


--- Helper function to get the `PillEffectType` of a given pill effect.
---
--- Due to API limitations, it'll returns `PillEffectType.MODDED` for modded pills.
---@param pillEffect PillEffect
---@return PillEffectType
function TSIL.Pills.GetPillEffectType(pillEffect)
    local pillEffectType = PILL_EFFECT_TYPES[pillEffect]

    if pillEffectType then
        return pillEffectType
    end

    return TSIL.Enums.PillEffectType.MODDED
end