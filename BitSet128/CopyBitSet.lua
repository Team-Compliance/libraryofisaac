---Helper function to copy a `BitSet128` Isaac API class.
---@param bitSet128 BitSet128
---@return BitSet128
function TSIL.BitSet128.CopyBitSet128(bitSet128)
    if not TSIL.IsaacAPIClass.IsBitSet128(bitSet128) then
        error("Failed to copy a BitSet128 object since the provided object was not a userdata BitSet128 class.")
    end

    local lowBits = bitSet128.l
    local highBits = bitSet128.h
    return BitSet128(lowBits, highBits)
end