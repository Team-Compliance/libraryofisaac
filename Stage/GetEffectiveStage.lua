---Helper function to account for Repentance floors being offset by 1. For example, Downpour 2 is
---the third level of the run, but the game considers it to have a stage of 2. This function will
---consider Downpour 2 to have a stage of 3.
---@return integer
function TSIL.Stage.GetEffectiveStage()
    local level = Game():GetLevel()
    local stage = level:GetStage()

    if TSIL.Stage.OnRepentanceStage() then
        return stage + 1
    end

    return stage
end