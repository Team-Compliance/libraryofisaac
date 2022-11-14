---Returns whether or not the player is on the first floor of the particular run.
---
---This is tricky to determine because we have to handle the cases of Downpour/Dross 1 not being the
---first floor and The Ascent.
---@return boolean
function TSIL.Stage.OnFirstFloor()
    local effectiveStage = TSIL.Stage.GetEffectiveStage()
    local isOnAscent = TSIL.Stage.OnAscent()

    return effectiveStage == 1 and not isOnAscent
end