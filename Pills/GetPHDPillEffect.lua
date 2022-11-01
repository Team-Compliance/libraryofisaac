local PHD_PILL_CONVERSIONS = {
    [PillEffect.PILLEFFECT_BAD_TRIP] = PillEffect.PILLEFFECT_BALLS_OF_STEEL,
    [PillEffect.PILLEFFECT_HEALTH_DOWN] = PillEffect.PILLEFFECT_HEALTH_UP,
    [PillEffect.PILLEFFECT_RANGE_DOWN] = PillEffect.PILLEFFECT_RANGE_UP,
    [PillEffect.PILLEFFECT_SPEED_DOWN] = PillEffect.PILLEFFECT_SPEED_UP,
    [PillEffect.PILLEFFECT_TEARS_DOWN] = PillEffect.PILLEFFECT_TEARS_UP,
    [PillEffect.PILLEFFECT_LUCK_DOWN] = PillEffect.PILLEFFECT_LUCK_UP,
    [PillEffect.PILLEFFECT_PARALYSIS] = PillEffect.PILLEFFECT_PHEROMONES,
    [PillEffect.PILLEFFECT_AMNESIA] = PillEffect.PILLEFFECT_SEE_FOREVER,
    [PillEffect.PILLEFFECT_WIZARD] = PillEffect.PILLEFFECT_POWER,
    [PillEffect.PILLEFFECT_ADDICTED] = PillEffect.PILLEFFECT_PERCS,
    [PillEffect.PILLEFFECT_QUESTIONMARK] = PillEffect.PILLEFFECT_TELEPILLS,
    [PillEffect.PILLEFFECT_RETRO_VISION] = PillEffect.PILLEFFECT_SEE_FOREVER,
    [PillEffect.PILLEFFECT_X_LAX] = PillEffect.PILLEFFECT_SOMETHINGS_WRONG,
    [PillEffect.PILLEFFECT_IM_EXCITED] = PillEffect.PILLEFFECT_IM_DROWSY,
    [PillEffect.PILLEFFECT_HORF] = PillEffect.PILLEFFECT_GULP,
    [PillEffect.PILLEFFECT_SHOT_SPEED_DOWN] = PillEffect.PILLEFFECT_SHOT_SPEED_UP,
}

local FALSE_PHD_PILL_CONVERSIONS = {
    [PillEffect.PILLEFFECT_BAD_GAS] = PillEffect.PILLEFFECT_HEALTH_DOWN,
    [PillEffect.PILLEFFECT_BALLS_OF_STEEL] = PillEffect.PILLEFFECT_BAD_TRIP,
    [PillEffect.PILLEFFECT_BOMBS_ARE_KEYS] = PillEffect.PILLEFFECT_TEARS_DOWN,
    [PillEffect.PILLEFFECT_EXPLOSIVE_DIARRHEA] = PillEffect.PILLEFFECT_RANGE_DOWN,
    [PillEffect.PILLEFFECT_FULL_HEALTH] = PillEffect.PILLEFFECT_BAD_TRIP,
    [PillEffect.PILLEFFECT_HEALTH_UP] = PillEffect.PILLEFFECT_HEALTH_DOWN,
    [PillEffect.PILLEFFECT_PRETTY_FLY] = PillEffect.PILLEFFECT_LUCK_DOWN,
    [PillEffect.PILLEFFECT_RANGE_UP] = PillEffect.PILLEFFECT_RANGE_DOWN,
    [PillEffect.PILLEFFECT_SPEED_UP] = PillEffect.PILLEFFECT_SPEED_DOWN,
    [PillEffect.PILLEFFECT_TEARS_UP] = PillEffect.PILLEFFECT_TEARS_DOWN,
    [PillEffect.PILLEFFECT_LUCK_UP] = PillEffect.PILLEFFECT_LUCK_DOWN,
    [PillEffect.PILLEFFECT_TELEPILLS] = PillEffect.PILLEFFECT_QUESTIONMARK,
    [PillEffect.PILLEFFECT_48HOUR_ENERGY] = PillEffect.PILLEFFECT_SPEED_DOWN,
    [PillEffect.PILLEFFECT_HEMATEMESIS] = PillEffect.PILLEFFECT_BAD_TRIP,
    [PillEffect.PILLEFFECT_SEE_FOREVER] = PillEffect.PILLEFFECT_AMNESIA,
    [PillEffect.PILLEFFECT_PHEROMONES] = PillEffect.PILLEFFECT_PARALYSIS,
    [PillEffect.PILLEFFECT_LEMON_PARTY] = PillEffect.PILLEFFECT_AMNESIA,
    [PillEffect.PILLEFFECT_PERCS] = PillEffect.PILLEFFECT_ADDICTED,
    [PillEffect.PILLEFFECT_LARGER] = PillEffect.PILLEFFECT_RANGE_DOWN,
    [PillEffect.PILLEFFECT_SMALLER] = PillEffect.PILLEFFECT_SPEED_DOWN,
    [PillEffect.PILLEFFECT_INFESTED_EXCLAMATION] = PillEffect.PILLEFFECT_TEARS_DOWN,
    [PillEffect.PILLEFFECT_INFESTED_QUESTION] = PillEffect.PILLEFFECT_LUCK_DOWN,
    [PillEffect.PILLEFFECT_POWER] = PillEffect.PILLEFFECT_WIZARD,
    [PillEffect.PILLEFFECT_FRIENDS_TILL_THE_END] = PillEffect.PILLEFFECT_HEALTH_DOWN,
    [PillEffect.PILLEFFECT_SOMETHINGS_WRONG] = PillEffect.PILLEFFECT_X_LAX,
    [PillEffect.PILLEFFECT_IM_DROWSY] = PillEffect.PILLEFFECT_IM_EXCITED,
    [PillEffect.PILLEFFECT_GULP] = PillEffect.PILLEFFECT_HORF,
    [PillEffect.PILLEFFECT_SUNSHINE] = PillEffect.PILLEFFECT_RETRO_VISION,
    [PillEffect.PILLEFFECT_VURP] = PillEffect.PILLEFFECT_HORF,
    [PillEffect.PILLEFFECT_SHOT_SPEED_UP] = PillEffect.PILLEFFECT_SHOT_SPEED_DOWN,
}


--- Helper function to get the corresponding pill effect a pill effect would be
--- converted into after picking up PHD.
---
--- If the pill wouldn't transform, it returns the same pill effect.
---@param pillEffect PillEffect
---@return PillEffect
function TSIL.Pills.GetPHDPillEffect(pillEffect)
    local PHDEffect = PHD_PILL_CONVERSIONS[pillEffect]
    if not PHDEffect then PHDEffect = pillEffect end
    return PHDEffect
end


--- Helper function to get the corresponding pill effect a pill effect would be
--- converted into after picking up False PHD.
---
--- If the pill wouldn't transform, it returns the same pill effect.
---@param pillEffect PillEffect
---@return PillEffect
function TSIL.Pills.GetFalsePHDPillEffect(pillEffect)
    local PHDEffect = FALSE_PHD_PILL_CONVERSIONS[pillEffect]
    if not PHDEffect then PHDEffect = pillEffect end
    return PHDEffect
end