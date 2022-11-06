local COIN_SUB_TYPE_TO_VALUE = {
    [CoinSubType.COIN_PENNY] = 1,
    [CoinSubType.COIN_NICKEL] = 5,
    [CoinSubType.COIN_DIME] = 10,
    [CoinSubType.COIN_DOUBLEPACK] = 2,
    [CoinSubType.COIN_LUCKYPENNY] = 1,
    [CoinSubType.COIN_STICKYNICKEL] = 5,
    [CoinSubType.COIN_GOLDEN] = 1,
}


---Helper function to get the corresponding coin amount from a `CoinSubType`. Returns 1 for modded sub-types.
---@param coinSubType CoinSubType
---@return integer
function TSIL.Pickups.GetCoinValue(coinSubType)
    local coinValue = COIN_SUB_TYPE_TO_VALUE[coinSubType]

    if not coinValue then return 1 end
    return coinValue
end