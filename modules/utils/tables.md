# Tables

## Overview

| Return Value  | Function                                                                                                         |
| ------------- | ---------------------------------------------------------------------------------------------------------------- |
| \<T, boolean> | [ConstructDictionaryFromTable](tables.md#constructdictionaryfromtable)(`T[]` oldTable)                           |
| table         | [Copy](tables.md#copy)(`table` toCopy)                                                                           |
| integer       | [Count](tables.md#count)(`T[]` toCount, `fun(key: integer \| string, value: T): boolean` predicate = fun():true) |
| boolean       | [Equals](tables.md#equals)(`T[]` table1, `T[]` table2)                                                           |
| T\[]          | [Filter](tables.md#filter)(`T[]` toFilter, `fun(key: integer \| string, value: T): boolean` predicate)           |
| T?            | [FindFirst](tables.md#findfirst)(`T[]` toFind, `fun(key: integer \| string, value: T): boolean` predicate)       |
| void          | [ForEach](tables.md#foreach)(`T[]` toIterate, `fun(index: string\|integer, value:T)` funct)                      |
| boolean       | [IsIn](tables.md#isin)(`T[]` list, `T` element)                                                                  |
| S\[]          | [Map](tables.md#map)(`T[]` list, `fun(index: string\|integer, value:T) : S` funct)                               |
| T\[]          | [Remove](tables.md#remove)(`T[]` originalTable, `any` ...)                                                       |
| T\[]          | [RemoveAll](tables.md#removeall)(`T[]` originalTable, `any` ...)                                                 |
| boolean       | [RemoveAllInPlace](tables.md#removeallinplace)(`T[]` originalTable, `any` ...)                                   |
| boolean       | [RemoveInPlace](tables.md#removeinplace)(`T[]` originalTable, `any` ...)                                         |

## Functions

### ConstructDictionaryFromTable()

`<T, boolean> ConstructDictionaryFromTable(T[] oldTable)`

Constructs a dictionary from a table. Note that the value of each key is set to true.

### Copy()

`table Copy(table toCopy)`

Returns a safe copy of a table. Copies the tables inside it recursively.

### Count()

`integer Count(T[] toCount, fun(key: integer | string, value: T): boolean predicate = fun():true)`

Counts how many elements are on a given table that match a predicate. If no predicate is given, it'll count all the elements.

This is useful because the # operator will not work properly if your table skips some indexes.

### Equals()

`boolean Equals(T[] table1, T[] table2)`

Helper function for determining if two arrays contain the exact same elements.

### Filter()

`T[] Filter(T[] toFilter, fun(key: integer | string, value: T): boolean predicate)`

Filters a table given a predicate.

### FindFirst()

`T? FindFirst(T[] toFind, fun(key: integer | string, value: T): boolean predicate)`

Returns the first value of a table that matches a given predicate. If it doesn't find any, it returns nil.

### ForEach()

`void ForEach(T[] toIterate, fun(index: string|integer, value:T) funct)`

Executes a function for each key-value pair of a table.

### IsIn()

`boolean IsIn(T[] list, T element)`

Returns whether a given element is on a table.

### Map()

`S[] Map(T[] list, fun(index: string|integer, value:T) : S funct)`

Creates a new table where each element is the result of applying a given function to each element of the provided list.

### Remove()

`T[] Remove(T[] originalTable, any ...)`

Shallow copies and removes the specified element(s) from the table. Returns the copied table. If the specified element(s) are not found in the table, it will simply return a shallow copy of the table.

This function is variadic, meaning that you can specify N arguments to remove N elements.

If there is more than one matching element in the table, this function will only remove the first matching element. If you want to remove all of the elements, use the [`RemoveAll` ](tables.md#removeall)function instead.

### RemoveAll()

`T[] RemoveAll(T[] originalTable, any ...)`

Shallow copies and removes the specified element(s) from the table. Returns the copied table. If the specified element(s) are not found in the table, it will simply return a shallow copy of the table.

This function is variadic, meaning that you can specify N arguments to remove N elements.

If there is more than one matching element in the table, this function will remove every matching element. If you want to only remove the first matching element, use the [`Remove` ](tables.md#remove)function instead.

### RemoveAllInPlace()

`boolean RemoveAllInPlace(T[] originalTable, any ...)`

Removes all of the specified element(s) from the table. If the specified element(s) are not found in the table, this function will do nothing.

This function is variadic, meaning that you can specify N arguments to remove N elements.

If there is more than one matching element in the table, this function will remove every matching element. If you want to only remove the first matching element, use the [`RemoveInPlace` ](tables.md#removeinplace)function instead.

### RemoveInPlace()

`boolean RemoveInPlace(T[] originalTable, any ...)`

Removes the specified element(s) from the table. If the specified element(s) are not found in the table, this function will do nothing.

This function is variadic, meaning that you can specify N arguments to remove N elements.

If there is more than one matching element in the table, this function will only remove the first matching element. If you want to remove all of the elements, use the [`RemoveAllInPlace` ](tables.md#removeallinplace)function instead.
