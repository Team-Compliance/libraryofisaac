# Sprites

## Overview

| Return Value | Function                                                                                                                                                                                                                                                                                                                           |
| ------------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| boolean      | [SpriteEquals](sprites.md#spriteequals)([`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)sprite1, [`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)sprite2, `integer` layer, `integer` xStart, `integer` xFinish, `integer` xIncrement, `integer` yStart, `integer` yFinish, `integer` yIncrement) |
| boolean      | [TexelEquals](sprites.md#texelequals)([`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)sprite1, [`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)sprite2, `Vector` position, `integer` layer)                                                                                                      |

## Functions

### SpriteEquals()

`boolean SpriteEquals(`[`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)`sprite1,` [`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)`sprite2, integer layer, integer xStart, integer xFinish, integer xIncrement, integer yStart, integer yFinish, integer yIncrement)`

Helper function to check if two sprite layers have the same sprite sheet by using the [`Sprite.GetTexel`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html#gettexel) method.

Since checking every single texel in the entire sprite is very expensive, this function requires you to specify the range of texels to check.

### TexelEquals()

`boolean TexelEquals(`[`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)`sprite1,` [`Sprite` ](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)`sprite2, Vector position, integer layer)`

Helper function to check if two texels on a sprite are equivalent to each other`.`
