---Used in the `PRE_CUSTOM_REVIVE` callback to determine how the player should revive.
---@enum CustomReviveType
TSIL.Enums.CustomReviveType = {
    --Internally uses Soul of Lazarus
    SAME_ROOM = 0,

    --Internally uses 1 UP
    PREVIOUS_ROOM = 1
}