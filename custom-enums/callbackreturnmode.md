# CallbackReturnMode

Used when registering a custom callback using `TSIL.__RegisterCustomCallback()`. 
Defines how the returned values of the executed functions will be treated and what value is returned by `TSIL.__TriggerCustomCallback()`. 

| Enumerator | Value | Description |
| - | - | - |
| NONE | 0 | Returned values are ignored  |
| SKIP_NEXT | 1 | When a function returns a non nil value the rest are skipped.  |
| LAST_WINS | 2 | The last function to return a non nil value overwrites all other returned values  |
| NEXT_ARGUMENT | 3 | When a function returns a non nil value, the returned value is used as the first argument for the next functions. If a table is returned, the first element of the table will be the first argument, the second element will be the second argument, etc.  |
