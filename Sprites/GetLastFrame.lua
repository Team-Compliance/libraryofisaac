---Helper function to get the last frame of a certain animation.
---@param sprite Sprite
---@param animation string? @Leave nil to get the last frame of the current animation
---@return integer @If the given animation doesn't exist, returns -1.
function TSIL.Sprites.GetLastFrameOfAnimation(sprite, animation)
    local animationData
    if animation then
        animationData = sprite:GetAnimationData(animation)
    else
        animationData = sprite:GetCurrentAnimationData()
    end

    if animationData then
        return animationData:GetLength() - 1
    else
        return -1
    end
end
