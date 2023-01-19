---Helper function to count all the set bits in a mask
---@param mask integer
---@return integer
function TSIL.Utils.Flags.CountBits(mask)
    local total = 0

    while mask ~= 0 do
        total = total + 1
        mask = mask & mask - 1
    end

    return total
end