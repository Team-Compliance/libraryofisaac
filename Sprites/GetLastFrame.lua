---Helper function to get the last frame of a certain animation.
---@param sprite Sprite
---@param animation string?
---@return integer
function TSIL.Sprites.GetLastFrameOfAnimation(sprite, animation)
    local currentAnimation = sprite:GetAnimation()
    local currentFrame = sprite:GetFrame()

    if animation ~= nil and animation ~= currentAnimation then
        sprite:SetAnimation(animation)
    end
    sprite:SetLastFrame()
    local finalFrame = sprite:GetFrame()

    if animation ~= nil and animation ~= currentAnimation then
        sprite:Play(currentAnimation, true)
    end
    sprite:SetFrame(currentFrame)

    return finalFrame;
end
