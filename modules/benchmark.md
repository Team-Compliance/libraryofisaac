---
description: Functions used to help test the performance of your code.
---

# Benchmark

## Overview

| Return Value | Function                                                                 |
| ------------ | ------------------------------------------------------------------------ |
| number\[]    | [Benchmark](benchmark.md#benchmark)(`integer` numTrials, `function` ...) |

## Functions

### Benchmark()

`number[] BenchMark(integer numTrials, function ...)`

Helper function to benchmark the performance of a function. This function is variadic, which means that you can supply as many functions as you want to benchmark.

This function uses the [Isaac.GetTime()](https://wofsauge.github.io/IsaacDocs/rep/Isaac.html#gettime) method to record how long the function took to execute. This method only reports time in milliseconds. For this reason, if you are benchmarking smaller functions, then you should provide a very high value for the number of trials.

It returns a table containing the average time in milliseconds for each function, which will also be printed in the log.
