--- Helper function to check if two collectible sprites are the same.
---@param sprite1 Sprite
---@param sprite2 Sprite
---@return boolean
function TSIL.Collectibles.CollectibleSpriteEquals(sprite1, sprite2)
    local xStart = -1
    local xFinish = 1
    local xIncrement = 1
    local yStart = -40
    local yFinish = 10
    local yIncrement = 3

    return TSIL.Sprites.SpriteEquals(
        sprite1,
        sprite2,
        1,
        xStart,
        xFinish,
        xIncrement,
        yStart,
        yIncrement,
        yFinish
    )
end


--- Helper function to change the sprite of a collectible pedestal
---@param collectible EntityPickup
---@param spriteSheet string? @Optional. If not set, the sprite will be removed, like if the item had already been taken.
function TSIL.Collectibles.SetCollectibleSprite(collectible, spriteSheet)
    local sprite = collectible:GetSprite()

    if not spriteSheet then
        sprite:ReplaceSpritesheet(1, "")
        sprite:ReplaceSpritesheet(3, "")
    else
        sprite:ReplaceSpritesheet(1, spriteSheet)
    end
    sprite:LoadGraphics()
end