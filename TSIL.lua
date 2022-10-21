local LOCAL_TSIL = {}
local LOCAL_TSIL_VERSION = 0.1

---Initializes the TSIL library
---@param FolderName string
function LOCAL_TSIL.Init(FolderName)
    if not TSIL then
        --If TSIL hasnt been initialized yet, initialize it
        TSIL = {}
        TSIL.__PROXY = {}
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
    end

    --METATABLE
    local OldTSILVersion = TSIL.__VERSION or -1
    local TSIL_META = {}

    function TSIL_META.__index(module, key)
        local proxy = rawget(module, "__PROXY")

        if proxy[key] == nil then
            local newModule = {}
            newModule.__PROXY = {}
            setmetatable(newModule, TSIL_META)
            proxy[key] = newModule
        end

        return proxy[key]
    end

    function TSIL_META.__newindex(module, key, value)
        local proxy = rawget(module, "__PROXY")

        if proxy[key] and LOCAL_TSIL_VERSION <= OldTSILVersion then
            --Trying to update from same/older version
            return
        end

        proxy[key] = value
    end

    setmetatable(TSIL, TSIL_META)

    --VARIABLES INITIALIZATION
    TSIL.__MOD = RegisterMod("TSILMOD_" .. FolderName, 1)
    --Is always the highest version loaded
    TSIL.__VERSION = LOCAL_TSIL_VERSION
    --Is the last version loaded
    TSIL.__LOCAL_VERSION = LOCAL_TSIL_VERSION
    rawget(TSIL, "__PROXY").__LOCAL_VERSION = LOCAL_TSIL_VERSION
    --Is the last folder loaded
    TSIL.__LOCAL_FOLDER = FolderName
    rawget(TSIL, "__PROXY").__LOCAL_FOLDER = FolderName

    ---@type RegisteredVanillaCallback[]
    TSIL.__REGISTERED_VANILLA_CALLBACKS = {}
    rawget(TSIL, "__PROXY").__REGISTERED_VANILLA_CALLBACKS = {} --Always needs to be reset

    ---@class InternalTSILVanillaCallback
    ---@field Id string
    ---@field Callback ModCallbacks
    ---@field Funct function
    ---@field Priority integer | CallbackPriority
    ---@field OptionalParam integer?
    if not rawget(TSIL, "__PROXY").__INTERNAL_VANILLA_CALLBACKS then
        ---@type InternalTSILVanillaCallback[]
        TSIL.__INTERNAL_VANILLA_CALLBACKS = {}
    end

    ---@class InternalTSILCustomCallback
    ---@field Id string
    ---@field Callback CustomCallback
    ---@field Funct function
    ---@field Priority integer | CallbackPriority
    ---@field OptionalParam integer[]
    if not rawget(TSIL, "__PROXY").__INTERNAL_CUSTOM_CALLBACKS then
        ---@type InternalTSILCustomCallback[]
        TSIL.__INTERNAL_CUSTOM_CALLBACKS = {}
    end

    if not rawget(TSIL, "__PROXY").__VERSION_PERSISTENT_DATA then
        TSIL.__VERSION_PERSISTENT_DATA = {}

        ---@type {Callback : ModCallbacks, Functions : TSILVanillaCallback[]}[]
        TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList = {}

        ---@type {Callback : CustomCallback, Functions : TSILCustomCallback[]}[]
        TSIL.__VERSION_PERSISTENT_DATA.CustomCallbacksList = {}

        ---@type ModPersistentData[]
        TSIL.__VERSION_PERSISTENT_DATA.PersistentData = {}
    end

    --LOAD SCRIPTS
    local scripts = {
        --ENUMS
        "Enums.CallbackPriority",
        "Enums.CustomCallback",
        "Enums.InventoryType",
        "Enums.KnifeVariant",
        "Enums.LaserVariant",
        "Enums.SlotVariant",
        "Enums.VariablePersistenceMode",

        --COLLECTIBLES
        "Collectibles.GetCollectibles",
        "Collectibles.GetCollectiblesByQuality",
        "Collectibles.TryRemoveCollectible",

        --CUSTOM CALLBACKS
        "CustomCallbacks.AddCustomCallback",
        "CustomCallbacks.RemoveCustomCallback",
        "CustomCallbacks.AddVanillaCallback",
        "CustomCallbacks.RemoveVanillaCallback",
        "CustomCallbacks.RegisterVanillaCallbacks",
        "CustomCallbacks.InternalCallbacks",
        --Grid Entity Callbacks
        "CustomCallbacks.GridEntityCallbacks.GridUpdateCallback",
        "CustomCallbacks.GridEntityCallbacks.GridInitCallback",
        "CustomCallbacks.GridEntityCallbacks.GridCollisionCallback",
        --Player Callbacks
        "CustomCallbacks.PlayerCallbacks.PlayerCollectibleAdded",
        "CustomCallbacks.PlayerCallbacks.PlayerCollectibleRemoved",
        "CustomCallbacks.PlayerCallbacks.PlayerGulpedTrinketAdded",
        "CustomCallbacks.PlayerCallbacks.PlayerGulpedTrinketRemoved",
        --Slot Callbacks
        "CustomCallbacks.SlotCallbacks.SlotInitCallback",
        "CustomCallbacks.SlotCallbacks.SlotPrizeCallback",
        "CustomCallbacks.SlotCallbacks.SlotUpdateCallback",

        --ENTITIES
        "Entities.IsCollidingWithGrid",
        --Get Entities
        "Entities.GetEntities.GetBombs",
        "Entities.GetEntities.GetEffects",
        "Entities.GetEntities.GetEntities",
        "Entities.GetEntities.GetFamiliars",
        "Entities.GetEntities.GetKnives",
        "Entities.GetEntities.GetLasers",
        "Entities.GetEntities.GetNPCs",
        "Entities.GetEntities.GetPickups",
        "Entities.GetEntities.GetProjectiles",
        "Entities.GetEntities.GetSlots",
        "Entities.GetEntities.GetTears",

        --GRID ENTITIES
        "GridEntities.GetGridEntities",

        --PLAYERS
        --Get Players
        "Players.GetPlayers.GetClosestPlayers",
        "Players.GetPlayers.GetPlayers",
        "Players.GetPlayers.GetPlayersByCollectible",
        "Players.GetPlayers.GetPlayersByTrinket",
        --Players Inventory
        "Players.Inventory.AnyPlayerHasItem",
        "Players.Inventory.AnyPlayerHasTrinket",
        "Players.Inventory.PlayerInventory",
        --Player Index
        "Players.PlayerIndex.PlayerByIndex",
        "Players.PlayerIndex.PlayerIndex",
        --Tainted Laz
        "Players.TaintedLaz.IsActiveTaintedLaz",
        --Trinkets
        "Players.Trinkets.AddSmeltedTrinket",
        "Players.Trinkets.SmeltedTrinketMultiplier",

        --SAVE MANAGER
        "SaveManager.AddPersistentVariable",
        "SaveManager.GetPersistentVariable",
        "SaveManager.RemovePersistentVariable",
        "SaveManager.ResetPersistentVariable",
        "SaveManager.SetPersistentVariable",
        "SaveManager.VariableResetter",

        --UTILS
        --Easings
       "Utils.Easing.Easings",
        --Flags
        "Utils.Flags.AddFlags",
        "Utils.Flags.HasFlags",
        "Utils.Flags.RemoveFlags",
        --Functions
        "Utils.Functions.RunNextLevel",
        "Utils.Functions.RunNextRoom",
        "Utils.Functions.Scheduler",
        --Math
        "Utils.Math.CircleIntersectingRectangle",
        "Utils.Math.Clamp",
        "Utils.Math.Lerp",
        --Random
        "Utils.Random.RandomFloat",
        "Utils.Random.RandomFromTable",
        "Utils.Random.RandomFromWeighted",
        "Utils.Random.RandomInt",
        --Tables
        "Utils.Tables.Copy",
        "Utils.Tables.Count",
        "Utils.Tables.Filter",
        "Utils.Tables.FindFirst",
        "Utils.Tables.ForEach",
        "Utils.Tables.IsInTable",
        "Utils.Tables.Equals",
        "Utils.Tables.Remove",
    }

    for _, script in ipairs(scripts) do
        local hasError, error = pcall(function ()
            require(TSIL.__LOCAL_FOLDER .. "." ..  script)
        end)

        --TODO: Handle not found files better (it is expected)
        if not hasError then
            print("Error loading script (" .. TSIL.__LOCAL_FOLDER .. "." .. script .. ") : " .. error)
        end
    end

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

    print("TSIL (" .. TSIL.__LOCAL_VERSION .. ") has been properly initialized.")
end

return LOCAL_TSIL