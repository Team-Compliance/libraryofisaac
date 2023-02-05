--- Shallow copies and removes the specified element(s) from the table. Returns the copied table. If
--- the specified element(s) are not found in the table, it will simply return a shallow copy of the
--- table.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
--- 
--- If there is more than one matching element in the table, this function will only remove the first
--- matching element. If you want to remove all of the elements, use the `RemoveAll` function
--- instead.
---@generic T 
---@param originalTable T[]
---@vararg any
---@return T[]
function TSIL.Utils.Tables.Remove(originalTable, ...)
	local copiedTable = TSIL.Utils.Tables.Copy(originalTable)
	TSIL.Utils.Tables.RemoveInPlace(copiedTable, ...)
	return copiedTable
end

--- Shallow copies and removes the specified element(s) from the table. Returns the copied table. If
--- the specified element(s) are not found in the table, it will simply return a shallow copy of the
--- table.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
--- 
--- If there is more than one matching element in the table, this function will remove every matching
--- element. If you want to only remove the first matching element, use the `Remove` function instead.
---@generic T 
---@param originalTable T[]
---@vararg any
---@return T[]
function TSIL.Utils.Tables.RemoveAll(originalTable, ...)
	local copiedTable = TSIL.Utils.Tables.Copy(originalTable)
	TSIL.Utils.Tables.RemoveAllInPlace(copiedTable, ...)
	return copiedTable
end

--- Removes all of the specified element(s) from the table. If the specified element(s) are not found
--- in the table, this function will do nothing.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
--- 
--- If there is more than one matching element in the table, this function will remove every matching
--- element. If you want to only remove the first matching element, use the `RemoveInPlace`
--- function instead.
---@generic T 
---@param originalTable T[]
---@vararg any
---@return boolean # True if one or more elements were removed, false otherwise. 
function TSIL.Utils.Tables.RemoveAllInPlace(originalTable, ...)
	local removedElement = false
	for _, elementToRemove in pairs({...}) do
		for tableIndex, tableElement in pairs(originalTable) do
			if tableElement == elementToRemove then
				removedElement = true
				table.remove(originalTable, tableIndex)
			end
		end
	end
	
	return removedElement
end

--- Removes the specified element(s) from the table. If the specified element(s) are not found in the
--- table, this function will do nothing.
--- 
--- This function is variadic, meaning that you can specify N arguments to remove N elements.
---  
--- If there is more than one matching element in the table, this function will only remove the first
--- matching element. If you want to remove all of the elements, use the `RemoveAllInPlace` function
--- instead.
---@param originalTable any
---@vararg any
---@return boolean @True if one or more elements were removed, false otherwise. 
function TSIL.Utils.Tables.RemoveInPlace(originalTable, ...)
	local removedElement = false

	for _, elementToRemove in pairs({...}) do
		for tableIndex, tableElement in pairs(originalTable) do
			if tableElement == elementToRemove then
				table.remove(originalTable, tableIndex)
				removedElement = true
				break
			end
		end
	end

	return removedElement
end
