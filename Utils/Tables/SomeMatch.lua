--- Runs the provided callback for the provided table. Returns true if the callback returns true for
--- at least one element in the table.
---@generic K
---@generic V
---@param tbl table<K, V>
---@param predicate fun(value: V, index: K, tbl: table<K, V>): boolean
---@return boolean
function TSIL.Utils.Tables.Some(tbl, predicate)
	for k, v in pairs(tbl) do
		if predicate(v, k, tbl) then
			return true
		end
	end

	return false
end
