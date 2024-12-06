local function OnTSILLoaded()
    TSIL.SaveManager.AddPersistentVariable(
		TSIL.__MOD,
		"itemsCollectedPerPlayer_PLAYER_INVENTORY_LOGIC",
		{},
		TSIL.Enums.VariablePersistenceMode.RESET_RUN
	)
	TSIL.SaveManager.AddPersistentVariable(
		TSIL.__MOD,
		"numItemsPerPlayer_PLAYER_INVENTORY_LOGIC",
		{},
		TSIL.Enums.VariablePersistenceMode.RESET_RUN
	)
    TSIL.SaveManager.AddPersistentVariable(
		TSIL.__MOD,
		"itemHistoryPerPlayer_PLAYER_INVENTORY_LOGIC",
		{},
		TSIL.Enums.VariablePersistenceMode.RESET_RUN
	)

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "gulpedTrinkets_PLAYER_INVENTORY_LOGIC",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_RUN
    )
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "heldTrinkets_PLAYER_INVENTORY_LOGIC",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end
TSIL.__AddInternalCallback(
	"PLAYER_INVENTORY_LOGIC_TSIL_LOADED",
	TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
	OnTSILLoaded
)


---@param player EntityPlayer
local function RecalculateItemsInventory(player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local itemsPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "itemsCollectedPerPlayer_PLAYER_INVENTORY_LOGIC"
    )
    local itemsCollected = itemsPerPlayer[playerIndex]
    if not itemsCollected then
        itemsCollected = {}
        itemsPerPlayer[playerIndex] = itemsCollected
    end

    local itemHistoryPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "itemHistoryPerPlayer_PLAYER_INVENTORY_LOGIC"
    )
    local itemHistory = itemHistoryPerPlayer[playerIndex]
    if not itemHistory then
        itemHistory = {}
        itemHistoryPerPlayer[playerIndex] = itemHistory
    end

    local itemConfig = Isaac.GetItemConfig()
	local itemList = itemConfig:GetCollectibles()

	for id = 1, itemList.Size - 1, 1 do
		local item = itemConfig:GetCollectible(id)

        if item then
            local prevCount = itemsCollected[id]
            if not prevCount then prevCount = 0 end
            local currCount = player:GetCollectibleNum(id, true)

            if prevCount < currCount then
                local difference = currCount - prevCount

                for _ = 1, difference, 1 do
                    local isFirstTime = itemHistory[id] == nil

                    TSIL.__TriggerCustomCallback(
                        TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_ADDED,
                        player,
                        id,
                        isFirstTime
                    )

                    itemHistory[id] = true
                end
            elseif prevCount > currCount then
                local difference = prevCount - currCount

                for _ = 1, difference, 1 do
                    TSIL.__TriggerCustomCallback(
                        TSIL.Enums.CustomCallback.POST_PLAYER_COLLECTIBLE_REMOVED,
                        player,
                        id
                    )
                end
            end

            if currCount == 0 then
                itemsCollected[id] = nil
            else
                itemsCollected[id] = currCount
            end
        end
    end
end


---@param player EntityPlayer
local function CheckCollectibles(player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local numItemsPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "numItemsPerPlayer_PLAYER_INVENTORY_LOGIC"
    )
    local previousNumItems = numItemsPerPlayer[playerIndex]
    local currentNumItems = player:GetCollectibleCount()


    if not previousNumItems or previousNumItems ~= currentNumItems then
        RecalculateItemsInventory(player)
    end

    numItemsPerPlayer[playerIndex] = currentNumItems
end


---@param player EntityPlayer
local function CheckGulpedTrinkets(player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local gulpedTrinketsPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "gulpedTrinkets_PLAYER_INVENTORY_LOGIC"
    )
    local gulpedTrinkets = gulpedTrinketsPerPlayer[playerIndex]
    if not gulpedTrinkets then return end

    for trinket, num in pairs(gulpedTrinkets) do
        local actualNum = TSIL.Players.GetSmeltedTrinketMultiplier(player, trinket)

        if actualNum > num then
            local difference = actualNum - num
            for _ = 1, difference, 1 do
                TSIL.__TriggerCustomCallback(
                    TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_ADDED,
                    player,
                    trinket
                )
            end
        elseif actualNum < num then
            local difference = num - actualNum
            for _ = 1, difference, 1 do
                TSIL.__TriggerCustomCallback(
                    TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_REMOVED,
                    player,
                    trinket
                )
            end
        end

        if actualNum == 0 then
            gulpedTrinkets[trinket] = nil
        else
            gulpedTrinkets[trinket] = actualNum
        end
    end
end


---@param player EntityPlayer
local function OnPeffectUpate(_, player)
    CheckCollectibles(player)

    CheckGulpedTrinkets(player)
end
TSIL.__AddInternalCallback(
    "PLAYER_INVENTORY_ON_PEFFECT_UPDATE",
    ModCallbacks.MC_POST_PEFFECT_UPDATE,
    OnPeffectUpate
)


---@param player EntityPlayer
local function PreSmelterUse(_, _, _, player)
    local trinkets = {}
    for i = 0, 1, 1 do
        local trinket = player:GetTrinket(i)
        if trinket ~= 0 then
            trinkets[#trinkets+1] = trinket
        end
    end

    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local heldTrinketsPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "heldTrinkets_PLAYER_INVENTORY_LOGIC"
    )
    heldTrinketsPerPlayer[playerIndex] = trinkets
end
TSIL.__AddInternalCallback(
    "PLAYER_INVENTORY_PRE_ITEM_USE_SMELTER",
    ModCallbacks.MC_PRE_USE_ITEM,
    PreSmelterUse,
    CallbackPriority.DEFAULT,
    CollectibleType.COLLECTIBLE_SMELTER
)


---@param player EntityPlayer
local function OnSmelterUse(_, _, _, player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local heldTrinketsPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "heldTrinkets_PLAYER_INVENTORY_LOGIC"
    )
    local heldTrinkets = heldTrinketsPerPlayer[playerIndex]

    if not heldTrinkets then return end

    local gulpedTrinketsPerPlayer = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "gulpedTrinkets_PLAYER_INVENTORY_LOGIC"
    )
    local gulpedTrinkets = gulpedTrinketsPerPlayer[playerIndex]
    if not gulpedTrinkets then
        gulpedTrinkets = {}
        gulpedTrinketsPerPlayer[playerIndex] = gulpedTrinkets
    end

    for _, trinket in ipairs(heldTrinkets) do
        local prevNumGulped = gulpedTrinkets[trinket]
        if not prevNumGulped then prevNumGulped = 0 end

        gulpedTrinkets[trinket] = prevNumGulped + 1

        TSIL.__TriggerCustomCallback(
            TSIL.Enums.CustomCallback.POST_PLAYER_GULPED_TRINKET_ADDED,
            player,
            trinket
        )
    end

    heldTrinketsPerPlayer[playerIndex] = nil
end
TSIL.__AddInternalCallback(
    "PLAYER_INVENTORY_ON_ITEM_USE_SMELTER",
    ModCallbacks.MC_USE_ITEM,
    OnSmelterUse,
    CallbackPriority.DEFAULT,
    CollectibleType.COLLECTIBLE_SMELTER
)