--- Creates a new per-player persistent variable.
--- 
--- Acts exactly the same as a regular variable created with `TSIL.SaveManager.AddPersistentVariable`, but
--- allows you to use `TSIL.SaveManager.GetPersistentPlayerVariable` and `TSIL.SaveManager.SetPersistentPlayerVariable`.
---@param mod table
---@param variableName string
---@param defaultValue any
---@param persistenceMode VariablePersistenceMode
---@param differentiateSoulAndForgotten? boolean @Default: false | Whether the Soul and Forgotten should be counted as separate players.
---@param ignoreGlowingHourglass? boolean @Default: false
---@param conditionalSave? fun(): boolean
function TSIL.SaveManager.AddPersistentPlayerVariable(mod, variableName, defaultValue, persistenceMode, differentiateSoulAndForgotten, ignoreGlowingHourglass, conditionalSave)
    TSIL.SaveManager.AddPersistentVariable(
        mod,
        variableName,
        {},
        persistenceMode,
        ignoreGlowingHourglass,
        conditionalSave
    )

    local playerVariables = TSIL.__VERSION_PERSISTENT_DATA.PersistentPlayerData[mod.Name]
    if not playerVariables then
        playerVariables = {}
        TSIL.__VERSION_PERSISTENT_DATA.PersistentPlayerData[mod.Name] = playerVariables
    end

    playerVariables[variableName] = {
        default = TSIL.Utils.DeepCopy.DeepCopy(defaultValue, TSIL.Enums.SerializationType.NONE),
        differentiateSoulAndForgotten = differentiateSoulAndForgotten
    }
end