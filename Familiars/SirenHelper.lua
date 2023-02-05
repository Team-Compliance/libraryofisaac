--- Helper function to get the corresponding "Siren Helper" entity for a stolen familiar.
---
--- When The Siren boss "steals" your familiars, a hidden "Siren Helper" entity is spawned to control
--- each familiar stolen. (Checking for the presence of this entity seems to be the only way to
--- detect when the Siren steals a familiar.)
---@param familiar EntityFamiliar
---@return Entity? @ Returns the hidden "Siren Helper" entity corresponding to the given familiar, if it exists. Returns nil otherwise.
function TSIL.Familiars.GetSirenHelper(familiar)
    local familiarPtrHash = GetPtrHash(familiar)

    local sirenHelpers = TSIL.Entities.GetEntities(EntityType.ENTITY_SIREN_HELPER)

    return TSIL.Utils.Tables.FindFirst(sirenHelpers, function (_, sirenHelper)
        return sirenHelper.Target and GetPtrHash(sirenHelper.Target) == familiarPtrHash
    end)
end


--- Helper function to check if the given familiar is being controlled by The Siren boss.
---@param familiar EntityFamiliar
---@return boolean
function TSIL.Familiars.IsFamiliarStolenBySiren(familiar)
    local sirenHelper = TSIL.Familiars.GetSirenHelper(familiar)
    return sirenHelper ~= nil
end