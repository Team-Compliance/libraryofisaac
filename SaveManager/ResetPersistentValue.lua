--##use SaveManager/VariableResetter.lua

--- Resets a variable to its default value in the save manager.
--- @param mod table
--- @param variableName string
function TSIL.SaveManager.ResetPersistentVariable(mod, variableName)
	local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData

	local tables = TSIL.Utils.Tables

	local modPersistentData = tables.FindFirst(PersistentData, function (_, modPersistentData)
		return modPersistentData.mod == mod.Name
	end)

	if modPersistentData == nil then
		--The mod doesn't have any persistent data
		return
	end

	local modVariables = modPersistentData.variables

	local foundVariable = tables.FindFirst(modVariables, function (_, modVariable)
		return modVariable.name == variableName
	end)

	if foundVariable == nil then
		--The variable doesn't exists
		return
	end

	foundVariable.value = foundVariable.default
end