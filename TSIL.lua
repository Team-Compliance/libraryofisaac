local LOCAL_TSIL = {}
local LOCAL_TSIL_VERSION = 0.1

--- Initializes the TSIL library
--- @param UserMod table
--- @param FolderName string
function LOCAL_TSIL.Init(UserMod, FolderName)
	if not TSIL then
		--If TSIL hasnt been initialized yet, initialize it
		TSIL = {}
		TSIL.__PROXY = {}
		TSIL.__FUNCTION_VERSIONS = {}
	else
		--There's another version of TSIL version, overwrite it
		for _, InternalVanillaCallback in pairs(TSIL.__INTERNAL_VANILLA_CALLBACKS) do
			TSIL.RemoveVanillaCallback(
				TSIL.__MOD,
				InternalVanillaCallback.Callback,
				InternalVanillaCallback.Funct
			)
		end

		for _, InternalCustomCallback in pairs(TSIL.__INTERNAL_CUSTOM_CALLBACKS) do
			TSIL.RemoveCustomCallback(
				TSIL.__MOD,
				InternalCustomCallback.Callback,
				InternalCustomCallback.Funct
			)
		end

		for _, vanillaCallback in ipairs(TSIL.__REGISTERED_VANILLA_CALLBACKS) do
			TSIL.__MOD:RemoveCallback(vanillaCallback.Callback, vanillaCallback.Funct)
		end

		--Remove all callbacks that the given mod has
		for _, vanillaCallback in ipairs(TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList) do
			local filteredFunctions = {}

			for _, callbackFunct in ipairs(vanillaCallback.Functions) do
				if callbackFunct.Mod.Name ~= UserMod.Name then
					filteredFunctions[#filteredFunctions+1] = callbackFunct
				end
			end

			vanillaCallback.Functions = filteredFunctions
		end

		for _, customCallback in ipairs(TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList) do
			local filteredFunctions = {}

			for _, callbackFunct in ipairs(customCallback.Functions) do
				if callbackFunct.Mod.Name ~= UserMod.Name then
					filteredFunctions[#filteredFunctions+1] = callbackFunct
				end
			end

			customCallback.Functions = filteredFunctions
		end
	end

	--METATABLE
	local TSIL_META = {}

	function TSIL_META.__index(module, key)
		local proxy = rawget(module, "__PROXY")

		if proxy[key] == nil then
			local newModule = {}
			newModule.__PROXY = {}
			newModule.__FUNCTION_VERSIONS = {}
			setmetatable(newModule, TSIL_META)
			proxy[key] = newModule
		end

		return proxy[key]
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
	rawget(TSIL, "__PROXY").__MOD = RegisterMod("TSILMOD_" .. FolderName, 1)
	--Is always the highest version loaded
	TSIL.__VERSION = LOCAL_TSIL_VERSION
	--Is the last version loaded
	TSIL.__LOCAL_VERSION = LOCAL_TSIL_VERSION
	rawget(TSIL, "__PROXY").__LOCAL_VERSION = LOCAL_TSIL_VERSION
	--Is the last folder loaded
	TSIL.__LOCAL_FOLDER = FolderName
	rawget(TSIL, "__PROXY").__LOCAL_FOLDER = FolderName

	--- @type RegisteredVanillaCallback[]
	TSIL.__REGISTERED_VANILLA_CALLBACKS = {}
	rawget(TSIL, "__PROXY").__REGISTERED_VANILLA_CALLBACKS = {} --Always needs to be reset

	--- @class InternalTSILVanillaCallback
	--- @field Id string
	--- @field Version number
	--- @field Callback ModCallbacks
	--- @field Funct function
	--- @field Priority integer | CallbackPriority
	--- @field OptionalParam integer?
	if not rawget(TSIL, "__PROXY").__INTERNAL_VANILLA_CALLBACKS then
		--- @type InternalTSILVanillaCallback[]
		TSIL.__INTERNAL_VANILLA_CALLBACKS = {}
	end

	--- @class InternalTSILCustomCallback
	--- @field Id string
	--- @field Version number
	--- @field Callback CustomCallback
	--- @field Funct function
	--- @field Priority integer | CallbackPriority
	--- @field OptionalParam integer[]
	if not rawget(TSIL, "__PROXY").__INTERNAL_CUSTOM_CALLBACKS then
		--- @type InternalTSILCustomCallback[]
		TSIL.__INTERNAL_CUSTOM_CALLBACKS = {}
	end

	if not rawget(TSIL, "__PROXY").__VERSION_PERSISTENT_DATA then
		TSIL.__VERSION_PERSISTENT_DATA = {}

		--- @type {Callback : ModCallbacks, Functions : TSILVanillaCallback[]}[]
		TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList = {}

		--- @type {Callback : CustomCallback, Functions : TSILCustomCallback[]}[]
		TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList = {}

		---@class RegisteredCustomCallback
		---@field Version number
		---@field Trigger function

		---@type table<CustomCallback, RegisteredCustomCallback>
		TSIL.__VERSION_PERSISTENT_DATA.RegisteredCustomCallbacks = {}

		--- @class PersistentVariable
		--- @field name string
		--- @field value any
		--- @field default any
		--- @field persistenceMode VariablePersistenceMode
		--- @field ignoreGlowingHourglass boolean
		--- @field conditionalSave? fun(): boolean

		--- @class ModPersistentData
		--- @field mod string
		--- @field variables PersistentVariable[]

		--- @type ModPersistentData[]
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
		if not hasError then
			print("Error loading script (" .. TSIL.__LOCAL_FOLDER .. "." .. script .. ") : " .. error)
		end
	end

	--REGISTER VANILLA CALLBACKS
	TSIL.__RegisterVanillaCallbacks()

	--ADD INTERNAL CALLBACKS
	for _, InternalVanillaCallback in ipairs(TSIL.__INTERNAL_VANILLA_CALLBACKS) do
		TSIL.AddVanillaCallback(
			TSIL.__MOD,
			InternalVanillaCallback.Callback,
			InternalVanillaCallback.Funct,
			InternalVanillaCallback.Priority + 1000000,
			InternalVanillaCallback.OptionalParam
		)
	end

	for _, InternalCustomCallback in ipairs(TSIL.__INTERNAL_CUSTOM_CALLBACKS) do
		TSIL.AddCustomCallback(
			TSIL.__MOD,
			InternalCustomCallback.Callback,
			InternalCustomCallback.Funct,
			InternalCustomCallback.Priority + 1000000,
			table.unpack(InternalCustomCallback.OptionalParam)
		)
	end

	--Add all vanilla callbacks in one, so as to avoid conflicts (PRE_PLAYER_COLLISION)
	for _, vanillaCallback in ipairs(TSIL.__REGISTERED_VANILLA_CALLBACKS) do
		TSIL.__MOD:AddCallback(vanillaCallback.Callback, vanillaCallback.Funct)
	end

	--TSIL LOAD CALLBACK
	for _, CustomCallback in ipairs(TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList) do
		if CustomCallback.Callback == TSIL.Enums.CustomCallback.POST_TSIL_LOAD then
			for _, funct in ipairs(CustomCallback.Functions) do
				funct.Funct(funct.Mod)
			end
		end
	end

	print("TSIL (" .. TSIL.__LOCAL_VERSION .. ") has been properly initialized.")
end

return LOCAL_TSIL