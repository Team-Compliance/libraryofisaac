--- Helper function that calculates what the Repentance StageType should be for the provided LevelStage.
--- This emulates what the game's internal code does.
---@param stage LevelStage
---@return StageType
function TSIL.Stage.CalculateStageTypeRepentance(stage)
    -- There is no alternate floor for Corpse.
    if stage == LevelStage.WOMB_1 or stage == LevelStage.WOMB_2 then
        return StageType.STAGETYPE_REPENTANCE
    end

    -- This algorithm is from Kilburn. We add one because the alt path is offset by 1 relative to the
    -- normal path.
    local seeds = Game():GetSeeds()
    local adjustedStage = stage + 1
    local stageSeed = seeds:GetStageSeed(adjustedStage)

    -- Kilburn does not know why he divided the stage seed by 2 first.
    local halfStageSeed = math.floor(stageSeed / 2)

    if halfStageSeed % 2 == 0 then
        return StageType.STAGETYPE_REPENTANCE_B
    end

    return StageType.STAGETYPE_REPENTANCE
end
