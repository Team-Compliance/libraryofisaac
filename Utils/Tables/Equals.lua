--- Helper function for determining if two arrays contain the exact same elements. 
---@generic T: any
---@param table1 T[]
---@param table2 T[]
---@return boolean
function TSIL.Utils.Tables.Equals(table1, table2)
	if #table1 ~= #table2 then
		return false
	end

	for i, v in pairs(table1) do
		local table2Element = table2[i]

		if type(table2Element) == "table" and type(v) == "table" then
			local isTableMatching = TSIL.Utils.Tables.Equals(table2Element, v)
			if not isTableMatching then
				return false
			end
		elseif table2Element ~= v then
			return false
		end
	end

	return true
end

