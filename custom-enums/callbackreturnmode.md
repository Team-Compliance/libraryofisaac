# CallbackReturnMode



| NONE           | 0 | Returning a value doesn't affect the other callbacks.                                                  |
| -------------- | - | ------------------------------------------------------------------------------------------------------ |
| SKIP\_NEXT     | 1 | Returning a non-nil value will skip the rest of the callbacks. ​                                       |
| LAST\_WINS     | 2 | Returning a value doesn't affect the other callbacks. The last one that returns a non-nil​ value wins. |
| NEXT\_ARGUMENT | 3 | Returning a non-nil value makes it the argument for the next callbacks.                                |
