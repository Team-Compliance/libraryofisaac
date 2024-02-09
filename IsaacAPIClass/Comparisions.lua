---Helper function to check if something is an instantiated `BitSet128` object.
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsBitSet128(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "BitSet128"
end


---Helper function to check if something is an instantiated `Color` object.
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsColor(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "Color"
end


---Helper function to check if something is an instantiated `ColorModifier` object.
---@param variable any
---@return boolean
function TSIL.IsaacAPIClass.IsColorModifier(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "ColorModifier"
end


---Helper function to detect if a variable is of type `KColor`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsKColor(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "KColor"
end


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


---Helper function to detect if a variable is of type `EntitySlot`
---@param variable any
---@return boolean
function TSIL.IsaacAPIClass.IsSlot(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "EntitySlot"
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


---Helper function to detect if a variable is of type `Vector`
---@param variable unknown
---@return boolean
function TSIL.IsaacAPIClass.IsVector(variable)
    return TSIL.IsaacAPIClass.GetIsaacAPIClassName(variable) == "Vector"
end
