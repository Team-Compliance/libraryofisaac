--- Filters a table given a predicate
---@generic T:any
---@param toFilter T[]
---@param predicate fun(key: integer | string, value: T): boolean
---@return T[]
function TSIL.Utils.Tables.Filter(toFilter, predicate)
	local filtered = {}	

	for index, value in pairs(toFilter) do
		if predicate(index, value) then
			filtered[#filtered+1] = value
		end
	end

	return filtered
end