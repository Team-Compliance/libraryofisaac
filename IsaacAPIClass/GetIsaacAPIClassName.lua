---Helper function to get the name of a class from the Isaac API. This is contained within the
---"__type" metatable key.
---
---For example, a `Vector` class is has a name of "Vector".
---
---Returns nil if the object is not of type `userdata` or if the "__type" metatable key does
---not exist.
---
---In some cases, Isaac classes can be a read-only. If this is the case, the "__type" field will be
---prepended with "const ". This function will always strip this prefix, if it exists. For example,
---the class name returned for "const Vector" will be "Vector".
---@param object unknown
---@return string?
function TSIL.IsaacAPIClass.GetIsaacAPIClassName(object)
    if type(object) ~= "userdata" then
        return
    end

    local metatable = getmetatable(object)

    if metatable == nil then
        return
    end

    local classType = metatable.__type

    if type(classType) ~= "string" then
        return
    end

    local trimmedName = string.gsub(classType, "const ", "")

    return trimmedName
end