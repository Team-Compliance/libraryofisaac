# String

## Overview

| Return Value | Function |
| - | - |
| boolean | [EndsWith](string.md#endswith)()`string` s, `string` suffix) |
| string\[] | [Split](string.md#split)()`string` s, `string` separator) |
| boolean | [StartsWith](string.md#startswith)()`string` s, `string` prefix) |
| string | [TrimPrefix](string.md#trimprefix)()`string` s, `string` prefix) |

## Functions

### EndsWith()

`boolean EndsWith(string s, string suffix)`

Helper function to check if a string ends  with a given suffix. 

### Split()

`string[] Split(string s, string separator)`

Helper function that splits a string into parts based on the given separator. 
For example, splitting the string "Hello there, world!" with separator " " will return ["Hello", "there,", "world!"] 

### StartsWith()

`boolean StartsWith(string s, string prefix)`

Helper function to check if a string starts with a given prefix. 

### TrimPrefix()

`string TrimPrefix(string s, string prefix)`

Helper function to remove a given prefix from a string. 

