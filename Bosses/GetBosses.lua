---Helper function to get all of the bosses in the room.
---@param entityType EntityType? @Default: -1 | If specified, will only get the bosses that match the type. Default is -1, which matches every type.
---@param variant integer? @Default: -1 | If specified, will only get the bosses that match the variant. Default is -1, which matches every variant.
---@param subType integer? @Default: -1 | If specified, will only get the bosses that match the sub-type. Default is -1, which matches every sub-type.
---@param ignoreFriendly boolean? @Default: false
---@return EntityNPC[]
function TSIL.Bosses.GetBosses(entityType, variant, subType, ignoreFriendly)
    ---@diagnostic disable-next-line: cast-local-type
    entityType = entityType or -1
    variant = variant or -1
    subType = subType or -1
    if ignoreFriendly == nil then
        ignoreFriendly = false
    end

    local npcs = TSIL.EntitySpecific.GetNPCs(entityType, variant, subType, ignoreFriendly)
    local aliveNPCs = {}

    for _, v in pairs(npcs) do
        if v:IsBoss() then
            table.insert(aliveNPCs, v)
        end
    end

    return aliveNPCs
end

