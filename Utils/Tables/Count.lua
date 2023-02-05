--- Counts how many elements are on a given table that match a predicate.
--- 
--- If no predicate is given, it'll count all the elements.
---@generic T:any
---@param toCount T[]
---@param predicate fun(key: integer | string, value: T): boolean @Default: foo() -> true
---@return integer
function TSIL.Utils.Tables.Count(toCount, predicate)
	if predicate == nil then
		predicate = function() return true end
   end

	local filtered = TSIL.Utils.Tables.Filter(toCount, predicate)

	local count = 0
	for _, _ in pairs(filtered) do
		count = count + 1
	end

	return count
end