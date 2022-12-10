--##POST_BONE_SWING
TSIL.__RegisterCustomCallback(
    TSIL.Enums.CustomCallback.POST_BONE_SWING,
    TSIL.Enums.CallbackReturnMode.NONE
)


local BONE_SWING_ANIMATIONS = {
    Swing = true,
    Swing2 = true,
    Spin = true
}


local function OnTSILLoad()
    TSIL.SaveManager.AddPersistentVariable(TSIL.__MOD, "boneClubAnimations_BONE_SWING_CALLBACK", {}, TSIL.Enums.VariablePersistenceMode.RESET_ROOM)
end
TSIL.__AddInternalCallback(
    "BONE_SWING_CALLBACK_ON_TSIL_LOAD",
    TSIL.Enums.CustomCallback.POST_TSIL_LOAD,
    OnTSILLoad
)


---@param boneClub EntityKnife
local function OnBoneClubRender(boneClub)
    local sprite = boneClub:GetSprite()
    local animation = sprite:GetAnimation()
    local ptrHash = GetPtrHash(boneClub)
    local ptrHashStr = tostring(ptrHash)

    local boneClubAnimations = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "boneClubAnimations_BONE_SWING_CALLBACK")
    local animationOnLastFrame = boneClubAnimations[ptrHashStr]
    boneClubAnimations[ptrHashStr] = animation

    if animationOnLastFrame ~= nil and
    animation ~= animationOnLastFrame and
    BONE_SWING_ANIMATIONS[animation] then
        TSIL.__TriggerCustomCallback(TSIL.Enums.CustomCallback.POST_BONE_SWING, boneClub)
    end
end


---@param knife EntityKnife
local function OnKnifeRender(_, knife)
    if knife.Variant == TSIL.Enums.KnifeVariant.BONE_CLUB then
        OnBoneClubRender(knife)
    end
end
TSIL.__AddInternalCallback(
    "BONE_SWING_CALLBACK_ON_KNIFE_RENDER",
    ModCallbacks.MC_POST_KNIFE_RENDER,
    OnKnifeRender
)