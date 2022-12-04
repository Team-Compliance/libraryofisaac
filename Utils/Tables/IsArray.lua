--- Returns if the provided table is an array. This is a workaround as Lua has no formal way to differentiate between a normal array and a map.
---@param object unknown
---@return boolean
function TSIL.Utils.Tables.IsArray(object)
    if type(object) ~= "table" then
        return false
    end

    if next(object) == nil then
        return true
    end

    local isArray = true

    for i in next, object do
        if type(i) ~= "number" or i%1 ~= 0 or i <= 0 then
            isArray = false
        end
    end

    return isArray
end