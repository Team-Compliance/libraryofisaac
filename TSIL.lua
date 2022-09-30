local LOCAL_TSIL = {}
local LOCAL_TSIL_VERSION = 0.1

function LOCAL_TSIL.Init(FolderName)
    if not TSIL then
        --If TSIL hasnt been initialized yet, initialize it
        TSIL = {}
    elseif TSIL.VERSION >= LOCAL_TSIL_VERSION then
        --If theres already an instance with a higher version, we don't need to overwrite it
        --TODO: Change the >= to > to avoid overwritting same version (there for testing)
        return
    else
        --There's an older TSIL version, overwrite it
        for _, TSILcallback in pairs(TSIL.CALLBACKS) do
            TSIL.MOD:RemoveCallback(TSILcallback.callback, TSILcallback.funct)
        end

        for _, TSILcallback in pairs(TSIL.CUSTOM_CALLBACKS) do
            TSIL.RemoveCustomCallback(TSIL.MOD, TSILcallback.callback, TSILcallback.funct)
        end
    end

    TSIL.MOD = RegisterMod("TSILMOD", 1)
    TSIL.VERSION = LOCAL_TSIL_VERSION
    TSIL.LOCAL_FOLDER = FolderName

    if not TSIL.CALLBACKS then
        TSIL.CALLBACKS = {}
    end

    if not TSIL.CUSTOM_CALLBACKS then
        TSIL.CUSTOM_CALLBACKS = {}
    end

    if not TSIL.VERSION_PERSISTENT_DATA then
        TSIL.VERSION_PERSISTENT_DATA = {}
        TSIL.VERSION_PERSISTENT_DATA.CustomCallbacksList = {}
        ---@type ModPersistentData[]
        TSIL.VERSION_PERSISTENT_DATA.PersistentData = {}
    end

    local scripts = {
        --COLLECTIBLES
        "Collectibles.GetCollectibles",
        "Collectibles.GetCollectiblesByQuality",

        --CUSTOM CALLBACKS
        "CustomCallbacks.AddCustomCallback",
        "CustomCallbacks.RemoveCustomCallback",
        --Grid Entity Callbacks
        "CustomCallbacks.GridEntityCallbacks.GridUpdateCallback",
        --Player Callbacks
        "CustomCallbacks.PlayerCallbacks.PlayerCollectibleAdded",
        "CustomCallbacks.PlayerCallbacks.PlayerCollectibleRemoved",
        "CustomCallbacks.PlayerCallbacks.PlayerGulpedTrinketAdded",
        "CustomCallbacks.PlayerCallbacks.PlayerGulpedTrinketRemoved",
        --Slot Callbacks
        "CustomCallbacks.SlotCallbacks.SlotInitCallback",
        "CustomCallbacks.SlotCallbacks.SlotPrizeCallback",
        "CustomCallbacks.SlotCallbacks.SlotUpdateCallback",

        --ENUMS
        "Enums.CustomCallback",
        "Enums.InventoryType",
        "Enums.SlotVariant",
        "Enums.VariablePersistenceMode",

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
        --"Players.Inventory.PlayerInventory",
        --Player Index
        "Players.PlayerIndex.PlayerByIndex",
        "Players.PlayerIndex.PlayerIndex",
        --Tainted Laz
        "Players.TaintedLaz.IsActiveTaintedLaz",
        --Trinkets
        "Players.Trinkets.AddSmeltedTrinket",
        "Players.Trinkets.SmeltedTrinketMultiplier",

        --SAVE MANAGER

        --UTILS
        --Flags
        "Utils.Flags.AddFlags",
        "Utils.Flags.HasFlags",
        "Utils.Flags.RemoveFlags",
        --Functions
        "Utils.Functions.RunNextLevel",
        "Utils.Functions.RunNextRoom",
        "Utils.Functions.Scheduler",
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
        "Utils.Tables.IsInTable"
    }

    local TSILmodules = {
        "Collectibles",
        "Enums",
        "GridEntities",
        "Players",
        "SaveManager",
        ["Utils"] = {
            "Flags",
            "Functions",
            "Random",
            "Tables"
        }
    }

    for key, value in pairs(TSILmodules) do
        if type(value) == "table" then
            if not TSIL[key] then
                TSIL[key] = {}
            end

            for _, TSILmodule in ipairs(value) do
                if not TSIL[key][TSILmodule] then
                    TSIL[key][TSILmodule] = {}
                end
            end
        else
            TSIL[value] = {}
        end
    end

    for _, script in ipairs(scripts) do
        local hasError = pcall(function ()
            require(TSIL.LOCAL_FOLDER .. "." ..  script)
        end)

        print(hasError)
    end

    --Add the callbacks
    local vanillaCallbacks = {}
    for _, TSILCallback in pairs(TSIL.CALLBACKS) do
        if not vanillaCallbacks[TSILCallback.callback] then
            vanillaCallbacks[TSILCallback.callback] = {TSILCallback}
        else
            table.insert(vanillaCallbacks[TSILCallback.callback], TSILCallback)
        end
    end

    local customCallbacks = {}
    for _, TSILCallback in pairs(TSIL.CUSTOM_CALLBACKS) do
        if not customCallbacks[TSILCallback.callback] then
            customCallbacks[TSILCallback.callback] = {TSILCallback}
        else
            table.insert(customCallbacks[TSILCallback.callback], TSILCallback)
        end
    end

    for callback, functionsToAdd in ipairs(vanillaCallbacks) do
        for _, TSILCallback in ipairs(functionsToAdd) do
            TSIL.MOD:AddCallback(callback, TSILCallback.funct, TSILCallback.params)
        end
    end

    for callback, functionsToAdd in ipairs(customCallbacks) do
        for _, TSILCallback in ipairs(functionsToAdd) do
            local params = TSILCallback.params
            if not params then
                params = {}
            end
            ---@cast callback CustomCallback
            TSIL.AddCustomCallback(callback, TSILCallback.funct, table.unpack(params))
        end
    end

    print("TSIL (" .. TSIL.VERSION .. ") has been properly initialized.")
end

return LOCAL_TSIL