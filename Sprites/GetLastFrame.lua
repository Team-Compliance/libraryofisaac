---Helper function to get the last frame of a certain animation.
---@param sprite Sprite
---@param animation string? @Leave nil to get the last frame of the current animation
---@return integer
function TSIL.Sprites.GetLastFrameOfAnimation(sprite, animation)
    local animationData
    if animation then
        animationData = sprite:GetAnimationData(animation)
    else
        animationData = sprite:GetCurrentAnimationData()
    end

    return animationData:GetLength() - 1
end
