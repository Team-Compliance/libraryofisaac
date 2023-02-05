local DICE_FLOOR_TRIGGER_SQUARE_SIZE = 75

---Helper function to check if a player is close enough to a dice floor to trigger its effect.
---
---Unlike most entities in the game, dice floors have an square hitbox.
---@param entity Entity
---@param diceFloor EntityEffect
function TSIL.Effects.IsCloseEnoughToTriggerDiceFloor(entity, diceFloor)
    local topLeft = diceFloor.Position + Vector(-DICE_FLOOR_TRIGGER_SQUARE_SIZE, -DICE_FLOOR_TRIGGER_SQUARE_SIZE)
    local topRight = diceFloor.Position + Vector(DICE_FLOOR_TRIGGER_SQUARE_SIZE, -DICE_FLOOR_TRIGGER_SQUARE_SIZE)
    local bottomRight = diceFloor.Position + Vector(DICE_FLOOR_TRIGGER_SQUARE_SIZE, DICE_FLOOR_TRIGGER_SQUARE_SIZE)

    return TSIL.Utils.Math.IsInRectangle(entity.Position, topLeft, topRight, bottomRight)
end