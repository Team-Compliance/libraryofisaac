--##PRE_NEW_LEVEL
TSIL.__RegisterCustomCallback(TSIL.Enums.CustomCallback.PRE_NEW_LEVEL)


local TRAVELING_TO_NEXT_FLOOR_ANIMATIONS = {
    Trapdoor = true,
    LightTravel = true
}


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "firedOnStage_PRE_NEW_LEVEL_CALLBACK", nil, TSIL.Enums.VariablePersistenceMode.RESET_RUN)
end
TSIL.__AddInternalCallback(
    "PRE_NEW_LEVEL_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param player EntityPlayer
local function OnPlayerRender(_, player)
    local effectiveStage = TSIL.Stage.GetEffectiveStage()
    local firedOnStage = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "firedOnStage_PRE_NEW_LEVEL_CALLBACK")
    if effectiveStage == firedOnStage then
        return
    end

    local sprite = player:GetSprite()
    local animation = sprite:GetAnimation()
    if TRAVELING_TO_NEXT_FLOOR_ANIMATIONS[animation] then
        return
    end

    -- We can't use the `Sprite.IsFinished` method to detect when we are at the end of the animation
    -- because the player will stop rendering at that point. Thus, revert to checking for the final
    -- frame manually.
    local frame = sprite:GetFrame()
    local finalFrame = TSIL.Sprites.GetLastFrameOfAnimation(sprite);
    if frame == finalFrame then
        TSIL.SaveManager.SetPersistentVariable(TSIL.__MOD, "firedOnStage_PRE_NEW_LEVEL_CALLBACK", effectiveStage, true)
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.PRE_NEW_LEVEL, player)
    end
end
TSIL.__AddInternalCallback(
    "PRE_NEW_LEVEL_CALLBACK_ON_PLAYER_RENDER",
    ModCallbacks.MC_POST_PLAYER_RENDER,
    OnPlayerRender
)