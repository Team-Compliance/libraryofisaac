--- Helper function to check if two texels on a sprite are equivalent to each other.
---@param sprite1 Sprite
---@param sprite2 Sprite
---@param position Vector
---@param layer integer
---@return boolean
function TSIL.Sprites.TexelEquals(sprite1, sprite2, position, layer)
    ---@type KColor
    local kColor1 = sprite1:GetTexel(position, Vector.Zero, 1, layer)
    ---@type KColor
    local kColor2 = sprite2:GetTexel(position, Vector.Zero, 1, layer)

    return kColor1.Alpha == kColor2.Alpha and
    kColor1.Blue == kColor2.Blue and
    kColor1.Green == kColor2.Green and
    kColor1.Red == kColor2.Red
end


--- Helper function to check if two sprite layers have the same sprite sheet by using the
--- `Sprite.GetTexel` method.
---
--- Since checking every single texel in the entire sprite is very expensive, this function
--- requires you to specify the range of texels to check.
---@param sprite1 Sprite
---@param sprite2 Sprite
---@param layer integer
---@param xStart integer
---@param xFinish integer
---@param xIncrement integer
---@param yStart integer
---@param yFinish integer
---@param yIncrement integer
---@return boolean
function TSIL.Sprites.SpriteEquals(sprite1, sprite2, layer, xStart, xFinish, xIncrement, yStart, yFinish, yIncrement)
    for x = xStart, xFinish, xIncrement do
        for y = yStart, yFinish, yIncrement do
            local position = Vector(x, y)

            if not TSIL.Sprites.TexelEquals(sprite1, sprite2, position, layer) then
                return false
            end
        end
    end

    return true
end