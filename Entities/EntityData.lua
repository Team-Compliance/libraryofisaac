local EntityDatas = {}

---Sets some arbitrary data for an entity. Use this instead of `Entity:GetData()` since that
---is global and allows for other mods to edit your data.
---
---This is also better than manually keeping track of the data manually with the save manager
---since the PtrHash can be reused after the entity is removed and this keeps track of it manually.
---
---Use only for non persistent entities like effects.
---@param mod table
---@param entity Entity
---@param field string
---@param value any
function TSIL.Entities.SetEntityData(mod, entity, field, value)
    local ptrHash = GetPtrHash(entity)

    if not EntityDatas[mod.Name] then
        EntityDatas[mod.Name] = {}
    end
    local modEntityDatas = EntityDatas[mod.Name]

    if not modEntityDatas[ptrHash] then
        modEntityDatas[ptrHash] = {}
    end

    local data = modEntityDatas[ptrHash]
    data[field] = value
end


---Gets some arbitrary data for an entity. Use this instead of `Entity:GetData()` since that
---is global and allows for other mods to edit your data.
---
---This is also better than manually keeping track of the data manually with the save manager
---since the PtrHash can be reused after the entity is removed and this keeps track of it manually.
---
---Use only for non persistent entities like effects.
---@param mod table
---@param entity Entity
---@param field string
---@return any
function TSIL.Entities.GetEntityData(mod, entity, field)
    local ptrHash = GetPtrHash(entity)

    if not EntityDatas[mod.Name] then
        return nil
    end
    local modEntityDatas = EntityDatas[mod.Name]

    if not modEntityDatas[ptrHash] then
        return nil
    end

    local data = modEntityDatas[ptrHash]
    return data[field]
end


local function OnEntityRemove(_, entity)
    local ptrHash = GetPtrHash(entity)

    --We remove it in the next frame since the entity death callback runs
    --after the entity is removed
    TSIL.Utils.Functions.RunInFrames(function ()
        for _, modEntityDatas in pairs(EntityDatas) do
            modEntityDatas[ptrHash] = nil
        end
    end, 1)
end
TSIL.__AddInternalCallback(
    "ENTITY_DATA_ON_ENTITY_REMOVE",
    ModCallbacks.MC_POST_ENTITY_REMOVE,
    OnEntityRemove
)


local function OnGameExit()
    EntityDatas = {}
end
TSIL.__AddInternalCallback(
    "ENTITY_DATA_ON_GAME_EXIT",
    ModCallbacks.MC_PRE_GAME_EXIT,
    OnGameExit
)