local LOCAL_TSIL = {}
local LOCAL_TSIL_VERSION = 0.326

--- Initializes the TSIL library
---@param FolderName string
function LOCAL_TSIL.Init(FolderName)
	if not TSIL then
		--If TSIL hasnt been initialized yet, initialize it
		TSIL = {}
		TSIL.__PROXY = {}
		TSIL.__FUNCTION_VERSIONS = {}
		TSIL.__MODULES = {}
	else
		--There's another version of TSIL version, overwrite it
		for _, InternalCallback in pairs(TSIL.__INTERNAL_CALLBACKS) do
			TSIL.__DisableInternalCallback(InternalCallback.Id)
		end
	end

	--METATABLE
	local TSIL_META = {}

	function TSIL_META.__index(module, key)
		local proxy = rawget(module, "__PROXY")
		local modules = rawget(module, "__MODULES")

		local value = proxy[key]

		if value == nil then
			--The module is currently not in the proxy, create it
			value = {}
			value.__PROXY = {}
			value.__FUNCTION_VERSIONS = {}
			value.__MODULES = {}
			modules[key] = true
		end

		if modules[key] then
			--Only set the metatable if it's a module
			setmetatable(value, TSIL_META)
		end

		proxy[key] = value

		return value
	end

	function TSIL_META.__newindex(module, key, value)
		local proxy = rawget(module, "__PROXY")
		local functionVersions = rawget(module, "__FUNCTION_VERSIONS")

		if functionVersions[key] and LOCAL_TSIL_VERSION <= functionVersions[key] then
			--Trying to update from same/older version
			return
		end

		functionVersions[key] = LOCAL_TSIL_VERSION
		proxy[key] = value
	end

	setmetatable(TSIL, TSIL_META)

	--VARIABLES INITIALIZATION
	if not rawget(TSIL, "__PROXY").__MOD then
		rawget(TSIL, "__PROXY").__MOD = RegisterMod("TSIL_MOD", 1)
	end
	--Is always the highest version loaded
	TSIL.__VERSION = LOCAL_TSIL_VERSION
	--Is the last version loaded
	TSIL.__LOCAL_VERSION = LOCAL_TSIL_VERSION
	rawget(TSIL, "__PROXY").__LOCAL_VERSION = LOCAL_TSIL_VERSION
	--Is the last folder loaded
	TSIL.__LOCAL_FOLDER = FolderName
	rawget(TSIL, "__PROXY").__LOCAL_FOLDER = FolderName

	--- @class InternalTSILCallback
	--- @field Id string
	--- @field Version number
	--- @field Callback ModCallbacks | CustomCallback
	--- @field Funct function
	--- @field Priority integer | CallbackPriority
	--- @field OptionalParam integer | integer[]?
	--- @field Enabled boolean
	if not rawget(TSIL, "__PROXY").__INTERNAL_CALLBACKS then
		--- @type InternalTSILCallback[]
		TSIL.__INTERNAL_CALLBACKS = {}
	end

	if not rawget(TSIL, "__PROXY").__VERSION_PERSISTENT_DATA then
		TSIL.__VERSION_PERSISTENT_DATA = {}

		---@class RegisteredCustomCallback
		---@field Version number
		---@field Trigger function

		---@type table<CustomCallback, RegisteredCustomCallback>
		TSIL.__VERSION_PERSISTENT_DATA.RegisteredCustomCallbacks = {}

		--- @class PersistentVariable
		--- @field value any
		--- @field default any
		--- @field persistenceMode VariablePersistenceMode
		--- @field ignoreGlowingHourglass boolean
		--- @field conditionalSave? fun(): boolean

		--- @class ModPersistentData
		--- @field mod table
		--- @field variables table<string, PersistentVariable> Table where the keys represent the name of the variable

		--- Table where the keys represent the name of the mod
		--- @type table<string, ModPersistentData>
		TSIL.__VERSION_PERSISTENT_DATA.PersistentData = {}

		--- @type table<string, table<string, any>>
		TSIL.__VERSION_PERSISTENT_DATA.GlowingHourglassPersistentDataBackup = {}
	end

	--LOAD SCRIPTS
	local scripts = require(TSIL.__LOCAL_FOLDER .. ".scripts")

	for _, script in ipairs(scripts) do
		local hasError, error = pcall(function ()
			require(TSIL.__LOCAL_FOLDER .. "." ..  script)
		end)

		--TODO: Handle not found files better (it is expected)
		-- if not hasError then
		-- 	print("Error loading script (" .. TSIL.__LOCAL_FOLDER .. "." .. script .. ") : " .. error)
		-- end
	end

	--INTERNAL CALLBACKS
	for _, internalCallback in pairs(TSIL.__INTERNAL_CALLBACKS) do
		TSIL.__EnableInternalCallback(internalCallback.Id)
	end

	--TSIL LOAD CALLBACK
	TSIL.__RegisterCustomCallback(TSIL.Enums.CustomCallback.POST_TSIL_LOAD)
	TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_TSIL_LOAD)

	print("TSIL (" .. TSIL.__LOCAL_VERSION .. ") has been properly initialized.")
end

return LOCAL_TSIL