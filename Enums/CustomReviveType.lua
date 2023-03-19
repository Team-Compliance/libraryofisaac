---Used in the `PRE_CUSTOM_REVIVE` callback to determine how the player should revive.
---
---Defines how the callback filtering should treat each parameter.
---@enum CustomReviveType
TSIL.Enums.CustomReviveType = {
    --Internally uses Soul of lazarus
    SAME_ROOM = 0,

    --Internally uses 1 UP
    PREVIOUS_ROOM = 1
}