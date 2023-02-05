# Tables

## Overview

| Return Value | Function |
| - | - |
| boolean | [All](tables.md#all)(`T[]` toCheck, `fun(key: integer | string, value:  T)` predicate) |
| table<T, boolean> | [ConstructDictionaryFromTable](tables.md#constructdictionaryfromtable)(`T[]` oldTable) |
| table | [Copy](tables.md#copy)(`table` toCopy) |
| void | [CopyUserdataValuesToTable](tables.md#copyuserdatavaluestotable)(`unknown` object, `string[]` keys, `table<string, unknown>` map) |
| integer | [Count](tables.md#count)(`T[]` toCount, `fun(key: integer | string, value:  T)` predicate =  foo() -> true) |
| boolean | [Equals](tables.md#equals)(`T[]` table1, `T[]` table2) |
| T\[] | [Filter](tables.md#filter)(`T[]` toFilter, `fun(key: integer | string, value:  T)` predicate) |
| T? | [FindFirst](tables.md#findfirst)(`T[]` toFind, `fun(key: integer | string, value:  T)` predicate) |
| void | [ForEach](tables.md#foreach)(`T[]` toIterate, `fun(index: string | integer, value: T)` funct) |
| K\[] | [GetDictionaryKeys](tables.md#getdictionarykeys)(`table<K, V>` dictionary) |
| number\[] | [GetNumbersFromTable](tables.md#getnumbersfromtable)(`table<string, unknown>` map, `string` objectName, `string` ...) |
| boolean | [IsArray](tables.md#isarray)(`unknown` object) |
| boolean | [IsEmpty](tables.md#isempty)(`table` map) |
| boolean | [IsIn](tables.md#isin)(`T[]` list, `T` element) |
| void | [IterateTableInOrder](tables.md#iteratetableinorder)(`table<K, V>` map, `fun(key:  K, value:  V)` func, `boolean?` inOrder? =  true ) |
| S\[] | [Map](tables.md#map)(`T[]` list, `fun(index: string | integer, value: T)` funct) |
| void | [Merge](tables.md#merge)(`table<any, unknown>` oldObject, `table<any, unknown>` newTable) |
| T\[] | [Remove](tables.md#remove)(`T[]` originalTable, `any` ...) |
| T\[] | [RemoveAll](tables.md#removeall)(`T[]` originalTable, `any` ...) |
| boolean # True if one or more elements were removed, false otherwise. | [RemoveAllInPlace](tables.md#removeallinplace)(`T[]` originalTable, `any` ...) |
| boolean | [RemoveInPlace](tables.md#removeinplace)(`any` originalTable, `any` ...) |
| void | [TableHasKeys](tables.md#tablehaskeys)(`table<any, unknown>` map, `string` ...) |

## Functions

### All()

`boolean All(T[] toCheck, fun(key: integer | string, value:  T) predicate)`

Helper function to check if all the elements of a table match a given predicate. 

### ConstructDictionaryFromTable()

`table<T, boolean> ConstructDictionaryFromTable(T[] oldTable)`

Constructs a dictionary from a table. Note that the value of each key is set to true. 

### Copy()

`table Copy(table toCopy)`

Returns a safe copy of a table. 
It copies the tables inside it recursively. 

### CopyUserdataValuesToTable()

`void CopyUserdataValuesToTable(unknown object, string[] keys, table<string, unknown> map)`

Helper function to copy specific values from a userdata to a table. 

### Count()

`integer Count(T[] toCount, fun(key: integer | string, value:  T) predicate =  foo() -> true)`

Counts how many elements are on a given table that match a predicate. 
If no predicate is given, it'll count all the elements. 

### Equals()

`boolean Equals(T[] table1, T[] table2)`

Helper function for determining if two arrays contain the exact same elements. 

### Filter()

`T[] Filter(T[] toFilter, fun(key: integer | string, value:  T) predicate)`

Filters a table given a predicate 

### FindFirst()

`T? FindFirst(T[] toFind, fun(key: integer | string, value:  T) predicate)`

Returns the first value of a table that matches a given predicate. 
If it doesn't find any, it returns nil. 

### ForEach()

`void ForEach(T[] toIterate, fun(index: string | integer, value: T) funct)`

Executes a function for each key-value pair of a table 

### GetDictionaryKeys()

`K[] GetDictionaryKeys(table<K, V> dictionary)`

Returns a list of keys a dictionary has. 

### GetNumbersFromTable()

`number[] GetNumbersFromTable(table<string, unknown> map, string objectName, string ...)`

Helper function to safely get number values from specific keys on a Lua table. Will throw an error if the specific value does not exist on the table or if it cannot be converted to a number. 
This function is variadic, meaning that you can specify N arguments to get N values. 

### IsArray()

`boolean IsArray(unknown object)`

Returns if the provided table is an array. This is a workaround as Lua has no formal way to differentiate between a normal array and a map. 

### IsEmpty()

`boolean IsEmpty(table map)`

Helper function to check if a table is empty. Use this instead of checking for a size of 0 with the `#` operator since this will take into account dictionaries. 

### IsIn()

`boolean IsIn(T[] list, T element)`

Returns whether a given element is on a table 

### IterateTableInOrder()

`void IterateTableInOrder(table<K, V> map, fun(key:  K, value:  V) func, boolean? inOrder? =  true )`

Helper function to iterate over a table deterministically. This is useful because by default, the `pairs` function will return the keys of a Lua table in a random order. 
This function will sort the table entries based on the value of the key. 
This function will only work on tables that have number keys or string keys. It will throw a run-time error if it encounters a key of another type. 

### Map()

`S[] Map(T[] list, fun(index: string | integer, value: T) funct)`

Creates a new table where each element is the result of applying a given function to each element of the provided list. 

### Merge()

`void Merge(table<any, unknown> oldObject, table<any, unknown> newTable)`

Takes the values from a new table and recursively merges them into an old object (while performing appropriate deserialization). 
This function is used to merge incoming data from the "save#.dat" file into a mod's variables. Merging is useful instead of blowing away a table entirely because mod code often relies on the local table/object references. deserialization on the objects within. In other words, unlike the `DeepCopy` function, the This function always assumes that the new table is serialized data and will attempt to perform `Merge` function will always operates in the mode of `SerializationType.DESERIALIZE`. For the types of objects that will be deserialized, see the documentation for the `DeepCopy` function. 
This function does not iterate over the old object, like you would naively expect. This is because it is common for a variable to have a type of `something | nil`. If this is the case, the key would not appear when iterating over the old object. Thus, we must instead iterate over the new object and copy the values backwards. The consequence of this is that `Merge` can copy over old variables that are no longer used in the code, or copy over old variables of a different type, which can cause run-time errors. In such cases, users will have to manually delete their save data. 

### Remove()

`T[] Remove(T[] originalTable, any ...)`

Shallow copies and removes the specified element(s) from the table. Returns the copied table. If the specified element(s) are not found in the table, it will simply return a shallow copy of the table. 
This function is variadic, meaning that you can specify N arguments to remove N elements. 
If there is more than one matching element in the table, this function will only remove the first matching element. If you want to remove all of the elements, use the `RemoveAll` function instead. 

### RemoveAll()

`T[] RemoveAll(T[] originalTable, any ...)`

Shallow copies and removes the specified element(s) from the table. Returns the copied table. If the specified element(s) are not found in the table, it will simply return a shallow copy of the table. 
This function is variadic, meaning that you can specify N arguments to remove N elements. 
If there is more than one matching element in the table, this function will remove every matching element. If you want to only remove the first matching element, use the `Remove` function instead. 

### RemoveAllInPlace()

`boolean # True if one or more elements were removed, false otherwise. RemoveAllInPlace(T[] originalTable, any ...)`

Removes all of the specified element(s) from the table. If the specified element(s) are not found in the table, this function will do nothing. 
This function is variadic, meaning that you can specify N arguments to remove N elements. 
If there is more than one matching element in the table, this function will remove every matching element. If you want to only remove the first matching element, use the `RemoveInPlace` function instead. 

### RemoveInPlace()

`boolean RemoveInPlace(any originalTable, any ...)`

Removes the specified element(s) from the table. If the specified element(s) are not found in the table, this function will do nothing. 
This function is variadic, meaning that you can specify N arguments to remove N elements. 
If there is more than one matching element in the table, this function will only remove the first matching element. If you want to remove all of the elements, use the `RemoveAllInPlace` function instead. 

### TableHasKeys()

`void TableHasKeys(table<any, unknown> map, string ...)`

Helper function to check if a Lua table has all of the provided keys. This function is variadic, meaning that you can specify as many arguments as you want to check for. 

