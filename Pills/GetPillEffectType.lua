local PILL_EFFECT_TYPES = {
    [PillEffect.BAD_GAS] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.BAD_TRIP] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.BALLS_OF_STEEL] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.BOMBS_ARE_KEYS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.EXPLOSIVE_DIARRHEA] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.FULL_HEALTH] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.HEALTH_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.HEALTH_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.I_FOUND_PILLS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PUBERTY] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PRETTY_FLY] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.RANGE_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.RANGE_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.SPEED_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.SPEED_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.TEARS_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.TEARS_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.LUCK_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.LUCK_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.TELEPILLS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.FORTY_EIGHT_HOUR_ENERGY] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.HEMATEMESIS] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.PARALYSIS] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.I_CAN_SEE_FOREVER] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.PHEROMONES] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.AMNESIA] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.LEMON_PARTY] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.R_U_A_WIZARD] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.PERCS] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.ADDICTED] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.RELAX] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.QUESTION_MARKS] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.ONE_MAKES_YOU_LARGER] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.ONE_MAKES_YOU_SMALL] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.INFESTED_EXCLAMATION] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.INFESTED_QUESTION] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.POWER] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.RETRO_VISION] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.FRIENDS_TILL_THE_END] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.X_LAX] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.SOMETHINGS_WRONG] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.IM_DROWSY] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.IM_EXCITED] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.GULP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.HORF] = TSIL.Enums.PillEffectType.NEUTRAL,
    [PillEffect.FEELS_LIKE_IM_WALKING_ON_SUNSHINE] =
      TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.VURP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.SHOT_SPEED_DOWN] = TSIL.Enums.PillEffectType.NEGATIVE,
    [PillEffect.SHOT_SPEED_UP] = TSIL.Enums.PillEffectType.POSITIVE,
    [PillEffect.EXPERIMENTAL] = TSIL.Enums.PillEffectType.NEUTRAL,
}


--- Helper function to get the `PillEffectType` of a given pill effect.
---
--- Due to API limitations, it'll returns `PillEffectType.MODDED` for modded pills.
---@param pillEffect PillEffect
---@return PillEffectType
function TSIL.GetPillEffectType(pillEffect)
    local pillEffectType = PILL_EFFECT_TYPES[pillEffect]

    if pillEffectType then
        return pillEffectType
    end

    return TSIL.Enums.PillEffectType.MODDED
end