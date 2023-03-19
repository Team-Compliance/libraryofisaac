--##use SaveManager/SaveDataManager.lua

--- Gets a variable from the save manager.
---@param mod table
---@param variableName string
---@return any
function TSIL.SaveManager.GetPersistentVariable(mod, variableName)
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

	return foundVariable.value
end