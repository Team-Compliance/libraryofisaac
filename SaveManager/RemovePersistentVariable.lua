--##use SaveManager/SaveDataManager.lua

--- Removes a variable from the save manager.
---@param mod table
---@param variableName string
function TSIL.SaveManager.RemovePersistentVariable(mod, variableName)
	local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData

	local tables = TSIL.Utils.Tables

	local modPersistentData = PersistentData[mod.Name]

	if modPersistentData == nil then
		--The mod doesn't have any persistent data
		return
	end

	local modVariables = modPersistentData.variables

	modVariables[variableName] = nil
end