--- Helper function to check if all the elements of a table match a given predicate.
---@generic T:any
---@param toCheck T[]
---@param predicate fun(key: integer | string, value: T): boolean
---@return boolean
function TSIL.Utils.Tables.All(toCheck, predicate)
    for index, value in pairs(toCheck) do
		if not predicate(index, value) then
			return false
		end
	end

    return true
end