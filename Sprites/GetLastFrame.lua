---Helper function to get the last frame of a certain animation.
---@param sprite Sprite
---@param animation string
---@return integer
function TSIL.Sprites.GetLastFrameOfAnimation(sprite, animation)
    local prevAnimation = sprite:GetAnimation()
    local prevFrames = sprite:GetFrame()

    sprite:Play(animation, true)
    sprite:SetLastFrame()

    local lastFrame = sprite:GetFrame()

    sprite:SetFrame(prevAnimation, prevFrames)

    return lastFrame
end