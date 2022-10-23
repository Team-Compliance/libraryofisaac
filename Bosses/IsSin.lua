local SIN_LIST = {
    [EntityType.ENTITY_SLOTH] = true,
    [EntityType.ENTITY_LUST] = true,
    [EntityType.ENTITY_WRAITH] = true,
    [EntityType.ENTITY_GLUTTONY] = true,
    [EntityType.ENTITY_GREED] = true,
    [EntityType.ENTITY_ENVY] = true,
    [EntityType.ENTITY_PRIDE] = true
}
---Helper function to check if the provided NPC is a Sin miniboss, such as Sloth or Lust.
---@param npc EntityNPC
---@return boolean
function TSIL.Bosses.IsSin(npc)
    if SIN_LIST[npc.Type] ~= nil then
        return true
    end
    return false
end