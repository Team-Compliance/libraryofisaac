# Sprites

## Overview

| Return Value | Function |
| - | - |
| integer | [GetLastFrameOfAnimation](sprites.md#getlastframeofanimation)([`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite, `string?` animation) |
| boolean | [SpriteEquals](sprites.md#spriteequals)([`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite1, [`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite2, `integer` layer, `integer` xStart, `integer` xFinish, `integer` xIncrement, `integer` yStart, `integer` yFinish, `integer` yIncrement) |
| boolean | [TexelEquals](sprites.md#texelequals)([`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite1, [`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html) sprite2, [`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html) position, `integer` layer) |

## Functions

### GetLastFrameOfAnimation()

`integer GetLastFrameOfAnimation(`[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite, string? animation)`

Helper function to get the last frame of a certain animation. 

### SpriteEquals()

`boolean SpriteEquals(`[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite1, `[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite2, integer layer, integer xStart, integer xFinish, integer xIncrement, integer yStart, integer yFinish, integer yIncrement)`

Helper function to check if two sprite layers have the same sprite sheet by using the `Sprite.GetTexel` method. 
Since checking every single texel in the entire sprite is very expensive, this function requires you to specify the range of texels to check. 

### TexelEquals()

`boolean TexelEquals(`[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite1, `[`Sprite`](https://wofsauge.github.io/IsaacDocs/rep/Sprite.html)` sprite2, `[`Vector`](https://wofsauge.github.io/IsaacDocs/rep/Vector.html)` position, integer layer)`

Helper function to check if two texels on a sprite are equivalent to each other. 

