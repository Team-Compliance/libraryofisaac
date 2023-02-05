--- Returns whether a given element is on a table
---@generic T:any
---@param list T[]
---@param element T
---@return boolean
function TSIL.Utils.Tables.IsIn(list, element)
	local found = TSIL.Utils.Tables.FindFirst(list, function (_, value)
		if type(value) == "table" and type(element) == "table" then
			return TSIL.Utils.Tables.Equals(value, element)
		else
			return element == value
		end
	end)

	return found ~= nil
end