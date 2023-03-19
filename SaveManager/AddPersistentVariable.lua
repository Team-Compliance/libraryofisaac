--##use SaveManager/SaveDataManager.lua

--- Adds a variable to the save manager.
--- The variable name must be unique within your mod.
---@param mod table
---@param variableName string
---@param value any
---@param persistenceMode VariablePersistenceMode
---@param ignoreGlowingHourglass? boolean @Default: false
---@param conditionalSave? fun(): boolean
function TSIL.SaveManager.AddPersistentVariable(mod, variableName, value, persistenceMode, ignoreGlowingHourglass, conditionalSave)
	if ignoreGlowingHourglass == nil then
		ignoreGlowingHourglass = false
	end

	local PersistentData = TSIL.__VERSION_PERSISTENT_DATA.PersistentData

	local modPersistentData = PersistentData[mod.Name]

	if modPersistentData == nil then
		---@type ModPersistentData
		modPersistentData = {
			mod = mod,
			variables = {}
		}
		PersistentData[mod.Name] = modPersistentData
	end

	local modVariables = modPersistentData.variables

	local foundVariable = modVariables[variableName]

	if foundVariable ~= nil then
		--The variable already exists
		return
	end

	---@type PersistentVariable
	local newVariable = {
		default = TSIL.Utils.DeepCopy.DeepCopy(value, TSIL.Enums.SerializationType.NONE),
		value = value,
		persistenceMode = persistenceMode,
		ignoreGlowingHourglass = ignoreGlowingHourglass,
		conditionalSave = conditionalSave
	}
	modVariables[variableName] = newVariable
end