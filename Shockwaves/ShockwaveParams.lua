---@class CustomShockwaveParams
---@field Duration integer
---@field Size number
---@field Damage number
---@field SelfDamage boolean
---@field DamagePlayers boolean
---@field DestroyGrid boolean
---@field GoOverPits boolean
---@field Color Color
---@field SpriteSheet string
---@field Sound SoundEffect
---@field SoundMode ShockwaveSoundMode


---Creates a new `CustomShockwaveParams` object.
---@return CustomShockwaveParams
function TSIL.ShockWaves.CustomShockwaveParams()
    local shockwaveParams = {
        Duration = 15,
        Size = 1,
        Damage = 10,
        DamageCooldown = -1,
        SelfDamage = false,
        DamagePlayers = true,
        DestroyGrid = true,
        GoOverPits = false,
        Color = Color(1, 1, 1),
        SpriteSheet = "resources/gfx/effects/effect_062_groundbreak.png",
        SoundMode = TSIL.Enums.ShockwaveSoundMode.ON_CREATE
    }

    local proxy = {}

    local mt = {
        __type = "ShockwaveParmas",
        __index = shockwaveParams,
        __newindex = function(_, newIndex, newValue)
            if shockwaveParams[newIndex] == nil then
                error("Attempt to update a read-only table")
            end

            local oldType = type(shockwaveParams[newIndex])
            if oldType == "userdata" then
                ---@diagnostic disable-next-line: cast-local-type
                oldType = TSIL.IsaacAPIClass.GetIsaacAPIClassName(oldType)
            end

            local newType = type(newValue)
            if newType == "userdata" then
                ---@diagnostic disable-next-line: cast-local-type
                newType = TSIL.IsaacAPIClass.GetIsaacAPIClassName(newType)
            end

            if oldType ~= newType then
                error("Type mismatch. Tried setting " .. oldType .. " to " .. newType)
            end

            shockwaveParams[newIndex] = newValue
        end,
        __eq = function(t1, t2)
            local ci1 = getmetatable(t1).__proxy
            local ci2 = getmetatable(t2).__proxy

            for key, value in pairs(ci1) do
                if value ~= ci2[key] then
                    return false
                end
            end

            return true
        end,
        __proxy = shockwaveParams
    }

    setmetatable(proxy, mt)

    return proxy
end