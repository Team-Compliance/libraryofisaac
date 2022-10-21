--- @class RegisteredVanillaCallback
--- @field Callback ModCallbacks
--- @field Funct function

--- @enum OptionalArgCheckType
local OptionalArgCheckType = {
	NONE = 0,
	ITSELF = 1,
	TYPE = 2,
	VARIANT = 3,
	SUBTYPE = 4,
	PLAYER_TYPE = 5,
	SECOND_ARG = 6
}

--- @enum ReturnType
local ReturnType = {
	NONE = 0,
	SKIP_NEXT = 1,
	LAST_WINS = 2,
	NEXT_ARGUMENT = 3
}

--- @param arg integer
--- @return boolean
local function IsDefaultOptionalArg(arg)
	return not arg or arg == -1
end

--- @param callback ModCallbacks
--- @param shouldExecute fun(params: table, optionalArg: integer):boolean
--- @param returnType ReturnType
--- @return RegisteredVanillaCallback
local function NewRegisteredCallback(callback, shouldExecute, returnType)
	return {
		Callback = callback,
		Funct = function (...)
			local params = {...}
			local paramsWithoutMod = {}
			for i = 2, #params, 1 do
				paramsWithoutMod[#paramsWithoutMod+1] = params[i]
			end

			local functions = {}

			for _, TSILVanillaCallback in ipairs(TSIL.__VERSION_PERSISTENT_DATA.VanillaCallbacksList) do
				if TSILVanillaCallback.Callback == callback then
					functions = TSILVanillaCallback.Functions
				end
			end

			local returnedValue

			for _, toCall in ipairs(functions) do
				if IsDefaultOptionalArg(toCall.OptionalParam) or
				shouldExecute(paramsWithoutMod, toCall.OptionalParam) then
					returnedValue = toCall.Funct(toCall.Mod, table.unpack(paramsWithoutMod))

					if returnedValue ~= nil then
						if returnType == ReturnType.SKIP_NEXT then
							return returnedValue
						elseif returnType == ReturnType.NEXT_ARGUMENT then
							paramsWithoutMod[1] = returnedValue
						end
					end
				end
			end

			if returnType == ReturnType.LAST_WINS then
				return returnedValue
			end
		end
	}
end


--- @param callback ModCallbacks
--- @param checkType? OptionalArgCheckType
--- @param returnType? ReturnType
local function RegisterVanillaCallback(callback, checkType, returnType)
	if not returnType then returnType = ReturnType.NONE end
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
	elseif checkType == OptionalArgCheckType.SUBTYPE then
		shouldExecute = function (params, optionalArg)
			return params[1].SubType == optionalArg
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

	table.insert(TSIL.__REGISTERED_VANILLA_CALLBACKS, NewRegisteredCallback(callback, shouldExecute, returnType))
end


RegisterVanillaCallback(ModCallbacks.MC_NPC_UPDATE, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_UPDATE)

RegisterVanillaCallback(ModCallbacks.MC_POST_RENDER)

RegisterVanillaCallback(ModCallbacks.MC_USE_ITEM, OptionalArgCheckType.ITSELF, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_USE_CARD, OptionalArgCheckType.ITSELF)

RegisterVanillaCallback(ModCallbacks.MC_FAMILIAR_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_FAMILIAR_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_EVALUATE_CACHE, OptionalArgCheckType.SECOND_ARG)

RegisterVanillaCallback(ModCallbacks.MC_POST_PLAYER_INIT, OptionalArgCheckType.PLAYER_TYPE)

RegisterVanillaCallback(ModCallbacks.MC_USE_PILL, OptionalArgCheckType.ITSELF)

RegisterVanillaCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, OptionalArgCheckType.TYPE, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_CURSE_EVAL, OptionalArgCheckType.NONE, ReturnType.NEXT_ARGUMENT)

RegisterVanillaCallback(ModCallbacks.MC_INPUT_ACTION, OptionalArgCheckType.SECOND_ARG, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_LEVEL_GENERATOR)

RegisterVanillaCallback(ModCallbacks.MC_POST_GAME_STARTED)

RegisterVanillaCallback(ModCallbacks.MC_POST_GAME_END)

RegisterVanillaCallback(ModCallbacks.MC_POST_NEW_LEVEL)

RegisterVanillaCallback(ModCallbacks.MC_POST_NEW_ROOM)

RegisterVanillaCallback(ModCallbacks.MC_GET_CARD, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_GET_SHADER_PARAMS)

RegisterVanillaCallback(ModCallbacks.MC_EXECUTE_CMD)

RegisterVanillaCallback(ModCallbacks.MC_PRE_USE_ITEM, OptionalArgCheckType.ITSELF, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_ENTITY_SPAWN, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_POST_FAMILIAR_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_FAMILIAR_COLLISION, OptionalArgCheckType.VARIANT, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_NPC_INIT, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_NPC_RENDER, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_NPC_DEATH, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_NPC_COLLISION, OptionalArgCheckType.TYPE, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PLAYER_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_PLAYER_COLLISION, OptionalArgCheckType.VARIANT, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PICKUP_SELECTION, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, OptionalArgCheckType.VARIANT, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_TEAR_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_TEAR_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_TEAR_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_TEAR_COLLISION, OptionalArgCheckType.VARIANT, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PROJECTILE_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PROJECTILE_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_PROJECTILE_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_PROJECTILE_COLLISION, OptionalArgCheckType.VARIANT, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_LASER_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_LASER_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_LASER_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_KNIFE_INIT, OptionalArgCheckType.SUBTYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_KNIFE_UPDATE, OptionalArgCheckType.SUBTYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_KNIFE_RENDER, OptionalArgCheckType.SUBTYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_KNIFE_COLLISION, OptionalArgCheckType.SUBTYPE, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_EFFECT_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_EFFECT_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_BOMB_INIT, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_BOMB_UPDATE, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_POST_BOMB_RENDER, OptionalArgCheckType.VARIANT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_BOMB_COLLISION, OptionalArgCheckType.VARIANT, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_POST_FIRE_TEAR)

RegisterVanillaCallback(ModCallbacks.MC_PRE_GET_COLLECTIBLE, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_POST_GET_COLLECTIBLE, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_GET_PILL_COLOR, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_GET_PILL_EFFECT, OptionalArgCheckType.NONE, ReturnType.LAST_WINS)

RegisterVanillaCallback(ModCallbacks.MC_GET_TRINKET)

RegisterVanillaCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_POST_ENTITY_KILL, OptionalArgCheckType.TYPE)

RegisterVanillaCallback(ModCallbacks.MC_PRE_NPC_UPDATE, OptionalArgCheckType.TYPE, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_SPAWN_CLEAN_AWARD, OptionalArgCheckType.NONE, ReturnType.SKIP_NEXT)

RegisterVanillaCallback(ModCallbacks.MC_PRE_ROOM_ENTITY_SPAWN)