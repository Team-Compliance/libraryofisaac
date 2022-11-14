--- Helper function to check if the current stage type is equal to `StageType.STAGETYPE_REPENTANCE` or `StageType.STAGETYPE_REPENTANCE_B`
---@return boolean
function TSIL.Stage.OnRepentanceStage()
    local level = Game():GetLevel()
    local stageType = level:GetStageType()
    
    return stageType == StageType.STAGETYPE_REPENTANCE or stageType == StageType.STAGETYPE_REPENTANCE_B
end