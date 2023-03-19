---Helper function to check if the given object is a table with non
---consecutive number keys.
---
---This is useful since this kind of table doesn't get properly serialized 
---by the save manager.
---@param object unknown
---@return boolean
function TSIL.Utils.Tables.HasNonConsecutiveNumberKeys(object)
    if type(object) ~= "table" then
        return false
    end

    local expectedTableKey = 1
    local hasAllExpectedKeys = true

    for key, _ in pairs(object) do
        if type(key) == "string" then
            return false
        end

        if key ~= expectedTableKey then
            hasAllExpectedKeys = false
            break
        end

        expectedTableKey = expectedTableKey + 1
    end

    if hasAllExpectedKeys then
        return false
    end

    return true
end