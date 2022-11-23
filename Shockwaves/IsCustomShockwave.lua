---Helper function to check whether a given entity is a custom shockwave.
---@param entity Entity
---@return boolean
function TSIL.ShockWaves.IsCustomShockwave(entity)
    if entity.Type ~= EntityType.ENTITY_EFFECT and
    entity.Variant ~= EffectVariant.ROCK_EXPLOSION then return false end

    local customShockwaves = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "TSIL_CUSTOM_SHOCKWAVES")

    if not customShockwaves then return false end

    if customShockwaves[GetPtrHash(entity)] == nil then return false end

    return true
end


---Helper function to get a custom shockwave's data.
---@param entity Entity
---@return table?
function TSIL.ShockWaves.GetCustomShockwaveData(entity)
    if entity.Type ~= EntityType.ENTITY_EFFECT and
    entity.Variant ~= EffectVariant.ROCK_EXPLOSION then return end

    local customShockwaves = TSIL.SaveManager.GetPersistentVariable(TSIL.__MOD, "TSIL_CUSTOM_SHOCKWAVES")

    if not customShockwaves then return end

    return customShockwaves[GetPtrHash(entity)]
end