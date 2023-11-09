---Used when registering a custom callback using `TSIL.__RegisterCustomCallback()`.
---
---Defines how the callback filtering should treat each parameter.
---@enum CallbackOptionalArgType
TSIL.Enums.CallbackOptionalArgType = {
    --Directly checks for equality using `==`
    GENERIC = 0,
    --Skips this argument when checking
    NONE = 1,

    ENTITY_TYPE = 2,
    ENTITY_TYPE_VARIANT = 3,
    ENTITY_TYPE_VARIANT_SUBTYPE = 4,
    ENTITY_VARIANT_SUBTYPE = 5,
    ENTITY_SUBTYPE = 6,

    GRID_TYPE = 7,
    GRID_TYPE_VARIANT = 8,
    GRID_VARIANT = 9,

    PLAYER_TYPE_VARIANT = 10,
    PLAYER_TYPE = 11,

    MOD_NAME = 12
}