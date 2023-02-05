# Benchmark

## Overview

| Return Value | Function |
| - | - |
| number\[] | [Benchmark](benchmark.md#benchmark)(`integer` numTrials, `function` ...) |

## Functions

### Benchmark()

`number[] Benchmark(integer numTrials, function ...)`

Helper function to benchmark the performance of a function. This function is variadic, which means that you can supply as many functions as you want to benchmark. 
This function uses the `Isaac.GetTime` method to record how long the function took to execute. This method only reports time in milliseconds. For this reason, if you are benchmarking smaller functions, then you should provide a very high value for the number of trials. 

