--- Helper function that calculates what the StageType should be for the provided LevelStage in the current run. This
--- emulates what the game's internal code does.
---@param stage LevelStage
---@return StageType
function TSIL.Stage.CalculateStageType(stage)
    -- The following is the game's internal code to determine the floor type. (This came directly from
    -- Spider.)

    --[[
      u32 Seed = g_Game->GetSeeds().GetStageSeed(NextStage);
      if (!g_Game->IsGreedMode()) {
        StageType = ((Seed % 2) == 0 && (
          ((NextStage == STAGE1_1 || NextStage == STAGE1_2) && gd.Unlocked(ACHIEVEMENT_CELLAR)) ||
          ((NextStage == STAGE2_1 || NextStage == STAGE2_2) && gd.Unlocked(ACHIEVEMENT_CATACOMBS)) ||
          ((NextStage == STAGE3_1 || NextStage == STAGE3_2) && gd.Unlocked(ACHIEVEMENT_NECROPOLIS)) ||
          ((NextStage == STAGE4_1 || NextStage == STAGE4_2)))
        ) ? STAGE_TYPE_WOTL : STAGE_TYPE_ORIGINAL;
      if (Seed % 3 == 0 && NextStage < STAGE5)
        StageType = STAGE_TYPE_AFTERBIRTH;
    ]]--

    local seeds = Game():GetSeeds()
    local stageSeed = seeds:GetStageSeed(stage)

    if stageSeed % 2 == 0 then
        return StageType.STAGETYPE_WOTL
    end

    if stageSeed % 3 == 0 then
        return StageType.STAGETYPE_AFTERBIRTH
    end

    return StageType.STAGETYPE_ORIGINAL
end
