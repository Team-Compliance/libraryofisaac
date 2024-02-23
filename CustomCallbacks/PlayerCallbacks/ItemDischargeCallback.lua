TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_ITEM_DISCHARGE,
    TSIL.Enums.CallbackReturnMode.NONE,
    TSIL.Enums.CallbackOptionalArgType.PLAYER_TYPE_VARIANT,
    TSIL.Enums.CallbackOptionalArgType.GENERIC
)


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "playersBulbLastCollisionFrame_ITEM_DISCHARGE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "playersActiveItemMap_ITEM_DISCHARGE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )

    TSIL.SaveManager.AddPersistentVariable(
        TSIL.__MOD,
        "playersActiveChargeMap_ITEM_DISCHARGE_CALLBACK",
        {},
        TSIL.Enums.VariablePersistenceMode.RESET_ROOM
    )
end

TSIL.__AddInternalCallback(
    "ITEM_DISCHARGE_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param collider Entity
local function CheckPlayerCollidedWithBulb(collider)
    local player = collider:ToPlayer()

    if player == nil then
        return
    end

    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local gameFrameCount = Game():GetFrameCount();
    local playersBulbLastCollisionFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD,
        "playersBulbLastCollisionFrame_ITEM_DISCHARGE_CALLBACK")
    playersBulbLastCollisionFrame[tostring(playerIndex)] = gameFrameCount
end

---@param npc EntityNPC
---@param collider Entity
local function PreSuckerCollision(_, npc, collider)
    if npc.Variant ~= TSIL.Enums.SuckerVariant.BULB then
        return nil
    end

    CheckPlayerCollidedWithBulb(collider);
end

TSIL.__AddInternalCallback(
    "ITEM_DISCHARGE_CALLBACK_PRE_SUCKER_COLLISION",
    ModCallbacks.MC_PRE_NPC_COLLISION,
    PreSuckerCollision,
    CallbackPriority.DEFAULT,
    EntityType.ENTITY_SUCKER
)


---@param player EntityPlayer
---@return boolean
local function PlayerRecentlyCollidedWithBulb(player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)
    local gameFrameCount = Game():GetFrameCount()
    local playersBulbLastCollisionFrame = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD,
        "playersBulbLastCollisionFrame_ITEM_DISCHARGE_CALLBACK")
    local bulbLastCollisionFrame = playersBulbLastCollisionFrame[tostring(playerIndex)]

    if bulbLastCollisionFrame == nil then return false end

    local collidedOnThisFrame = gameFrameCount == bulbLastCollisionFrame
    local collidedOnLastFrame = gameFrameCount - 1 == bulbLastCollisionFrame
    return collidedOnThisFrame or collidedOnLastFrame
end

---@param player EntityPlayer
local function onPeffectUpdate(_, player)
    local playerIndex = TSIL.Players.GetPlayerIndex(player)

    local playersActiveItemMap = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "playersActiveItemMap_ITEM_DISCHARGE_CALLBACK"
    )
    local activeItemMap = playersActiveItemMap[tostring(playerIndex)]

    if activeItemMap == nil then
        activeItemMap = {}
        playersActiveItemMap[tostring(playerIndex)] = activeItemMap
    end

    local playersChargeMap = TSIL.SaveManager.GetPersistentVariable(
        TSIL.__MOD,
        "playersActiveChargeMap_ITEM_DISCHARGE_CALLBACK"
    )
    local chargeMap = playersChargeMap[tostring(playerIndex)]

    if chargeMap == nil then
        chargeMap = {}
        playersChargeMap[tostring(playerIndex)] = chargeMap
    end

    for activeSlot = 0, ActiveSlot.SLOT_POCKET2, 1 do
        local activeSlotIndex = tostring(activeSlot)

        local currentActiveItem = player:GetActiveItem()
        local previousActiveItem = activeItemMap[activeSlotIndex]
        if previousActiveItem == nil then
            previousActiveItem = currentActiveItem;
        end
        activeItemMap[activeSlotIndex] = currentActiveItem

        if currentActiveItem == previousActiveItem then
            local currentCharge = player:GetTotalActiveCharge(activeSlot)
            local previousCharge = chargeMap[activeSlotIndex]
            if previousCharge == nil then
                previousCharge = currentCharge
            end
            chargeMap[activeSlotIndex] = currentCharge

            if not PlayerRecentlyCollidedWithBulb(player) then
                if currentCharge < previousCharge then
                    local collectibleType = player:GetActiveItem(activeSlot)
                    TSIL.__TriggerCustomCallback(
                        TSIL.Enums.CustomCallback.POST_ITEM_DISCHARGE,
                        player,
                        collectibleType,
                        activeSlot
                    )
                end
            end
        end
    end
end
TSIL.__AddInternalCallback(
    "ITEM_DISCHARGE_CALLBACK_ON_PEFFECT_UPDATE_REORDERED",
    TSIL.Enums.CustomCallback.POST_PEFFECT_UPDATE_REORDERED,
    onPeffectUpdate
)