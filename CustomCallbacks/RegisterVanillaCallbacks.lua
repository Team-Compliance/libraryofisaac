---@class RegisteredVanillaCallback
---@field Callback ModCallbacks
---@field ShouldExecute fun(params: table, optionalArg: integer):boolean

---@enum OptionalArgCheckType
local OptionalArgCheckType = {
    NONE = 0,
    ITSELF = 1,
    TYPE = 2,
    VARIANT = 3,
    PLAYER_TYPE = 4,
    SECOND_ARG = 5
}

---@param callback ModCallbacks
---@param shouldExecute fun(params: table, optionalArg: integer):boolean
---@return RegisteredVanillaCallback
local function NewRegisteredCallback(callback, shouldExecute)
    return {
        Callback = callback,
        shouldExecute = shouldExecute
    }
end


---@param callback ModCallbacks
---@param checkType? OptionalArgCheckType
local function RegisterVanillaCallback(callback, checkType)
    local shouldExecute = function ()
        return true
    end

    if checkType == OptionalArgCheckType.ITSELF then
        shouldExecute = function (params, optionalArg)
            return params[1] == optionalArg
        end
    elseif checkType == OptionalArgCheckType.TYPE then
        shouldExecute = function (params, optionalArg)
            return params[1].Type == optionalArg
        end
    elseif checkType == OptionalArgCheckType.VARIANT then
        shouldExecute = function (params, optionalArg)
            return params[1].Variant == optionalArg
        end
    elseif checkType == OptionalArgCheckType.PLAYER_TYPE then
        shouldExecute = function (params, optionalArg)
            return params[1]:GetPlayerType() == optionalArg
        end
    elseif checkType == OptionalArgCheckType.SECOND_ARG then
        shouldExecute = function (params, optionalArg)
            return params[2] == optionalArg
        end
    end

    table.insert(TSIL.__REGISTERED_VANILLA_CALLBACKS, NewRegisteredCallback(callback, shouldExecute))
end


RegisterVanillaCallback(ModCallbacks.MC_NPC_UPDATE, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_UPDATE)

RegisterVanillaCallback(ModCallbacks.MC_POST_RENDER)

RegisterVanillaCallback(ModCallbacks.MC_USE_ITEM, OptionalArgCheckType.ITSELF)

RegisterVanillaCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_USE_CARD, OptionalArgCheckType.ITSELF)

RegisterVanillaCallback(ModCallbacks.MC_FAMILIAR_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_FAMILIAR_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_EVALUATE_CACHE, OptionalArgCheckType.SECOND_ARG)

RegisterVanillaCallback(ModCallbacks.MC_POST_PLAYER_INIT, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_USE_PILL, OptionalArgCheckType.ITSELF)

RegisterVanillaCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_CURSE_EVAL)

RegisterVanillaCallback(ModCallbacks.MC_INPUT_ACTION, OptionalArgCheckType.SECOND_ARG)

RegisterVanillaCallback(ModCallbacks.MC_LEVEL_GENERATOR)

RegisterVanillaCallback(ModCallbacks.MC_POST_GAME_STARTED)

RegisterVanillaCallback(ModCallbacks.MC_POST_GAME_END)

RegisterVanillaCallback(ModCallbacks.MC_POST_NEW_LEVEL)

RegisterVanillaCallback(ModCallbacks.MC_POST_NEW_ROOM)

RegisterVanillaCallback(ModCallbacks.MC_GET_CARD)

RegisterVanillaCallback(ModCallbacks.MC_GET_SHADER_PARAMS)

RegisterVanillaCallback(ModCallbacks.MC_EXECUTE_CMD)

RegisterVanillaCallback(ModCallbacks.MC_PRE_USE_ITEM, OptionalArgCheckType.ITSELF)

RegisterVanillaCallback(ModCallbacks.MC_PRE_ENTITY_SPAWN)

RegisterVanillaCallback(ModCallbacks.MC_POST_FAMILIAR_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_FAMILIAR_COLLISION, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_NPC_INIT, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_NPC_RENDER, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_NPC_DEATH, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_NPC_COLLISION, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_PLAYER_RENDER, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_PLAYER_COLLISION, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_SELECTION)

RegisterVanillaCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_TEAR_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_TEAR_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_TEAR_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PROJECTILE_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PROJECTILE_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_PROJECTILE_COLLISION, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_LASER_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_LASER_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_LASER_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_KNIFE_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_KNIFE_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_KNIFE_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_KNIFE_COLLISION, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_EFFECT_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_EFFECT_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_BOMB_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_BOMB_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_BOMB_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_BOMB_COLLISION, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_FIRE_TEAR)

RegisterVanillaCallback(ModCallbacks.MC_PRE_GET_COLLECTIBLE)

RegisterVanillaCallback(ModCallbacks.MC_POST_GET_COLLECTIBLE)

RegisterVanillaCallback(ModCallbacks.MC_GET_PILL_COLOR)

RegisterVanillaCallback(ModCallbacks.MC_GET_PILL_EFFECT)

RegisterVanillaCallback(ModCallbacks.MC_GET_TRINKET)

RegisterVanillaCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_ENTITY_KILL, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_NPC_UPDATE, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD)

RegisterVanillaCallback(ModCallbacks.MC_PRE_ROOM_ENTITY_SPAWN)