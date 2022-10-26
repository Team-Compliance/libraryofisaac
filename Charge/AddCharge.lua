---@param player EntityPlayer
---@param activeSlot ActiveSlot
local function shouldPlayFullRechargeSound(player, activeSlot)
  local activeItem = player:GetActiveItem(activeSlot)
  local activeCharge = player:GetActiveCharge(activeSlot)
  local batteryCharge = player:GetBatteryCharge(activeSlot)
  local hasBattery = player:HasCollectible(CollectibleType.COLLECTIBLE_BATTERY)
  local maxCharges = TSIL.Collectibles.GetCollectibleMaxCharges(activeItem)

  -- If we do not have The Battery, play the full recharge sound if we are now fully charged.
  if not hasBattery then
    -- We cannot use the `EntityPlayer.NeedsCharge` method because it does not work properly for
    -- items with `chargetype="special"`.
    return activeCharge == maxCharges
  end

  -- If we do have The Battery, play the full recharge sound if we are exactly double charged or
  -- exactly single charged.
  return (
    batteryCharge == maxCharges or
    (activeCharge == maxCharges and batteryCharge == 0)
  )
end

--- Helper function to play the appropriate sound effect for a player after getting one or more
--- charges on their active item. (There is a different sound depending on whether the item is fully
--- charged or not.)
---@param player EntityPlayer
---@param activeSlot ActiveSlot
local function playChargeSoundEffect(player, activeSlot)
    SFXManager():Stop(SoundEffect.SOUND_BATTERYCHARGE)
    SFXManager():Stop(SoundEffect.SOUND_BEEP)

    local playFullRechargeSound = shouldPlayFullRechargeSound(player, activeSlot)
    
    ---@type SoundEffect
    local chargeSoundEffect

    if playFullRechargeSound then
        chargeSoundEffect = SoundEffect.SOUND_BATTERYCHARGE
    else
        chargeSoundEffect = SoundEffect.SOUND_BEEP 
    end

    SFXManager():Play(chargeSoundEffect)
end

--- The AAA battery should grant an extra charge when the active item is one away from being fully charged.
---@param player EntityPlayer
---@param activeSlot ActiveSlot
---@param chargesToAdd number
---@return number
local function getChargesToAddWithAAAModifier(player, activeSlot, chargesToAdd)
    local hasAAABattery = player:HasTrinket(TrinketType.TRINKET_AAA_BATTERY)
    
    if not hasAAABattery then
        return chargesToAdd
    end

    local chargesAwayFromMax = TSIL.Charge.GetChargesAwayFromMax(player, activeSlot)
    local aaaBatteryShouldApply = chargesToAdd == chargesAwayFromMax - 1

    if aaaBatteryShouldApply then
        return chargesToAdd + 1
    else
        return chargesToAdd
    end
end

--- Helper function to add a charge to the player's active item. Will flash the HUD and play the
--- appropriate sound effect, depending on whether the charge is partially full or completely full.
---
--- If the player's active item is already fully charged, then this function will return 0 and not
--- flash the hud.
---
--- This function will take the following things into account:
--- - The Battery
--- - AAA Battery
---@param player EntityPlayer The player to grant the charges to.
---@param activeSlot ActiveSlot? Optional. The slot to grant the charges to. Default is `ActiveSlot.SLOT_PRIMARY`.
---@param numCharges integer? Optional. The amount of charges to grant. Default is 1.
---@param playSoundEffect boolean? Optional. Whether to play a charge-related sound effect. Default is true.
---@return integer # The amount of charges that were actually granted. For example, if the active item was only one away from a full charge, but the `numCharges` provided to the function was 2, then this function would return 1.
function TSIL.Charge.AddCharge(player, activeSlot, numCharges, playSoundEffect)
    activeSlot = activeSlot or ActiveSlot.SLOT_PRIMARY
    numCharges = numCharges or 1

    if playSoundEffect == nil then
        playSoundEffect = true
    end

    local hud = Game():GetHUD()

    --[[
        Ensure that there is enough space on the active item to store these amount of charges. (If we 
        add too many charges, it will grant orange "battery" charges even if the player doesn't have 
        the item).
    ]] 
    local chargesAwayFromMax = TSIL.Charge.GetChargesAwayFromMax(player, activeSlot)
    
    ---@type number
    local chargesToAdd

    if numCharges > chargesAwayFromMax then
        chargesToAdd = chargesAwayFromMax
    else
        chargesToAdd = numCharges
    end

    -- // The AAA Battery trinket might grant an additional charge.
    local modifiedChargesToAdd = getChargesToAddWithAAAModifier(player, activeSlot, chargesToAdd)
    
    local totalCharge = TSIL.Charge.GetTotalCharge(player, activeSlot)
    local newCharge = totalCharge + modifiedChargesToAdd
    if newCharge == totalCharge then
        return 0
    end

    player:SetActiveCharge(newCharge, activeSlot)
    hud:FlashChargeBar(player, activeSlot)

    if playSoundEffect then
        playChargeSoundEffect(player, activeSlot)
    end

    return modifiedChargesToAdd
end
