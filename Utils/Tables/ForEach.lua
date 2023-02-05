--- Executes a function for each key-value pair of a table
---@generic T:any
---@param toIterate T[] 
---@param funct fun(index: string|integer, value:T)
function TSIL.Utils.Tables.ForEach(toIterate, funct)
	for index, value in pairs(toIterate) do
		funct(index, value)
	end
end