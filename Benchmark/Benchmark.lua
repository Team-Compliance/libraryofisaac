--- Helper function to benchmark the performance of a function.
--- This function is variadic, which means that you can supply as many functions as you want to
--- benchmark.
---
--- This function uses the `Isaac.GetTime` method to record how long the function took to execute.
--- This method only reports time in milliseconds. For this reason, if you are benchmarking smaller
--- functions, then you should provide a very high value for the number of trials.
---@param numTrials integer
---@vararg function
---@return number[] @ A table containing the average time in milliseconds for each function (this will be printed in the log)
function TSIL.Benchmark.Benchmark(numTrials, ...)
    local functions = {...}

    TSIL.Log.Log("Benchmarking " .. #functions .. " function(s) with " .. numTrials .. " trials.")

    ---@type number[]
    local averages = {}

    for i, v in pairs(functions) do
        local totalTimeInMilliseconds = 0

        for i = 1, numTrials do
            local startTimeInMilliseconds = Isaac.GetTime()
            v()
            local endTimeInMilliseconds = Isaac.GetTime()
            local elapsedTimeMilliseconds = endTimeInMilliseconds - startTimeInMilliseconds
            totalTimeInMilliseconds = totalTimeInMilliseconds + elapsedTimeMilliseconds
        end

        local averageTimeMilliseconds = totalTimeInMilliseconds / numTrials
        TSIL.Log.Log("The average time of the function at index " .. i .. " is: " .. averageTimeMilliseconds .. " milliseconds")
        table.insert(averages, averageTimeMilliseconds)
    end

    return averages
end