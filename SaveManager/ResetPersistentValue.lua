--##use SaveManager/SaveDataManager.lua

--- Resets a variable to its default value in the save manager.
---@param mod table
---@param variableName string
function TSIL.SaveManager.ResetPersistentVariable(mod, variableName)
	local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData

	local modPersistentData = PersistentData[mod.Name]

	if modPersistentData == nil then
		--The mod doesn't have any persistent data
		return
	end

	local modVariables = modPersistentData.variables

	local foundVariable = modVariables[variableName]

	if foundVariable == nil then
		--The variable doesn't exists
		return
	end

	foundVariable.value = TSIL.Utils.DeepCopy.DeepCopy(foundVariable.default, TSIL.Enums.SerializationType.NONE)
end