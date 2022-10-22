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