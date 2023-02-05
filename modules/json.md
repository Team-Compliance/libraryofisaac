# JSON

## Overview

| Return Value | Function |
| - | - |
| unknown | [Decode](json.md#decode)(`any` str) |
| string | [Encode](json.md#encode)(`any` val) |

## Functions

### Decode()

`unknown Decode(any str)`

Converts a JSON string to a Lua table. 
In most cases, this function will be used for reading data from a "save#.dat" file. If decoding fails, it will return a blank Lua table instead of throwing an error. (This allows execution to continue in cases where users have no current save data or have manually removed their existing save data.) 
Under the hood, this uses a custom JSON parser that was measured to be 11.8 times faster than the vanilla JSON parser. 

### Encode()

`string Encode(any val)`

Converts a Lua table to a JSON string. 
In most cases, this function will be used for writing data to a "save#.dat" file. If encoding fails, it will throw an error to prevent writing a blank string or corrupted data to a user's "save#.dat" file. 
Under the hood, this uses a custom JSON parser that was measured to be 11.8 times faster than the vanilla JSON parser. 

