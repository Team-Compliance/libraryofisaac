--- Returns a safe copy of a table.
--- 
--- It copies the tables inside it recursively.
---@param toCopy table
---@return table
function TSIL.Utils.Tables.Copy(toCopy)
	local copy = {}
	for index, value in pairs(toCopy) do
		if type(value) == "table" then
			copy[index] = TSIL.Utils.Tables.Copy(value)
		else
			copy[index] = value
		end
	end

	return copy
end