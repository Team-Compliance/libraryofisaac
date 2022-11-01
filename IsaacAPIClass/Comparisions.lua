---Helper function to detect if a variable is of type `EntityKnife`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsKnife(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityKnife"
end

---Helper function to detect if a variable is of type `EntityLaser`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsLaser(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityLaser"
end

---Helper function to detect if a variable is of type `EntityNPC`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsNPC(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityNPC"
end

---Helper function to detect if a variable is of type `EntityPickup`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPickup(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityPickup"
end

---Helper function to detect if a variable is of type `GridEntityPit`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPit(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "GridEntityPit"
end

---Helper function to detect if a variable is of type `EntityPlayer`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPlayer(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityPlayer"
end

---Helper function to detect if a variable is of type `GridEntityPoop`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPoop(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "GridEntityPoop"
end

---Helper function to detect if a variable is of type `GridEntityPressurePlate`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsPressurePlate(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "GridEntityPressurePlate"
end

---Helper function to detect if a variable is of type `EntityProjectile`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsProjectile(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityProjectile"
end

---Helper function to detect if a variable is of type `RNG`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsRNG(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "RNG"
end

---Helper function to detect if a variable is of type `GridEntityRock`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsRock(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "GridEntityRock"
end

---Helper function to detect if a variable is of type `GridEntitySpikes`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsSpikes(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "GridEntitySpikes"
end

---Helper function to detect if a variable is of type `EntityTear`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsTear(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntityTear"
end

---Helper function to detect if a variable is of type `GridEntityTNT`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsTNT(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "GridEntityTNT"
end
