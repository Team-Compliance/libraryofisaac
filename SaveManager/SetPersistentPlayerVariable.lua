--- Sets a per-player variable from the save manager.
---@param mod table
---@param variableName string
---@param player EntityPlayer
---@param newValue any
function TSIL.SaveManager.SetPersistentPlayerVariable(mod, variableName, player, newValue)
	local persistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData
    local persistentPlayerData = TSIL.__VERSION_PERSISTENT_DATA.PersistentPlayerData

	local modPersistentData = persistentData[mod.Name]
    local modPersistentPlayerData = persistentPlayerData[mod.Name]

	if modPersistentData == nil or modPersistentPlayerData == nil then
		--The mod doesn't have any persistent data
		return
	end

	local modVariables = modPersistentData.variables

	local foundVariable = modVariables[variableName]
    local playerVariableData = modPersistentPlayerData[variableName]

	if foundVariable == nil or playerVariableData == nil then
		--The variable doesn't exist
		return
	end

    local playerIndex = TSIL.Players.GetPlayerIndex(player, playerVariableData.differentiateSoulAndForgotten)
	foundVariable.value[playerIndex] = newValue
end