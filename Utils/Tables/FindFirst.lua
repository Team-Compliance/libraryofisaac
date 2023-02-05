--- Returns the first value of a table that matches a given predicate.
--- 
--- If it doesn't find any, it returns nil.
---@generic T : any
---@param toFind T[]
---@param predicate fun(key: integer | string, value: T): boolean
---@return T?
function TSIL.Utils.Tables.FindFirst(toFind, predicate)
	for index, value in pairs(toFind) do
		if predicate(index, value) then
			return value
		end
	end

	return nil
end